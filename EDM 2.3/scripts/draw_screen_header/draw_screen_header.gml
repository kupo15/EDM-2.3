
function draw_screen_header(header_left,header_right,header_string,height,bg_col) {
/// @param header_left
/// @param header_right
/// @param header_string
/// @param [stringHeight
/// @param [header_color]

if argument[3] == undefined
height = header_font_height;

if argument[4] == undefined
bg_col = header_color;

var xx = app_width*0.5;
var yy = 0;
var ww = app_width;
var hh = header_height;

draw_rectangle_color(0,0,ww,hh,bg_col,bg_col,bg_col,bg_col,false);

draw_set_halign(fa_center);
draw_text_height_middled_color(xx,yy,header_string,header_height,c_white,height);
draw_set_halign(fa_left);

var xpos = 0;
var region = header_height;
var header_type = header_left;

repeat 2
	{
	if header_type == headerType.bars
		{
		// draw the 3 bars
		var ww = header_height*0.33;
		var hh = header_height*0.27;
		var xx = (region-ww)*0.5;
		var yy = header_height*0.5;
		var thick = y_pct_y(4);
		
		draw_menu_bars(xpos+xx,yy,ww,hh,thick,c_white);

		// clicked on bars
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,0,region,region,true,submenu)
			{
			submenuPrevious = submenu;
			submenu = navbar.sidebar;
	
			screenDarkenIndex = darkenIndex.sidebar;
			}
		}
	else if header_type == headerType.dots
		{
		// draw the 3 dots
		var xx = region*0.5;
		var yy = header_height*0.5;
		var rr = header_height*0.035;
		var sep = header_height*0.067;
		
		draw_menu_dots(xpos+xx,yy,rr,sep,c_white);
		
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,0,pct_x(10),region,true,submenu)
			{}
		}
	else if header_type == headerType.back
		{
		var xx = pct_x(3);
		var yy = header_height*0.5;
		var ww = header_height*0.33*1.25;
		var hh = header_height*0.33;
		
		draw_menu_arrow(xpos+xx,yy,ww,hh,4,1,c_white);

		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,0,pct_x(10),region,true,submenu)
		screen_goto_prev();
		}
	else if header_type == headerType.trash
		{
		var xx = x_pct_x(20);
		draw_icon_height_centered_color(ico_trash3,0,xpos-xx,0,region,region,header_height*0.44,c_white,1); // trash icon

		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,0,pct_x(10),region,true,submenu)
		return true;
		}
	else if header_type == headerType.plus
		{
		draw_plus_button(xpos+pct_x(5),pct_y(6.5),region,false,c_white); // plus button
		
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,0,pct_x(10),region,true,submenu)
		return true;
		}
		
	var header_type = header_right;
	var xpos = pct_x(90);
	}
	
if keyboard_check(vk_numpad0)
	{
	draw_text_height_middled(pct_x(25),0,fps,header_height,header_height*0.4,1);
	draw_text_height_middled(pct_x(35),0,fps_real,header_height,header_height*0.4,1);
	}
	

// other header overwrite
//draw_header_delete(0,app_width,header_height);

return false;
}

function draw_screen_header_submenu(offset,sort_index) {
/// param offset
/// param sort_index
/// param header_string

var xx = 0;
var yy = header_height;
var hh = header_submenu_height;
var col = header_color;

draw_sprite_stretched_ext(spr_pixel,0,xx,yy,app_width,hh,col,1);

var header_num = argument_count-2;
var header_sep = app_width/header_num;
var val = undefined;

for(var i=0;i<header_num;i++)
	{		
	var pos = i*header_sep;
	var str_col = pick(c_lt_gray,c_white,i==sort_index);

	if click_button(pos,yy,argument[i+2],header_submenu_font_height,str_col,header_sep,header_submenu_height,undefined,false,false,submenu)
	val = i;
	}
	

// draw highlight underline
var xx = offset*header_sep;
var hh = 4;
var col = c_white;

draw_rectangle_pixel(xx,yy+header_submenu_height-y_pct_y(hh),header_sep,y_pct_y(hh),col,false);
draw_line_pixel(xx,yy+header_submenu_height-1,header_sep,1,c_lt_gray,1);

return val;
}

function draw_header_delete(yy,ww,hh){

draw_set_alpha(1)//headerDeleteOffsetDisp);

var col = make_color_rgb(0,137,123);
draw_rectangle_color(0,0,ww,hh,col,col,col,col,false);

var xx = 0;
var size = header_height*0.3;
var xoff = (hh-size)*0.5;

draw_menu_xout(xx+xoff,yy+xoff,size,size,x_pct_x(5),c_white); // draw xout

if mode_delete && click_region_released(0,0,hh,hh,true,submenu,1)
	{
	mode_delete = false;
	androidBack = false;
	}

var xx = 120;
var height = 40;
var count = 0;
var size = ds_list_size(deleteList);

for(var i=0;i<size;i++)
count += deleteList[| i];

draw_set_color(c_white);
draw_text_height_middled(pct_x(13),yy,string(count)+" selected",hh,header_height*0.44,headerDeleteOffsetDisp); // draw number of items to delete

// clicked on trash
var xx = pct_x(91);
draw_icon_height_centered(ico_trash3,0,xx,yy,hh,hh,header_height*0.44,headerDeleteOffsetDisp); // trash icon

if mode_delete && click_region_released(xx,0,hh,hh,true,submenu,1)
delete_list_delete_array(deleteList,mode_delete_list_id);

draw_set_color(c_black);
draw_set_alpha(1);
}







