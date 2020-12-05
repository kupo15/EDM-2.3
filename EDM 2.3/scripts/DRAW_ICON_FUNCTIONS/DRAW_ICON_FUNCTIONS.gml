
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,thick,col) {
// centered vertically

var sep = hh/3;

for(var i=-1;i<2;i++)
draw_line_width_color(xx,yy+(i*(sep+thick)),xx+ww,yy+(i*(sep+thick)),thick,col,col);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col) {

draw_line_width_color(xx,yy,xx+ww,yy+hh,thick,col,col); // line top left to bottom right
draw_line_width_color(xx,yy+hh,xx+ww,yy,thick,col,col); // line bot left to top right
}
	
function draw_menu_dots(xx,yy,rr,sep,col) {
// centered vertically

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
	
function draw_menu_triangle(xx,yy,hh,condition,col) {
/// @param xx
/// @param yy
/// @param hh
/// @param condition
/// @param [color]

if argument[4] == undefined
col = c_white;

var scale = hh/10;
var ww = hh*1.87*scale;
var flip = pick(-1,1,condition);
var yoff = pick(hh*0.8,0,condition);

draw_triangle_color(xx,yy+yoff,xx+ww,yy+yoff,xx+(ww*0.5),yy+yoff+(hh*flip),col,col,col,false);
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

function draw_icon_height(spr,ind,xx,yy,height,alpha) {
	
var spr_ww = sprite_get_width(spr);
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var col = c_white;

draw_sprite_ext(spr,ind,xx,yy,sca,sca,0,col,alpha);

return spr_ww*sca;
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
	
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var spr_ww = sprite_get_width(spr)*sca;
var xoff = abs(ww-spr_ww)*0.5;
var yoff = abs(hh-height)*0.5;
var col = c_white;

draw_sprite_ext(spr,index,xx+xoff,yy+yoff,sca,sca,0,col,alpha);
}


function draw_icon_height_centered_color(spr,index,xx,yy,ww,hh,height,col,alpha) {
	
var spr_hh = sprite_get_height(spr);
var sca = height/spr_hh;
var spr_ww = sprite_get_width(spr)*sca;
var xoff = abs(ww-spr_ww)*0.5;
var yoff = abs(hh-height)*0.5;

draw_sprite_ext(spr,index,xx+xoff,yy+yoff,sca,sca,0,col,alpha);
}

