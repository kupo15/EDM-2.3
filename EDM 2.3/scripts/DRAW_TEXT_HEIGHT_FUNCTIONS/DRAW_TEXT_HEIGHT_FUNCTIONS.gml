// text draws
function draw_text_height(xx,yy,str,height,pct,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param height
/// @param [pct?
/// @param font
/// @param halign]

var int = argument[4];

var sep = -1;
var w = -1;
var angle = 0;
var col = draw_get_color();
var alpha = draw_get_alpha();

return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,pct,font,halign);
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

if str == ""
	{
	str = str_label;
	col = c_gray;
	font = fn_italic
	}

return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,font,halign);
}

function draw_text_height_middled(xx,yy,str,hh,height,alpha,pct,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param region_height
/// @param height
/// @param alpha
/// @param [pct?
/// @param font
/// @param halign]

var int = argument[6];
var col = draw_get_color();

return draw_text_height_middled_color(xx,yy,str,hh,col,height,alpha,pct,font);
}

function draw_text_height_middled_color(xx,yy,str,hh,col,height,alpha,pct,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param region_height
/// @param color
/// @param height
/// @param alpha
/// @param [pct?
/// @param font
/// @param halign]

if argument[6] == undefined
alpha = draw_get_alpha();

var int = argument[8];

var yoff = abs(height-hh)*0.5;
var sep = -1;
var w = -1;
var angle = 0;

return draw_text_height_ext_color(xx,yy+yoff,str,sep,w,angle,col,alpha,height,pct,font,halign);
}

function draw_text_height_color(xx,yy,str,col,height,pct,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param color
/// @param height
/// @param [pct?
/// @param font
/// @param halign]

var int = argument[6];

var sep = -1;
var w = -1;
var angle = 0;
var alpha = draw_get_alpha();

return draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,pct,font,halign);
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

function draw_text_height_ext_color(xx,yy,str,sep,w,angle,col,alpha,height,pct,font,halign) {
/// @param xx
/// @param yy
/// @param str
/// @param sep
/// @param w
/// @param angle
/// @param color
/// @param alpha
/// @param height
/// @param [pct?
/// @param font
/// @param halign]

if argument[7] == undefined
alpha = draw_get_alpha();

if argument[10] == undefined
font = fn_normal;
	
if argument[11] == undefined
halign = fa_left;

draw_set_halign(halign);
draw_set_font(font);
	
var currSize = string_height(str); // current height of string
var scale = height/currSize;

// debug
var ww = string_width(str)*scale; 	
var xoff = (draw_get_halign() == fa_center)*ww*0.5;
var d_xpos = xx-xoff-20;
var d_ypos = yy-2;
var d_wpos = ww+40;
var d_hpos = height+4;
var cross_ww = 3;
var cross_hh = 3;

if sep == -1
var sep_scale = -1;
else
var sep_scale = sep/scale;

if w != -1
w /= scale;

if argument[9] == true
	{
	xx = x_pct_x(xx);
	yy = y_pct_y(yy);	
	scale = y_pct_y(scale,false);

	// debug
	d_xpos = x_pct_x(d_xpos);
	d_ypos = y_pct_y(d_ypos);
	d_wpos = x_pct_x(d_wpos);
	d_hpos = y_pct_y(d_hpos);
	cross_ww = x_pct_x(cross_ww);
	cross_hh = y_pct_y(cross_hh);
	}
	
//var ll = string_width_height(str,height);
//xx -= ll*0.5;

draw_text_ext_transformed_color(xx,yy,str,sep_scale,w,scale,scale,angle,col,col,col,col,alpha);

//draw_line(app_width*0.5,0,app_width*0.5,app_height);

// debug position
if (os_type == os_windows) && point_in_rectangle(mouse_x,mouse_y,d_xpos,d_ypos,d_xpos+d_wpos,d_ypos+d_hpos)
	{	
	//xx += ll*0.5;			
	draw_line_color(xx-cross_ww,yy,xx+cross_ww,yy,col,col);
	draw_line_color(xx,yy-cross_hh,xx,yy+cross_hh,col,col);
	
	var within_app = point_in_rectangle(mouse_x,mouse_y,0,0,app_width,app_height);

	// update
	if within_app
		{
		debugStringText = str;
		debugStringXpos = xx;
		debugStringYpos = yy;
		debugStringWidth = string_width_height(str,height);
		debugStringHeight = height;
		debugStringScale = scale;
		}
	}

return scale;	
}

