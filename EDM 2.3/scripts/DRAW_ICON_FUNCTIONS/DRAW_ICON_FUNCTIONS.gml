
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,thick,col) {
// centered vertically

thick = ceil(thick);

var sep = ceil(hh/3);

for(var i=-1;i<2;i++)
draw_line_width_color(xx,yy+(i*(sep+thick)),xx+ww,yy+(i*(sep+thick)),thick,col,col);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col) {

draw_line_width_color(xx,yy,xx+ww,yy+hh,thick,col,col); // line top left to bottom right
draw_line_width_color(xx,yy+hh,xx+ww,yy,thick,col,col); // line bot left to top right
}
	
function draw_menu_dots(xx,yy,rr,sep,col) {
// centered vertically

rr = floor(rr);
rr = clamp(rr,3,5);

sep = rr*2;

for(var i=-1;i<2;i++)
draw_circle_color(xx,yy+(i*(sep+rr)),rr,col,col,false);

}

function draw_menu_arrow(xx,yy,ww,hh,thickness,dir,col) {
	
var half = hh*0.5;
var diag_ll = ww*0.3;
var shift = ww*0.2;

draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(xx,yy,col,1);
draw_vertex_color(xx+shift,yy,col,1);
draw_vertex_color(xx+diag_ll,yy-half,col,1);
draw_vertex_color(xx+diag_ll+shift,yy-half,col,1);
draw_primitive_end();

draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(xx,yy,col,1);
draw_vertex_color(xx+shift,yy,col,1);
draw_vertex_color(xx+diag_ll,yy+half,col,1);
draw_vertex_color(xx+diag_ll+shift,yy+half,col,1);
draw_primitive_end();

thickness = shift*0.25;

draw_rectangle_color(xx+(shift*0.5),yy-thickness,xx+ww,yy+thickness,col,col,col,col,false); // horizontal line	
}
	
function draw_menu_triangle(xx,yy,hh,condition,pct,col) {
/// @param xx
/// @param yy
/// @param hh
/// @param condition
/// @param [pct
/// @param color]

if argument[5] == undefined
col = c_white;

var flip = pick(-1,1,condition);
var yoff = pick(hh*0.9,0,condition);

yy = yy+yoff;

var x1 = xx;
var y1 = yy;

var x2 = x1+hh;
var y2 = y1+(hh*flip);

var x3 = x2;
var y3 = yy;

var x4 = x3+1;
var y4 = y2;

var x5 = x4;
var y5 = yy;

var x6 = x5+hh;
var y6 = yy;

if argument[4] == true
	{
	x1 = x_pct_x(x1);
	y1 = y_pct_y(y1);
	
	x2 = x_pct_x(x2);
	y2 = y_pct_y(y2);
	
	x3 = x_pct_x(x3);
	y3 = y_pct_y(y3);
	
	x4 = x_pct_x(x4);
	y4 = y_pct_y(y4);
		 
	x5 = x_pct_x(x5);
	y5 = y_pct_y(y5);
		 
	x6 = x_pct_x(x6);
	y6 = y_pct_y(y6);
	}

draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x1,y1,col,1);
draw_vertex_color(x2,y2,col,1);
draw_vertex_color(x3,y3,col,1);

draw_vertex_color(x4,y4,col,1);
draw_vertex_color(x5,y5,col,1);

draw_vertex_color(x6,y6,col,1);
draw_primitive_end();
}
	
function draw_calendar_icon(xx,yy,sq_yoff,sq_size,date) {
	
var day = date_get_day(date);
var weekday = date_get_weekday(date);
var day_str = funct_convert_weekday(weekday,false);

// draw calendar icon
draw_roundrect_color(xx+1,yy+sq_yoff,xx+sq_size,yy+sq_size-1+sq_yoff,c_gray,c_gray,true);
draw_roundrect_color(xx,yy+sq_yoff,xx+sq_size,yy+sq_size+sq_yoff,c_gray,c_gray,true);
	
draw_set_halign(fa_center);
draw_text_height_color(xx+(sq_size*0.5),yy+10+sq_yoff,day_str,c_red,25);
draw_text_height_color(xx+(sq_size*0.5),yy+40+sq_yoff,day,c_black,46);

draw_set_halign(fa_left);
}
	
function draw_icon_member_initial(xx,yy,str,sep,col,height) {
	
var initial = string_char_at(str,1);
	
draw_set_halign(fa_center);
draw_circle_color(xx,yy+(sep*0.5),height,col,col,false);
draw_text_height_middled(xx,yy,initial,sep,height);	
	
}
	
function draw_icon_enclosed(spr,ind,xx,yy,ww,hh,ysep,col,shape) {
	
var xoff = (ww*0.5);
var yoff = (ysep*0.5);
var r = ww*0.5;

draw_circle_color(xx+xoff,yy+yoff,r,col,col,false); // draw circle
draw_icon_height_centered(spr,ind,xx+xoff-r,yy+yoff-r,ww,hh,hh*0.4,1);
}
	

function draw_icon_member_add(xx,yy,height,col) {
	
var spr = spr_icon_member_add;
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var alpha = draw_get_alpha();

switch col
	{
	case c_blue: col = make_color_rgb(0,185,229); break;
	}

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

}

