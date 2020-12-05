
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

function draw_plus_button(xx,yy,d,enclosed,str_col,col) {
// centered
/// @param xx
/// @param yy
/// @param diameter
/// @param enclosed
/// @param [strColor
/// @param buttonColor]

if argument[4] == undefined
str_col = c_black;

if argument[5] == undefined
col = c_white;

var r = d*0.5;
var line_ll = r*0.4;
var ww = 2;

if enclosed
draw_circle_color(xx,yy,r,col,col,false);

// draw plus
draw_line_width_color(xx-line_ll,yy,xx+line_ll,yy,ww,str_col,str_col);
draw_line_width_color(xx,yy-line_ll,xx,yy+line_ll,ww,str_col,str_col);
}

function draw_switch_tab(xx,yy,box_hh,switch_hh,ind,variable,enclosed) {
/// @param xx
/// @param yy
/// @param box_hh
/// @param switch_hh
/// @param lerp_index
/// @param variable
/// @param enclosed

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

var scale = switch_hh/72;
var rect_ww = 72*2.02*scale;
var rect_hh = switch_hh;
var radx = rect_ww*0.5;
var rady = rect_hh;
var yoff = (box_hh-rect_hh)*0.5;
var rect_ypos = yy+yoff;

// if enclosed
draw_roundrect_color_ext(xx,rect_ypos,xx+rect_ww,rect_ypos+rect_hh,radx,rady,bar_col,bar_col,false); // draw underbar

var r = switch_hh*0.5*0.83;
var d = r*2;
var button_xoff = rect_ww*switchTabDisp[ind]*0.5;
var button_xpos = xx+(rect_ww*0.25);
var button_ypos = rect_ypos+(rect_hh*0.5);

draw_circle_color(button_xpos+button_xoff,button_ypos,r,button_col,button_col,false); // draw button
}

function draw_radio_button(xx,yy,box_hh,diameter,variable,col) {
	
var r = diameter*0.5;
yy += box_hh*0.5;
col = pick(col,c_black,!variable);	
	
draw_circle_color(xx,yy,r,col,col,false); // full circle
draw_circle_color(xx,yy,r*0.8,c_white,c_white,false); // white cutout

if variable
draw_circle_color(xx,yy,r*0.4,col,col,false); // selected center
	
}