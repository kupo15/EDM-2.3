function ini_screen_changeGOTO() {
};
enumGOTO();

function ini_screen_change() {

prevScreenStack = ds_list_create();
	
drawScreen[screen.eventSetup] = draw_event_setup_split;
drawScreen[screen.eventReview] = draw_event_setup_review;

drawScreen[screen.home] = draw_home;
drawScreen[screen.membersList] = draw_members_list_screen;
//drawScreen[screen.stats] = draw_stats;
//drawScreen[screen.blank8] = undefined

//drawScreen[screen.help_info] = draw_help_info;
drawScreen[screen.settings] = undefined;
drawScreen[screen.enumcount] = draw_undefScreen;

drawScreen[screen.profileCreate] = draw_profile_create;
drawScreen[screen.profileView] = draw_profile_view;

drawScreen[screen.memberProfileEdit] = draw_profile_member_create;
drawScreen[screen.memberProfileView] = draw_profile_member_view;

drawScreen[screen.edit_date] = draw_date_edit_calendar;	
}

function screen_change(ind,sub,clear) {
/// @param screenIndex
/// @param [submenu
/// @param clear]

if argument[1] == undefined
sub = submenu;

if argument[2] == undefined
clear = false;

var arr = [screenIndex,submenu]; 

ds_list_push(prevScreenStack,arr); // add current screen and submenu to the stack

// change to new screen
if (drawScreen[ind] == 0) || (drawScreen[ind] == undefined)
screenIndex = screen.enumcount;
else
screenIndex = ind;

submenu = sub;

// clear the prev screen stack
if clear
ds_list_clear(prevScreenStack);

screen_goto_actions();
}

function screen_goto_prev(subIndex) {
/// @param [submen]

if argument[0] != undefined
submenu = subIndex;

highlight_struct.activeScreen = screenIndex;

if ds_list_empty(prevScreenStack)
	{
	screenIndex = screen.home;
	db("stack empty");
	}
else
	{
	var arr = ds_list_pop(prevScreenStack);
	screenIndex = arr[0];
	submenu = arr[1];
	}

//screen_goto_actions();
scr_surface_rebuild_struct();
vk_hide();

return screenIndex; // return previous screen
}

function screen_goto_actions() {

scr_surface_rebuild_struct();
vk_hide();

switch screenIndex
	{
	case screen.enumcount: submenu = navbar.hidden; break;
					
	case screen.eventSetup: scr_memberlist_sort(MEMBER_list,member_sort.abc);
							event_entrant_array = struct_copy(MEMBER_list);
							scr_memberlist_sort(event_entrant_array,member_sort.favorite);
							
							// set all team assignments to undefined
							var size = array_length(event_entrant_array)
							for(var i=0;i<size;i++)
							event_entrant_array[i].team = undefined;
							
							scr_event_create();
							break;
					
	// member list
	case screen.membersList: scr_memberlist_sort(MEMBER_list,META_data.memberSort); break;		
	
	// venue profile
	case screen.profileView: workingStruct = struct_copy(PROFILE_data);
							 activeStruct = workingStruct;
							 break;	
	
	// member profile
	case screen.memberProfileView: subheader_member = 0;
								   scrollbar_set(offsetScroll.memberProfileUnderline,0,true);
								   break;	
	}	
	
searched_name = "";
transitionReady = 0;
}