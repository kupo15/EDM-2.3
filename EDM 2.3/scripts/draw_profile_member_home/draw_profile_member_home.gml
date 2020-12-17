function draw_profile_member_create() {
	
draw_profile_view();	

//{
//	memberID: ind,
//	firstName: first_name,
//	lastName: last_name,
//	phone: -1,
//	dateJoined: current_datetime,

//	location: {
//		
//		address: -1,
//		state: -1,		
//		}
//		
//	groups: [],
//	
//	stat: [],
//}

}

function draw_profile_member_view() {
	
// BUILD SURFACES //

// header
var show_trash = pick(headerType.none,headerType.trash,subheader_member == 0);
if surface_set_struct("header")
	{
	element_header_draw(headerType.back,show_trash,"Member Details");
	surface_reset_target();
	}
	
// set offsets
var scrollbar_index = offsetScroll.groupsOffset;
var groupslist_offset = offsetArray[scrollbar_index];
var source_array = workingStruct.groups;

var xx = 0;
var yy = subheader_ypos_end;
var ww = app_width;
var hh = app_height-yy;
var sep = py(16.67);
var height = py(6.25);
var off_pos = groupslist_offset*sep;
var ypos = yy-off_pos;
var surf_hh = app_height;


//for(var i=0;i<3;i++)
	{
	switch subheader_member
		{
		case 0: draw_profile_member_details_draw(); 
				draw_profile_member_details_step();
				break;
				
		case 1: draw_profile_member_stats_draw();
				draw_profile_member_stats_step();
				break;
		
		case 2: draw_profile_member_groups_draw(xx,0,ww,off_pos,surf_hh,sep,height,source_array); // build surface
				surface_draw_struct("scrollVert",-1,0,yy,1,off_pos,surf_hh); // draw surface
				
				// clicking
				draw_profile_member_groups_step(xx,yy,ww,hh,sep,surf_hh,source_array,source_array,groupslist_offset,scrollbar_index); // click surface
				break;
		}

//	surface_reset_target();
	}

// DRAW SURFACES //	
	
// header
surface_draw_struct("header",0,0,0,1);	
	
#region sub header
var sort_index = subheader_member;
var header_arr = ["Details","Stats","Groups"];
var offset = offsetArray[offsetScroll.memberProfileUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,app_width,1,header_arr);
if (header != undefined)
	{
	subheader_member = header;
	scr_surface_rebuild_struct("header",0);
	}

#endregion

//var scroll_xx = 0; //offset*app_width;
//var scroll_yy =




//if subheader_member == 2
//surface_draw_struct("scrollVert",-1,scroll_xx,scroll_yy,1,memberslist_offset*sep,surf_hh);
	
// CLICKING //

if element_header_step() == headerType.trash
	{
	array_delete(MEMBER_database,member_index,1); // delete from main database
	androidBack = true;
	subheader_member = -4;
	}
		
	
if androidBack
&& !kvActive
&& submenu == navbar.hidden
	{
//	if screenIndex == screen.profileCreate
//		{
//		array_delete(ROOT_data_struct.profiles,activeProfile,1); // delete
//		scr_profile_set(0);
//		}

	// go back a header screen
	if subheader_member != -4
	subheader_member = pick(0,-1,subheader_member == 0);
	
	if subheader_member >= 0
	exit;

	// save struct
	if subheader_member == -1
	MEMBER_database[member_index] = struct_undo_pop(workingStruct,true);

	// reset
	member_index = undefined;
	member_struct = undefined;
	
	activeStruct = undefined;
	workingStruct = undefined;

	// navigation
	screen_goto_prev();
	
	app_save;
	}
}