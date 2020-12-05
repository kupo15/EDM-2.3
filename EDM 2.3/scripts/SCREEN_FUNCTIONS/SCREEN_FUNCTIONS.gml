function ini_screen_changeGOTO() {
};
enumGOTO();

function ini_screen_change() {

prevScreenStack = ds_list_create();
	
drawScreen[screen.home] = draw_home;
drawScreen[screen.stats] = draw_stats;
drawScreen[screen.playing] = draw_playing;
drawScreen[screen.score_list] = draw_score_list;
drawScreen[screen.course_list] = draw_course_list;
drawScreen[screen.score_card] = draw_score_card;
drawScreen[screen.indexTrend] = draw_index_info;
drawScreen[screen.handicapSeason] = draw_handicap_season;
//drawScreen[screen.blank8] = undefined

drawScreen[screen.help_info] = draw_help_info;
drawScreen[screen.settings] = undefined;
drawScreen[screen.enumcount] = draw_undefScreen;

drawScreen[screen.score_create] = draw_score_create;
drawScreen[screen.edit_score] = undefined; // draw_score_edit;
drawScreen[screen.score_view] = draw_score_view;
drawScreen[screen.score_details] = draw_score_details;

drawScreen[screen.score_card_details] = draw_score_card_details;

drawScreen[screen.profileCreate] = draw_profile_create;
drawScreen[screen.profileView] = draw_profile_view;

drawScreen[screen.playing_score_enter] = draw_playing_score_submit;

drawScreen[screen.create_course] = draw_course_create;
drawScreen[screen.edit_course] = draw_course_view;

drawScreen[screen.edit_tees] = draw_course_edit_tees;
drawScreen[screen.edit_tees_from_teebar] = draw_course_edit_tees_from_teebar;
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

click_highlight_screen = screenIndex;

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

screen_goto_actions();

return screenIndex; // return previous screen
}

function screen_goto_actions() {

vk_hide();

switch screenIndex
	{
	case screen.home: scr_handicap_calculate();
					  submenu = navbar.main;
					  break;
	
	// change to hidden
	case screen.handicapSeason: submenu = navbar.hidden; break;	
	
	// course list
	case screen.course_list: scr_course_list_sort(META_data.courseSort); break;
							 
	// profile
	case screen.profileView: workingStruct = struct_copy(PROFILE_data);
							 activeStruct = workingStruct;
							 break;							
	}	
	
searched_name = "";
transitionReady = 0;
}