
function draw_button_trash(xx,yy,ww,hh,spr,color,screenInd,sub,background) {

if screenIndex == screenInd
	{		
	switch color
		{
		case c_red: var col = make_color_rgb(255,200,200); break;
		
		default: var col = color; break;
		}
	
	if background
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

	var fit = 0.8; // 80% of the button height
	var height = (hh*fit);
	var spr_hh = sprite_get_height(spr);
	var sca = height/spr_hh;
	
	var spr_ww = sprite_get_width(spr)*sca;
	var xoff = (ww-spr_ww)*0.5;
	var yoff = (hh-height)*0.5;
	
	switch color
		{
		case c_red: var col = make_color_rgb(255,91,91); break;
		
		default: var col = color; break;
		}

	draw_sprite_ext(spr,0,xx+xoff,yy+yoff,sca,sca,0,col,1); // draw trash icon
	
	// clicked trash icon
	return click_region_released(xx,yy,ww,hh,true,sub);
	}

}

function draw_button_backspace(spr,index,xx,yy,ww,hh,height,alpha,sub) {
	
draw_icon_height_centered(spr,index,xx,yy,ww,hh,height,alpha);
	
return click_region_released(xx,yy,ww,hh,true,sub);	
}

function draw_list_searchbar(xx,yy,blankStr,height,ww,hh,col,sub) {
/// @param xx
/// @param yy
/// @param stringLabel
/// @param stringHeight
/// @param searchbarWidth
/// @param searchbarHeight
/// @param searchbarColor
	
draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

// draw text
var text_yoff = (hh-(height*0.8))*0.5;
draw_text_height_ext_cursor(xx+70,yy+text_yoff,searched_name,blankStr,-1,ww,0,height,-1); // draw search bar
draw_icon_height_centered(ico_search,0,xx,yy,70,hh,35,1); // searchbar ico

// clicked on search bar
if click_region_released(xx,yy,ww-hh-10,hh,true,submenu)
	{
	searching = true;
	click_textbox_set(searched_name,-1,kbv_type_default,kbv_returnkey_done);
	}
	
// clear xout
var xWidth = 25;
var xoff = (hh-xWidth)*0.5;
var yoff = xoff;

draw_menu_xout(room_width-hh+xoff,yy+yoff,xWidth,xWidth,3,c_black);

if click_region_released(room_width-hh,yy,hh,hh,true,submenu)
	{
	kvLastString = "";
	keyboard_string = "";
	searched_name = "";
	}
	

	
}

function draw_plus_button(xx,yy,d,enclosed,col) {
// centered
/// @param xx
/// @param yy
/// @param diameter
/// @param enclosed
/// @param [buttonColor]

if argument[4] == undefined
col = c_white;

var r = d*0.5;
var line_ll = r*0.4;
var ww = 2;

if enclosed
draw_circle_color(xx,yy,r,col,col,false);

// draw plus
draw_line_width_color(xx-line_ll,yy,xx+line_ll,yy,ww,c_black,1);
draw_line_width_color(xx,yy-line_ll,xx,yy+line_ll,ww,c_black,1);
}

function draw_switch_tab(xx,yy,box_hh,diameter,ind,variable) {
/// @param xx
/// @param yy
/// @param box_hh
/// @param diameter
/// @param lerp_index
/// @param variable

var scale = diameter/7*0.5;

var ww = 25*scale;
var hh = 10*scale;
var r = 7*scale;

var bar_col = c_gray;
var button_col = make_color_rgb(200,200,200);

// change color
if switchTabDisp[ind] >= 0.5
	{
	bar_col = make_color_rgb(177,198,252);
	button_col = make_color_rgb(83,113,255);
	}
	
// lerp position
switchTabDispEnd[ind] = variable;

if switchTabDisp[ind] != switchTabDispEnd[ind]
switchTabDisp[ind] = lerp(switchTabDisp[ind],switchTabDispEnd[ind],0.35);

yy += (box_hh*0.5);

var yoff = hh*0.5;
var button_xoff = ww*switchTabDisp[ind];

draw_roundrect_color(xx,yy-yoff,xx+ww,yy+yoff,bar_col,bar_col,false); // draw underbar
draw_circle_color(xx+button_xoff,yy,r,button_col,button_col,false); // draw button


}