function draw_icon_group(xx,yy,height,col) {
	
var spr = spr_icon_group;
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var alpha = draw_get_alpha();

switch col
	{
	default: break;
	}

draw_sprite_ext(spr,0,xx,yy,sca,sca,0,col,alpha);

}

function draw_icon_width(spr,ind,xx,yy,width,alpha) {
	
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = width/spr_ww;
var col = c_white;

draw_sprite_ext(spr,ind,xx,yy,sca,sca,0,col,alpha);

return spr_hh*sca;
}

function draw_icon_width_pct(spr,ind,xx,yy,width,alpha) {
	
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = x_pct_x(width/spr_ww,false);
var col = c_white;

draw_sprite_ext(spr,ind,x_pct_x(xx),y_pct_y(yy),sca,sca,0,col,alpha);

return y_pct_y(spr_hh*width/spr_ww);
}

function draw_icon_height(spr,ind,xx,yy,height,alpha) {
	
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var col = c_white;

draw_sprite_ext(spr,ind,xx,yy,sca,sca,0,col,alpha);

return spr_ww*sca;
}

function draw_icon_height_pct(spr,ind,xx,yy,height,alpha,enclosed,enclosedCol) {
/// @param spr
/// @param ind
/// @param xx
/// @param yy
/// @param height
/// @param alpha
/// @param [enclosed
/// @param enclosedCol]
	
	
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = y_pct_y(height/spr_hh,false);
var col = c_white;

xx = x_pct_x(xx)
yy = y_pct_y(yy);

if enclosed
	{
	var r = y_pct_y(height)*0.5;
	var off = r;
	
	draw_circle_color(xx+off,yy+off,r*1.25,enclosedCol,enclosedCol,false); // draw circle
	}


draw_sprite_ext(spr,ind,xx,yy,sca,sca,0,col,alpha);

return x_pct_x(spr_ww*height/spr_hh);
}

function draw_icon_width_centered(spr,index,xx,yy,ww,hh,width,alpha) {
	
var spr_ww = sprite_get_width(spr);
var sca = width/spr_ww;
var spr_hh = sprite_get_height(spr)*sca;
var xoff = abs(ww-width)*0.5;
var yoff = abs(hh-spr_hh)*0.5;
var col = c_white;

draw_sprite_ext(spr,index,xx+xoff,yy+yoff,sca,sca,0,col,alpha);
}

function draw_icon_height_centered(spr,index,xx,yy,ww,hh,height,alpha) {
	
var col = draw_get_color();	
draw_icon_height_centered_color(spr,index,xx,yy,ww,hh,height,col,alpha);	
}

function draw_icon_height_centered_color(spr,index,xx,yy,ww,hh,height,col,alpha) {
	
draw_icon_height_centered_color_pct(spr,index,xx,yy,ww,hh,height,col,alpha,false);	
}

function draw_icon_height_centered_color_pct(spr,index,xx,yy,ww,hh,height,col,alpha,pct) {
/// @param spr
/// @param index
/// @param xx
/// @param yy
/// @param ww
/// @param hh
/// @param height
/// @param col
/// @param alpha	
	
if argument[9] = undefined
pct = true;
	
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var spr_ww = sprite_get_width(spr)*sca;
var xoff = abs(ww-spr_ww)*0.5;
var yoff = abs(hh-height)*0.5;

var xpos = xx+xoff;
var ypos = yy+yoff;

if pct
	{
	xpos = x_pct_x(xpos);
	ypos = y_pct_y(ypos);
	sca = y_pct_y(sca,false);
	}

draw_sprite_ext(spr,index,xpos,ypos,sca,sca,0,col,alpha);
}

function draw_image_width_cropped(spr,ind,xx,yy,region_ww,region_hh,bleed,pct,alpha) {
	
if argument[8] == undefined
alpha = draw_get_alpha();
	
// get sprite dimensions
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);

if argument[7] == true
	{
	xx = x_pct_x(xx);
	yy = y_pct_y(yy);
	
	region_ww = x_pct_x(region_ww);	// region width to fit in
	region_hh = y_pct_y(region_hh);
	bleed = x_pct_x(bleed);
	}

var sca = (region_ww+bleed)/spr_ww;
var col = c_white;

if !surface_exists(surf)
surf = surface_create(region_ww,region_ww);

surface_set_target(surf);
draw_sprite_ext(spr,ind,0,0,sca,sca,0,col,alpha);
surface_reset_target();

draw_surface_part(surf,0,0,region_ww,region_hh,xx,yy);

return region_ww/spr_ww*spr_hh;
}

function draw_image_width_cropped_pct(spr,ind,xx,yy,region_ww,region_hh,bleed,alpha) {
	
return draw_image_width_cropped(spr,ind,xx,yy,region_ww,region_hh,bleed,true,alpha);


	exit;
if argument[6] == undefined
alpha = draw_get_alpha();
		
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = x_pct_x((region_ww+1)/spr_ww,false);
var col = c_white;

draw_sprite_part_ext(spr,ind,0,0,region_ww+1,region_hh/sca,x_pct_x(xx),y_pct_y(yy),sca,sca,col,alpha);
//draw_sprite_part_ext(spr,ind,0,0,x_pct_x(region_ww+1)/sca,y_pct_y(region_hh)/sca,x_pct_x(xx),y_pct_y(yy),sca,sca,col,alpha);

return y_pct_y(region_hh);
}
