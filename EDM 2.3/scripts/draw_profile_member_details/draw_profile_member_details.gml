function draw_profile_member_details() {


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
var name_entry = draw_overlay_popup_entry("Enter ",label_arr,textboxEntry.memberFirstName,activeStruct.firstName,-1);
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