
function ref_set(ref,value) {

variable_instance_set(ref[0],ref[1],value);
}

function ref_get(ref) {
/// ref_get(ref)->value
/// @param ref
/// @return value

return variable_instance_get(ref[0],ref[1]);
}

function if_undef(val,invalid) {
/// @param value
/// @param invalid_return

if val == undefined
return invalid;
else
return val;

}

function draw_line_pixel(xx,yy,ww,hh,col,alpha) {
/// @param xx
/// @param yy
/// @param width
/// @param height
/// @param col
/// @param alpha

draw_sprite_ext(spr_pixel,0,xx,yy,ww,hh,0,col,alpha);
}
	
function draw_rectangle_pixel(xx,yy,ww,hh,outline) {

if outline
	{
	draw_sprite_ext(spr_pixel,0,xx,yy,ww,1,0,c_black,1); // top line
	draw_sprite_ext(spr_pixel,0,xx,yy,1,hh,0,c_black,1); // left line
	draw_sprite_ext(spr_pixel,0,xx,yy+hh,ww,1,0,c_black,1); // bottom line
	draw_sprite_ext(spr_pixel,0,xx+ww,yy,1,hh,0,c_black,1); // right line
	}
else
draw_sprite_ext(spr_pixel,0,xx,yy,ww,hh,0,c_black,1);

}	
	
function funct_mouse_wheel(scale) {
/// @param multiplier

return (mouse_wheel_up()-mouse_wheel_down())*scale;

}

function trace() {
/// @param value

var _string = "";

for(var i=0;i<argument_count;i++)
_string += string(argument[i]);

show_debug_message(_string);	
}

function concat() {
/// @param value

var _string = "";

for(var i=0;i<argument_count;i++)
_string += string(argument[i]);

return _string;
}
	
function pick(val1,val2,condition) {
/// val1 if false
/// val2 if true

if condition
return val2;
else
return val1;
	
}
	
	
// Android display
function pct_x(percent) {

var xx = app_width*percent;

return xx;
}

function pct_y(percent) {

var yy = app_height*percent;

return yy;
}

function pct_x_convert(ww) {

var pct = ww/room_width;

return pct;
}

function pct_y_convert(hh) {

var pct = hh/room_height;

return pct;
}
	
function point_x(xx) {
	
return xx*global.DPI_X_CONVERT;

}

function point_y(yy) {
	
return yy*global.DPI_Y_CONVERT;

}