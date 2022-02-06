var col = c_white;
var mx = clamp(mouse_x,0,room_width);
var my = clamp(mouse_y,0,room_height);

var mx_d = abs(mx-mouse_xstart);
var my_d = abs(my-mouse_ystart);

draw_set_halign(fa_left);
draw_text_height_color(-130,room_height-100,string(mx)+" , "+string(my),col,30);

if mouse_check_button(mb_middle) {
	
	draw_text_height_color(-130,room_height-100+40,"["+string(mx_d)+" , "+string(my_d)+"]",col,30);
	draw_rectangle(mouse_xstart,mouse_ystart,mx,my,true);
	}
	
// draw screen stack
var xx = -140;
var yy = 50;
var sep = 30;

var size = array_length(prevScreenStack);
for(var i=0;i<size;i++) {
	
	var ind = prevScreenStack[size-i-1];
	var name = script_get_name(drawScreen[ind]);
	
	draw_text_height_color(xx,yy+(i*sep),name,col,sep*0.8);
	}
	
draw_line_pixel(xx,yy+10,120,1,c_white);