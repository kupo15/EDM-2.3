function draw_navbar() {

var alph = 1-(offsetArray[offsetScroll.navbarYoff]/1);
draw_set_alpha(alph);

// draw highlight
var offset = offsetArray[offsetScroll.navbarYoff];
var ico_num = nav_ico_num;
var xsep = app_width/ico_num;
var hh = nav_height;
var xx = xsep*screenIndex;
var yy_nav = app_height-hh+(hh*offset);
var col = header_color;

draw_rectangle_color(0,yy_nav,app_width,yy_nav+hh,c_white,c_white,c_white,c_white,false);
draw_rectangle_colour(xx,yy_nav,xx+xsep,yy_nav+hh,col,col,col,col,false); // draw highlight

// draw navbar
var ww = app_width;
var col = make_colour_rgb(2,121,172);

draw_line_pixel(-1,yy_nav,app_width+1,1,c_gray,alph*0.7); // horizontal line
//draw_rectangle_colour(xx_nav,yy_nav,xx_nav+ww,yy_nav+hh,col,col,col,col,false);

draw_set_halign(fa_center);
for(var i=0;i<ico_num;i++)
	{
	name_arr =["Home","Stats","Playing","Score","Courses"];

	var xpos = i*xsep;
	var str = name_arr[i];
	var col = header_color;
	
	if i == screenIndex
	var col = c_white;
		
	// draw label
	draw_text_height_color(xpos+(xsep*0.5),yy_nav+hh-30,str,col,25);
		
	// draw icons
	draw_icon_height_centered_color(spr_footer_icon,i,xpos,yy_nav,xsep,hh*0.8,hh*0.6,col,alph);
		
	if click_region_released(i*xsep,yy_nav,xsep,hh,true,submenu)
	scr_navbar_click(i);
	}

draw_set_alpha(1);
}

function draw_overlay_circle_button() {
	
var xx = element_circle_button.xx;
var yy = element_circle_button.yy
var r = element_circle_button.rr;
var active = element_circle_button.active;

if !active
exit;

draw_circle(xx,yy,r,false);


}