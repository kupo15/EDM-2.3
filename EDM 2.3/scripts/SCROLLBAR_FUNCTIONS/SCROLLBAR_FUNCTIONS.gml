
function funct_draw_scrollbar(xx,yy,row,yyoff,asset_num,scroll_ww,_offset,ysep,ww,col,scrollbar_index) {
/// @param xx
/// @param yy
/// @param rows // max fit in box
/// @param yoff // space for a header
/// @param asset_num
/// @param scroll_ww
/// @param offset_var
/// @param ysep
/// @param width_off
/// @param color
/// @param scrollbar_index

var hh = (row*ysep)+yyoff; // height of dialog box
var asset_ratio = clamp((row/asset_num),0,1);
var offset_max = asset_num-(row);
var scroll_hh = (hh-yyoff)*asset_ratio; // height of scroll bar
var scroll_ratio = _offset/offset_max ; // position in offset
var scroll_yy = yy+yyoff+((hh-yyoff)*scroll_ratio*(1-asset_ratio)); // ypos start of scroll


/*if scr_mouse_position(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,mb_left,false) // click on scroll bar
scrollbar_ystart = device_mouse_y_to_gui(0); // get starting position on scroll bar
else if mouse_check_button_released(mb_left)
scrollbar_ystart = noone;

if scrollbar_ystart != noone
	{
	scr_mouse_distance_gui();
	var drag_ratio = (scrollbar_ystart+mouse_ydist_gui)/(hh-yyoff);
	}*/
    
if asset_num > row    
	{
	draw_set_alpha(0.5);
	draw_roundrect_color(xx+ww-scroll_ww,yy,xx+ww,yy+hh,col,col,false); // draw scroll background
	
	draw_set_alpha(scrollbarDisp[scrollbar_index]);
	draw_roundrect_color(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,col,col,false); // draw scroll bar
	}
	
draw_set_alpha(1);
}

function funct_draw_scrollbar_hor(xx,yy,row,yyoff,asset_num,scroll_ww,_offset,ysep,ww) {
/// @param xx
/// @param yy
/// @param rows // max fit in box
/// @param yoff // space for a header
/// @param asset_num // number of assets
/// @param scroll_ww // width of scroll bar
/// @param offset_var
/// @param xsep
/// @param width_off

var hh = (row*ysep)+yyoff; 
var asset_ratio = clamp((row/asset_num),0,1);
var offset_max = asset_num-(row);
var scroll_hh = (hh-yyoff)*asset_ratio; // height of scroll bar
var scroll_ratio = _offset/offset_max ; // position in offset
var scroll_yy = xx+yyoff+((hh-yyoff)*scroll_ratio*(1-asset_ratio)); // xpos start of scroll

/*if scr_mouse_position(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,mb_left,false) // click on scroll bar
scrollbar_ystart = device_mouse_y_to_gui(0); // get starting position on scroll bar
else if mouse_check_button_released(mb_left)
scrollbar_ystart = noone;

if scrollbar_ystart != noone
	{
	scr_mouse_distance_gui();
	var drag_ratio = (scrollbar_ystart+mouse_ydist_gui)/(hh-yyoff);
	}*/
    
draw_set_alpha(scrollbarDisp);

if asset_num > row    
draw_rectangle(scroll_yy,yy+ww,scroll_yy+scroll_hh,yy+scroll_ww+ww,false); // draw scroll bar

draw_set_alpha(1);
}

function scrollbar_set(ind,val,instant) {
/// @param scrollindex
/// @param value
/// @param [instant]

offsetArray[ind] = val;

if instant
offsetArrayEnd[ind] = val;
	
}