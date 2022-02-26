
var ww = 300;
var hh = height;
var yy = y;

draw_line_pixel(0,0,room_width,room_height,c_black,0.4*animationValue);

draw_set_alpha(animationValue);

draw_line_pixel(x,yy,ww,hh,c_white);
draw_tee_data(x,yy,ww,highlightedTee,active);

draw_set_alpha(1);

if !scr_button_hover(x,y,x+width,y+height,false) && mouse_check_button_released(mb_left) && !global.clicked {
	
	global.clicked = true;
	tee_popover_deactivate();
	}