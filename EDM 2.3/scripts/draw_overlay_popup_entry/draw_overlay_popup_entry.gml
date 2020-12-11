function draw_overlay_popup_entry(label_str,label_arr,first_entry,variable,stringLimit) {
	
var entry_yoff = offsetArray[offsetScroll.entryYoff];
var entry_yoffEnd = pick(entry_yoff,offsetArrayEnd[offsetScroll.entryYoff],offsetArrayEnd[offsetScroll.entryYoff]==1);
var alpha = (entry_yoff/1);

if alpha < 0.1
exit;

// textbox entry
if kvActive
switch textboxIndex
	{
	case textboxEntry.memberState:
	case textboxEntry.memberAddress:
	case textboxEntry.memberLastName:
	case textboxEntry.memberFirstName: variable = string_capitalize(keyboard_string,stringLimit); break;
	
	case textboxEntry.memberPhone: break;
	}
	
var ww = app_width;
var xx = 0;
var hh = pct_y(40);
var yy = app_height-kvHeight-((hh+pct_y(5))*entry_yoffEnd);
var height = pct_y(3.5);

vertex_buffer_entry_overlay_rect(0,yy,ww,hh,c_white,alpha,alpha*0.5);

if clickout_region(xx,yy,ww,hh,false,navbar.popupEntry)
androidBack = true;

// draw
var xx = pct_x(4);
var ww = app_width-(xx*2);
var yoff = pct_y(13);
var height = pct_y(10);

label_str += label_arr[textboxIndex-first_entry];

draw_line_pixel(xx,yy+yoff+(height*1),ww,3,header_color,1); // underline

draw_text_height(xx,yy+pct_y(2.5),label_str,height*0.65); // draw label
draw_text_height_ext_cursor(xx,yy+yoff,variable,"",-1,-1,0,height,textboxEntry.popupEntryText);

if click_region_released(0,yy+yoff,app_width,height*1,true,navbar.popupEntry)
click_textbox_set(variable,0,kbv_type_default);
	
// draw cancel
var xx = pct_x(53);
var yoff = pct_y(28);
var height = pct_y(6);

var button_ww = pct_x(19);
var button_hh = pct_y(11);

if click_button(xx,yy+yoff,"Cancel",height,c_teal,button_ww,button_hh,undefined,false,false,navbar.popupEntry)
androidBack = true;

// draw save
var xx = pct_x(75);
var button_ww = pct_x(19);

if virtual_keyboard_enter ||
click_button(xx,yy+yoff,"Save",height,c_teal,button_ww,button_hh,undefined,false,false,navbar.popupEntry)
	{
	vk_hide(navbar.hidden);
	return variable;
	}
	
if androidBack
submenu = navbar.hidden;

draw_set_alpha(1);

return undefined;
}