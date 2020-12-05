function draw_overlay_popup_entry(label_str,variable,stringLimit) {
	
var entry_yoff = offsetArray[offsetScroll.entryYoff];
var entry_yoffEnd = pick(entry_yoff,offsetArrayEnd[offsetScroll.entryYoff],offsetArrayEnd[offsetScroll.entryYoff]==1);
var alph = (entry_yoff/1);
var col = c_black;

draw_set_alpha(alph*0.6);
draw_rectangle_color(0,0,app_width,app_height,col,col,col,col,false);

draw_set_alpha(alph);

// textbox entry
if kvActive
switch textboxIndex
	{
	case textboxEntry.popupEntryText: variable = string_capitalize(keyboard_string,stringLimit); break;
	}
	
var ww = app_width;
var hh = 300;
var xx = 0;
var yy = app_height-kvHeight-(hh*entry_yoffEnd);
var height = 40;

var col = c_white;

draw_set_halign(fa_left);
draw_roundrect_colour(-1,yy,xx+ww,yy+hh,col,col,false);

if clickout_region(xx,yy,ww,hh,false,navbar.popupEntry)
androidBack = true;

// draw
var xx = 30;
var ww = app_width-xx-xx;
var yoff = 30;
var height = 30;

draw_text_height(xx,yy+yoff,label_str,height); // draw label
draw_text_height_ext_cursor(xx,yy+yoff+80,variable,"",-1,-1,0,40,textboxEntry.popupEntryText);
draw_line_pixel(xx,yy+yoff+80+35,ww,3,header_color,1);

if click_region_released(0,yy+yoff+80-10,app_width,50,true,navbar.popupEntry)
click_textbox_set(variable,0,kbv_type_default);
	
// draw cancel
var xx = 250;
var yoff = hh-70;
var height = 35;

if click_button(xx,yy+yoff,"Cancel",height,c_teal,120,60,undefined,false,false,navbar.popupEntry)
androidBack = true;

// draw save
if virtual_keyboard_enter ||
click_button(xx+150,yy+yoff,"Save",height,c_teal,110,60,undefined,false,false,navbar.popupEntry)
	{
	vk_hide(navbar.hidden);
	return variable;
	}
	
if androidBack
submenu = navbar.hidden;

draw_set_alpha(1);

return undefined;
}