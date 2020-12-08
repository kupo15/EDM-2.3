
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

function draw_line_hor(xx,yy,length,thick,col,alpha) {
	
for(var i=0;i<thick;i++)
	{
	var ypos = yy+i;

	draw_line_color(xx,ypos,xx+length,ypos,col,col);
	}
}

function draw_line_vert(xx,yy,length,thick,col,alpha) {
	
for(var i=0;i<thick;i++)
	{
	var xpos = xx+i;

	draw_line_color(xpos,yy,xpos,yy+length,col,col);
	}
}

function draw_line_pixel(xx,yy,ww,hh,col,alpha,pct) {
/// @param xx
/// @param yy
/// @param width
/// @param height
/// @param col
/// @param alpha
/// @param [pct?]

if argument[6] == true
	{
	xx = x_pct_x(xx);
	yy = y_pct_y(yy);
	ww = x_pct_x(ww);
	hh = y_pct_y(hh);
	}
	
if ww < 1
ww = 1

if hh < 1
hh = 1;

draw_sprite_stretched_ext(spr_pixel,0,xx,yy,ww,hh,col,alpha);
}
	
function draw_rectangle_pixel(xx,yy,ww,hh,col,outline,pct) {

if argument[6] == true
	{
	xx = x_pct_x(xx);
	yy = y_pct_y(yy);
	ww = x_pct_x(ww);
	hh = y_pct_y(hh);
	
	}

if outline
	{
	draw_sprite_ext(spr_pixel,0,xx,yy,ww,1,0,col,1); // top line
	draw_sprite_ext(spr_pixel,0,xx,yy,1,hh,0,col,1); // left line
	draw_sprite_ext(spr_pixel,0,xx,yy+hh,ww,1,0,col,1); // bottom line
	draw_sprite_ext(spr_pixel,0,xx+ww,yy,1,hh,0,col,1); // right line
	}
else
draw_sprite_stretched_ext(spr_pixel,0,xx,yy,ww,hh,col,1);
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
	
function frac_whole(num) {

var str = string(frac(num));
var new_str = string_replace(str,"0.","");

return real(new_str);	
}
	
// Android display
function pct_x(percent,rounding) {

var xx = app_width*percent*0.01;

if argument[1] != false
xx = ceil(xx);

return xx;
}

function pct_y(percent,rounding) {

var yy = app_height*percent*0.01;

if argument[1] != false
yy = ceil(yy);

return yy;
}

function pct_x_convert(room_xx,GM_room_ww) {
// convert room coor to percent of the room width

if argument[1] == undefined
GM_room_ww = room_width;

var pct = room_xx/GM_room_ww;

return pct;
}

function pct_y_convert(room_yy,GM_room_hh) {
// convert room coor to percent of the room height

if argument[1] == undefined
GM_room_hh = room_height;

var pct = room_yy/GM_room_hh;

return pct;
}

function x_pct_x(room_xx,rounding,GM_room_ww) {
/// @param room_xx
/// @param [rounding
/// @param GM_room_width]

var ins = argument[1];

var val = pct_x_convert(room_xx,GM_room_ww); // convert to percent

return pct_x(val*100,rounding); // return new x coor
}

function y_pct_y(room_yy,rounding,GM_room_hh) {
/// @param room_yy
/// @param [rounding
/// @param GM_room_height]

var ins = argument[1];

var val = pct_y_convert(room_yy,GM_room_hh); // convert to percent

return pct_y(val*100,rounding); // return new y coor
}
	
function point_x(xvalue) {
	
return xvalue*DPI_X_CONVERT;

}

function point_y(yvalue) {
	
return yvalue*DPI_Y_CONVERT;

}
	
function fit_item_to_area(_x, _y, _width, _height, _item_width, _item_height) {
	
var _new_x, _new_y, _new_width, _new_height;
var _scale_x = _width/_item_width;
var _scale_y = _height/_item_height;
	
if (_scale_x < _scale_y)
	{
    _new_y = _y + (_height - (_item_height * _scale_x)) / 2;
    _new_x = _x;
    _new_width = _item_width * _scale_x;
    _new_height = _item_height * _scale_x;
	}
else
	{
    _new_y = _y;
    _new_x = _x + (_width - (_item_width * _scale_y)) / 2;
    _new_width = _item_width * _scale_y;
    _new_height = _item_height * _scale_y;
	}
		
var struct = {xx: _new_x,yy: _new_y,ww: _new_width,hh: _new_height,xsca: _scale_x,ysca: _scale_y};
return struct;
}