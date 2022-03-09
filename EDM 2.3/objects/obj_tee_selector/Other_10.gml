
var ww = width;
var hh = height;
var yy = y;

draw_line_pixel(0,0,room_width,room_height,c_black,0.4*animationValue);

draw_set_alpha(animationValue);

draw_roundrect_color(x,yy,x+ww,yy+hh,c_white,c_white,false);

var color = draw_tee_data_list(x,yy,ww,sep,true,highlightedTee,active);

if (color != undefined) {
	
	tee_popover_select_tee(color);
	tee_popover_deactivate();
	}

// click out
draw_set_alpha(1);
if !scr_button_hover(x,y,width,height,false) && mouse_check_button_released(mb_left) && !global.clicked {
	
	global.clicked = true;
	tee_popover_deactivate();
	}