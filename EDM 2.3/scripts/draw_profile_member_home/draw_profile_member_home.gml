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
#region header
var show_trash = pick(headerType.none,headerType.trash,subheader_member == 0);
var trash = draw_screen_header(headerType.back,show_trash,"Member Details");

if trash
	{
	array_delete(MEMBER_database,member_index,1); // delete
	androidBack = true;
	subheader_member = -4;
	}
	
	
// sub header
var sort_index = subheader_member;
var header_arr = ["Details","Stats","Groups"];
var offset = offsetArray[offsetScroll.memberProfileUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,app_width,1,header_arr);
if (header != undefined)
subheader_member = header;

#endregion

switch subheader_member
	{
	case 0: draw_profile_member_details(); break;
	case 1: draw_profile_member_stats(); break;
	case 2: draw_profile_member_groups(); break;
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