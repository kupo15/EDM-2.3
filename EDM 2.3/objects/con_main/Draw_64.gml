var col = c_white;
var mx = clamp(mouse_x,0,room_width);
var my = clamp(mouse_y,0,room_height);

var mx_d = abs(mx-mouse_xstart);
var my_d = abs(my-mouse_ystart);

draw_text_height_color(-130,room_height-100,string(mx)+" , "+string(my),col,30);

if mouse_check_button(mb_middle) {
	
	draw_text_height_color(-130,room_height-100+40,"["+string(mx_d)+" , "+string(my_d)+"]",col,30);
	draw_rectangle(mouse_xstart,mouse_ystart,mx,my,true);
	}