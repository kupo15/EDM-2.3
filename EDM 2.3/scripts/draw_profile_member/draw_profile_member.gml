function draw_profile_member_create() {
	
draw_profile_view();	

//{
//	memberID: ind,
//	firstName: first_name,
//	lastName: last_name,
//	
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

activeStruct = workingStruct;

var member_id = activeStruct.memberID;
var first_name = activeStruct.firstName;
var last_name = activeStruct.lastName;

#region draw name
var xx = pct_x(3.125);
var yy = subheader_ypos_end;
var sep = pct_y(13);
var label_height = pct_y(4);
var height = pct_y(7);

draw_text_height(xx,yy,"First Name",label_height);
draw_text_height(xx,yy+pct_y(4.5),first_name,height); // first

draw_line_pixel(pct_x(5),yy+sep,app_width-pct_x(5),1,c_lt_gray,1);
draw_icon_height(ico_edit,0,pct_x(90),yy+pct_y(5),pct_y(4),1); // edit icon

if click_region_released(0,yy,app_width,sep,true,navbar.hidden,1)
	{
	click_textbox_set(first_name,textboxEntry.popupEntryText,kbv_type_default);
	submenu = navbar.popupEntry;
	}
#endregion

#region header
var trash = draw_screen_header(headerType.back,headerType.trash,"Member Details");

if trash
	{
	array_delete(MEMBER_database,member_index,1); // delete
	androidBack = true;
	}
	
	
// sub header
var sort_index = subheader_member;
var offset = offsetArray[offsetScroll.memberProfileUnderline];
var header = draw_screen_header_submenu(offset,sort_index,"Details","Stats","Groups");
if (header != undefined)
subheader_member = header;

#endregion
	
#region Finished button
var submit = (first_name != "") && (first_name != "");
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	
	app_save;
	
	screen_goto_prev();
	}
	
#endregion

if androidBack
&& !kvActive
&& submenu == navbar.hidden
	{
//	if screenIndex == screen.profileCreate
//		{
//		array_delete(ROOT_data_struct.profiles,activeProfile,1); // delete
//		scr_profile_set(0);
//		}

	// reset
	member_index = undefined;
	member_struct = undefined;
	
	activeStruct = undefined;
	workingStruct = undefined;

	// navigation
	screen_goto_prev();
	}

var name_entry = draw_overlay_popup_entry("Enter name name",activeStruct.firstName,-1);
if name_entry != undefined
switch textboxIndex
	{
	case textboxEntry.memberFirstName: activeStruct.firstName = name_entry; break;
	case textboxEntry.memberLastName: activeStruct.firstName = name_entry; break;
	case textboxEntry.memberAddress: activeStruct.location.address = name_entry; break;
	case textboxEntry.memberState: activeStruct.location.state = name_entry; break;
	}


}