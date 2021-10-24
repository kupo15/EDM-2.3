
function draw_text_height(xx,yy,str,height,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param height
/// @param [font
/// @param halign]

	var sep = -1;
	var w = -1;
	var angle = 0;
	var col = draw_get_color();
	var alpha = draw_get_alpha();

	return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign);
	}

function draw_text_height_label(xx,yy,str,str_label,height,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param str_label
/// @param height
/// @param [font
/// @param halign]

	var int = argument[5];

	var sep = -1;
	var w = -1;
	var angle = 0;
	var col = draw_get_color();
	var alpha = draw_get_alpha();

	if (str == "")
		{
		str = str_label;
		col = c_gray;
		font = fnItalic
		}

	return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign);
	}

function draw_text_height_middled(xx,yy,str,hh,height,alpha,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param region_height
/// @param height
/// @param alpha
/// @param [font
/// @param halign]

	var col = draw_get_color();

	return draw_text_height_middled_color(xx,yy,str,hh,col,height,alpha,font,halign);
	}

function draw_text_height_middled_color(xx,yy,str,hh,col,height,alpha,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param region_height
/// @param color
/// @param height
/// @param alpha
/// @param [font
/// @param halign]

	if argument[6] == undefined
	alpha = draw_get_alpha();

	var int = argument[8];

	var yoff = abs(height-hh)*0.5;
	var sep = -1;
	var w = -1;
	var angle = 0;

	return draw_text_height_ext_color(xx,yy+yoff,str,sep,w,angle,col,alpha,height,font,halign);
	}

function draw_text_height_color(xx,yy,str,col,height,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param color
/// @param height
/// @param [font
/// @param halign]

	var int = argument[6];

	var sep = -1;
	var w = -1;
	var angle = 0;
	var alpha = draw_get_alpha();

	return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign);
	}

function draw_text_height_ext(xx,yy,str,sep,w,angle,height,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param sep
/// @param w
/// @param angle
/// @param height
/// @param [font
/// @param halign]

	var int = argument[7];

	var col = draw_get_color();
	var alpha = draw_get_alpha();

	return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign);
	}

function draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param sep
/// @param w
/// @param angle
/// @param color
/// @param alpha
/// @param height
/// @param [font
/// @param halign]

	if argument[7] == undefined
	alpha = draw_get_alpha();

	if argument[9] == undefined
	font = fnRegular;
	
	if argument[10] == undefined
	halign = fa_left;

	draw_set_halign(halign);
	draw_set_font(font);
	
	var currSize = string_height(str); // current height of string
	var scale = height/currSize;

	if sep == -1
	var sep_scale = -1;
	else
	var sep_scale = sep/scale;

	if w != -1
	w /= scale;
	
	draw_text_ext_transformed_color(xx,yy,str,sep_scale,w,scale,scale,angle,col,col,col,col,alpha);

	return scale;	
	}
