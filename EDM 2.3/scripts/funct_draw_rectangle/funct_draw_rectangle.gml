/// @description  funct_draw_rectangle(x,y,width,height,outline);
/// @param x
/// @param y
/// @param width
/// @param height
/// @param outline
function funct_draw_rectangle(argument0, argument1, argument2, argument3, argument4) {

	var xx = argument0;
	var yy = argument1;
	var ww = argument2;
	var hh = argument3;
	var outline = argument4;

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