// text draw with cursor
function draw_text_height_ext_cursor(xx,yy,str,str_disp,sep,str_ww,angle,height,ind,cursor_ww,cursor_col,font,halign) {
/// @param xx
/// @param yy
/// @param string
/// @param stringDisp
/// @param sep
/// @param stringWidth
/// @param angle
/// @param height
/// @param textboxIndex
/// @param [cursor_width
/// @param cursor_color
/// @param font
/// @param halign]

// [optional arguments]
if is_undefined(argument[9])
cursor_ww = cursor_width;

if is_undefined(argument[10])
cursor_col = cursor_color;
		
// draw text
if str == ""
	{
	var col = c_gray;
	var alpha = draw_get_alpha();
	var scale = draw_text_height_ext_color(xx,yy,str_disp,sep,str_ww,angle,col,alpha,height,fn_italic,halign); // draw string
	}
else
	{
	var col = draw_get_color();
	var alpha = draw_get_alpha();
	var scale = draw_text_height_ext_color(xx,yy,str,sep,str_ww,angle,col,alpha,height,font,halign); // draw string
	}
	
#region draw cursor
var xoff = string_width(str)*scale; 
var yoff = floor(xoff/str_ww); // cursor ypos
var hh = height*0.9; // cursor height

// don't draw cursor
if (textboxIndex != ind) || !kvActive
exit;
	
textboxStringScale = scale;
textboxStringLength = string_length(str); // number of characters in string
textboxStringWidth = string_width(str)*scale; // width of string in px

var str_width_half = textboxStringWidth*0.5;
var fa_mod = (draw_get_halign() == fa_center); // half width of string

if fa_mod // if centered 
cursorHoverPos = 1-abs(clamp((mouse_x-xx-str_width_half)/textboxStringWidth,-1,0)); // percentage in string mouse_x is (0 - 1)
else
cursorHoverPos = clamp((mouse_x-xx)/textboxStringWidth,0,1); // percentage in string mouse_x is (0 - 1)

// if deleting a character
if textboxStringLength < cursorPos
	{
	cursorPos = textboxStringLength;
	cursorPosStart = cursorPos;
	}
else if string_length(kvLastString) != string_length(keyboard_string) // if adding a character
	{
	var last_length = string_length(kvLastString);
	cursorPos += textboxStringLength-last_length;

	if cursorPos < 0
	cursorPos = 0;
	}

cursorXposOff = 0;
for(var i=0;i<cursorPos;i++) // loop through character until cursor pos
	{
	var char_ = string_char_at(str,i+1);
	var char_width = string_width(char_)*scale;
	
	cursorXposOff += char_width; // add width to cursor position
	}
			
if fa_mod // if centered
cursorXposOff -= str_width_half;

var blink = current_time mod (cursor_blink*2);
blink = floor(blink/cursor_blink);

// draw cursor
if !blink
	{
	draw_set_alpha(0.5);
	//draw_line_width_color(xx+xoff_mod,yy+yoff_mod,xx+xoff_mod,yy+yoff_mod+hh,ww,cursor_col,cursor_col); // draw cursor
	draw_line_width_color(xx+cursorXposOff,yy+hh,xx+cursorXposOff,yy,cursor_ww,cursor_col,cursor_col); // cursor
	draw_set_alpha(1);
	}
#endregion


}

function draw_text_height_cursor(xx,yy,xoffset,yoff,str,str_disp,halign,angle,height,cursor_ww,cursor_col) {

var hoff = 0.5;

var scale = draw_text_height(xx,yy,str_disp,height); // draw string
var xoff = (1+string_width(str))*scale;
var hh = target*0.9; // cursor height

if halign == fa_center
xoff *= 0.5;

var blink = current_time mod (cursor_blink*2);
blink = floor(blink/cursor_blink);

// draw cursor
if !blink
	{
	draw_set_alpha(0.5);
	draw_line_width_color(xx+xoff,yy,xx+xoff,yy+hh,cursor_ww,cursor_col,cursor_col); // draw cursor
	draw_set_alpha(1);
	}
}

function draw_text_height_entry(xx,yy,str,height,halign,ind,cursor_hh,font) {
/// @param xx
/// @param yy
/// @param string
/// @param height
/// @param halign
/// @param textboxIndex
/// @param cursor_height
/// @param [font]

var currSize = string_height(str);
var scale = height/currSize;

if argument[7] == undefined
font = fn_normal;

draw_set_font(font);

// draw text string
draw_set_color(c_gray);
draw_text_transformed(xx,yy,str,scale,scale,0);

// don't draw cursor
if (textboxIndex != ind) || !kvActive
exit;

if is_nan(scale) || is_infinity(scale)
scale = 1;

// draw cursor
var xoff = (1+string_width(str))*scale;
var hh = cursor_hh*0.9; // cursor height

if halign == fa_center
xoff *= 0.5;

var blink = current_time mod (cursor_blink*2);
blink = floor(blink/cursor_blink);

// draw cursor
if !blink
	{
	draw_set_alpha(0.5);
	draw_line_width_color(xx+5+xoff,yy,xx+5+xoff,yy+hh,cursor_width,cursor_color,cursor_color); // draw cursor
	draw_set_alpha(1);
	}

}

// text manipulation
function text_reduce(str,ww,height) {

if str == ""
return height;

var currSize = string_height(str);
var scale = height/currSize;

var str_ww = string_width(str)*scale;  // current width
var sca = ww/str_ww;

if str_ww < ww // if current width is less than the limit
return height; // no change
else
return height*sca;


}

function string_abbreviate(str,ll,height,abbre) {
/// @param string
/// @param length
/// @param height
/// @param abbrev_string

var new_str = "";
var str_ll = string_length(str); // number of characters

var currSize = string_height(str);
var scale = height / currSize;

// loop through string
for(var i=0;i<str_ll;i++)
if string_width(new_str)*scale < ll 
new_str += string_char_at(str,i+1);
else
	{
	new_str += abbre;
	break;
	}

return new_str;


}
