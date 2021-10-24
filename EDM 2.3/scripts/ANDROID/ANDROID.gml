
#macro app_width room_width
#macro app_height room_height
#macro DPI_POINT 72

DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
	
DPI_X_CONVERT = display_get_dpi_x()/DPI_POINT;
DPI_Y_CONVERT = display_get_dpi_y()/DPI_POINT;

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