
function click_button(xx,yy,str,height,str_col,ww,hh,col,rounded,outline,sub,font,alpha) {
/// @param xx
/// @param yy
/// @param buttonString
/// @param stringHeight
/// @param stringColor
/// @param buttonWidth
/// @param buttonHeight
/// @param buttonColor
/// @param rounded
/// @param outline
/// @param submenu
/// @param [font
/// @param alpha]

if argument[11] == undefined
font = fn_normal;

var int = argument[12];

var yoff = (hh-height)*0.5;

if col != undefined
if rounded
	{
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	
	if outline
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,c_black,c_black,true);
	}
else
	{
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	
	if outline
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,c_black,c_black,c_black,c_black,true);
	}

var prev_halign = draw_get_halign();

draw_set_halign(fa_center);
draw_text_height_color(xx+(ww*0.5),yy+yoff,str,str_col,height,font);
draw_set_halign(prev_halign);

return click_region_released(xx,yy,ww,hh,true,sub,alpha);
}