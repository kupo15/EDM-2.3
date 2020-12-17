
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,thick,col,alpha) {
// centered vertically

thick = ceil(thick);
var sep = ceil(hh/3);

vertex_buffer_bars(xx,yy,ww,thick,sep,col,alpha);


//for(var i=-1;i<2;i++)
//draw_line_hor(xx,yy+(i*sep),ww,thick,c_white,1);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col,alpha) {

vertex_buffer_menu_xout(xx,yy,ww,hh,thick,col,alpha);
}
	
function draw_menu_dots(xx,yy,rr,sep,col,alpha) {
// centered vertically

rr = floor(rr);
rr = clamp(rr,3,5);

sep = floor(rr*3.75);

vertex_buffer_dots(xx,yy,rr,sep,col,alpha);
}

function draw_menu_arrow(xx,yy,ww,hh,thickness,dir,col,alpha) {
	
var half = hh*0.5;
var diag_ll = ww*0.5;
var shift = ww*0.34;

vertex_buffer_back_arrow(xx,yy,ww,diag_ll,shift,half,col,alpha);
}
	
function draw_menu_triangle(xx,yy,hh,condition,pct,col,alpha) {
/// @param xx
/// @param yy
/// @param hh
/// @param condition
/// @param [pct
/// @param color]

vertex_buffer_menu_arrow(xx,yy,hh,condition,pct,col,alpha);
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
	
function draw_icon_member_initial(xx,yy,str,string_col,sep,bg_col,height) {
/* OUT OF USE
//var initial = string_char_at(str,1);
var r = sep*0.8*0.5;	
	
draw_circle_color(xx+(sep*0.5),yy+(sep*0.5),r,bg_col,bg_col,false);

draw_text_height_middled_color(xx+(sep*0.5),yy,capitalize(str),sep,string_col,height,1,undefined,undefined,fa_center);	
*/
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


var new_ww = floor(spr_ww*sca);
var new_hh = floor(spr_hh*sca);

//draw_sprite_stretched_ext(spr,ind,xx,yy,new_ww,new_hh,col,alpha);
draw_sprite_ext(spr,ind,xx,yy,sca,sca,0,col,alpha);

return x_pct_x(spr_ww*height/spr_hh);
}

function draw_icon_width_centered(spr,index,xx,yy,ww,hh,width,alpha) {

var col = draw_get_color();
draw_icon_width_centered_color(spr,index,xx,yy,ww,hh,width,col,alpha)
}

function draw_icon_width_centered_color(spr,index,xx,yy,ww,hh,width,col,alpha) {
	
var spr_ww = sprite_get_width(spr);
var sca = width/spr_ww;
var spr_hh = sprite_get_height(spr)*sca;
var xoff = abs(ww-width)*0.5;
var yoff = abs(hh-spr_hh)*0.5;

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
