function draw_profile_member_details_old() {


activeStruct = workingStruct;

var member_id = activeStruct.memberID;
var first_name = activeStruct.firstName;
var last_name = activeStruct.lastName;

#region draw first name / last name
var ww = app_width*0.5;
var yy = subheader_ypos_end;
var text_xoff = pct_x(1);
var text_yy = yy+pct_y(6);
var sep = pct_y(15);
var label_height = pct_y(4);
var height = pct_y(8);

var xx = pct_x(3.125);

draw_text_height(xx,yy,"First Name",label_height);
draw_text_height(xx+text_xoff,text_yy,first_name,height); // first

// last name
var xx = pct_x(3.125)+ww;

draw_text_height(xx,yy,"Last Name",label_height);
draw_text_height(xx+text_xoff,text_yy,last_name,height); // last

// draw lines
draw_line_pixel(ww,yy+(sep*0.1),1,sep*0.8,c_lt_gray,1); // separating
draw_line_pixel(pct_x(5),yy+sep,ww-pct_x(5),1,c_lt_gray,1); // bottom

// clicking on boxes
for(var i=0;i<2;i++)
if click_region_released(i*ww,yy,ww,sep,true,navbar.hidden,1)
	{
	switch i
		{
		case 0: click_textbox_set(first_name,textboxEntry.memberFirstName,kbv_type_default); break;
		case 1: click_textbox_set(last_name,textboxEntry.memberLastName,kbv_type_default); break;
		}
		
	submenu = navbar.popupEntry;
	}	
	
// draw edit icons
draw_icon_height(ico_edit,0,(1*ww)-pct_x(5),text_yy+pct_y(2),pct_y(4),1); // edit icon
draw_icon_height(ico_edit,0,(2*ww)-pct_x(5),text_yy+pct_y(2),pct_y(4),1); // edit icon
#endregion

var label_arr = ["first name","last name","phone number","address","state"];
var name_entry = draw_overlay_popup_entry("Enter ",label_arr,textboxEntry.memberFirstName,activeStruct.firstName,25);
if name_entry != undefined
switch textboxIndex
	{
	case textboxEntry.memberFirstName: activeStruct.firstName = name_entry; break;
	case textboxEntry.memberLastName: activeStruct.firstName = name_entry; break;
	case textboxEntry.memberPhone: activeStruct.phone = name_entry; break;
	case textboxEntry.memberAddress: activeStruct.location.address = name_entry; break;
	case textboxEntry.memberState: activeStruct.location.state = name_entry; break;
	}



#region Finished button
/*var submit = (first_name != "") && (first_name != "");
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
	*/
#endregion
}

/*
function draw_profile_member_groups_step() {

// set offsets
var scrollbar_index = offsetScroll.groupsOffset;
var groupslist_offset = offsetArray[scrollbar_index];
var groupslist_offset_start = offsetArrayStart[scrollbar_index];
var source_array = workingStruct.groups;

var yy = subheader_ypos_end;
var height = y_pct_y(75);
var sep = y_pct_y(200);
var ww = app_width;
var hh = app_height-yy;

var rows = hh/sep;
var box_hh_end = app_height;

var element_num = 3;

var list_size = array_length(source_array);
var pos_start = floor(groupslist_offset);
var pos_end = min(list_size,ceil(groupslist_offset)+rows);
for(var e=0;e<element_num;e++)
for(var i=0;i<list_size;i++)
	{
	var off_ind = i-groupslist_offset;
	var off_pos = off_ind*sep;
	
	var venue_id = source_array[i];
	
	var group_pointer = database_get_pointer(ROOT_data_struct.profiles,venue_id,"venueID");
	var venue_name = group_pointer.dispName;
	var logo_img = group_pointer.logoID;
	
	switch e
		{
		// venu name
		case 0: draw_text_height_middled_color(pct_x(14),yy+off_pos,venue_name,sep,c_black,height*1.2,1); break;	
		
		// draw line
		case 1:	draw_line_pixel(pct_x(14),yy+off_pos+sep,app_width,1,c_gray,0.7); break;
		
		// venu logo
		case 2: if sprite_exists(logo_img)
				draw_icon_height_centered_color(logo_img,0,pct_x(1.5),yy+off_pos,sep,sep,sep*0.6,c_white,1);
				break;
		}
		
	if (e+1) != element_num
	continue;
	
	click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.hidden,i,undefined,undefined,false)
	}

#region scrolling
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion
}