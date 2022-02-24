
function funct_draw_scrollbar(xx,yy,row,yyoff,asset_num,scroll_ww,_offset,ysep,ww) {
	
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
	    var drag_ratio = (scrollbar_ystart+global.mouse_ydist_gui)/(hh-yyoff);
	    }*/
    
	draw_set_alpha(scrollbar_disp);
	
	if (asset_num > row)
	draw_rectangle(xx+ww-scroll_ww,scroll_yy,xx+ww,scroll_yy+scroll_hh,false); // draw scroll bar
	
	draw_set_alpha(1);
	}
