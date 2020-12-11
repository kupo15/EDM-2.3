
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

var del_col = make_color_rgb(0,137,123); // delete header color
var col = merge_color(bg_col,del_col,headerDeleteOffsetDisp);

vertex_buffer_header_rect(0,0,ww,bleed_top,hh+bleed_top,header_buffer_color,col,1);

var xpos = 0;
var region = header_height;
var header_type = header_left;
var return_val = false;

repeat 2
	{
	if header_type == headerType.bars
		{
		// draw the 3 bars
		var ww = header_height*0.4;
		var hh = header_height*0.35;
		var xx = (region-ww)*0.6;
		var yy = header_ypos_end*0.5;
		var thick = y_pct_y(6);
		
		draw_menu_bars(xpos+xx,yy,ww,hh,thick,c_white,1-headerDeleteOffsetDisp);

		// clicked on bars
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,bleed_top,pct_x(10),region,true,submenu)
			{
			submenuPrevious = submenu;
			submenu = navbar.sidebar;
			}
		}
	else if header_type == headerType.dots
		{
		// draw the 3 dots
		var xx = region*0.5;
		var yy = header_ypos_end*0.5;
		var rr = header_height*0.035;
		var sep = header_height*0.067;
		
		draw_menu_dots(xpos+xx,yy,rr,sep,c_white,1-headerDeleteOffsetDisp);
		
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,bleed_top,pct_x(10),region,true,submenu)
			{}
		}
	else if header_type == headerType.back
		{
		var xx = pct_x(3);
		var yy = header_ypos_end*0.5;
		var ww = header_height*0.43;
		var hh = header_height*0.44;
		
		draw_menu_arrow(xpos+xx,yy,ww,hh,4,1,c_white,1-headerDeleteOffsetDisp);

		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,bleed_top,pct_x(10),region,true,submenu)
		screen_goto_prev();
		}
	else if header_type == headerType.trash
		{
		var xx = x_pct_x(15);
		var yy = bleed_top;
		
		draw_icon_height_centered_color(ico_trash3,yy,xpos,yy,pct_x(10),region,header_height*0.44,c_white,1-headerDeleteOffsetDisp); // trash icon

		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,bleed_top,pct_x(10),region,true,submenu)
		return_val = true;
		}
	else if header_type == headerType.plus
		{
		var yy = bleed_top+pct_y(6.5);
		
		draw_plus_button(xpos+pct_x(5),yy,region,c_white,undefined,undefined,1-headerDeleteOffsetDisp); // plus button
		
		if !mode_delete && (submenu < 0)
		if click_region_released(xpos,bleed_top,pct_x(10),region,true,submenu)
		return_val = true;
		}
		
	var header_type = header_right;
	var xpos = pct_x(88);
	}
	

// other header overwrite
draw_header_delete(bleed_top,app_width,header_height);

// draw header text
draw_text_height_middled_color(pct_x(15),bleed_top,header_string,header_height,c_white,height,1-headerDeleteOffsetDisp,undefined,undefined);

return return_val;
}

function draw_screen_header_submenu(offset,sort_index) {
/// param offset
/// param sort_index
/// param header_string

var xx = 0;
var yy = header_ypos_end;
var hh = header_submenu_height;
var col = header_color;

//draw_rectangle_color(xx,yy,app_width,hh,col,col,col,col,false);
draw_rectangle_pixel(xx,yy,app_width,hh,col,false);
	
// draw highlight underline
var header_num = argument_count-2;
var header_sep = app_width/header_num;
var val = undefined;

var xx = offset*header_sep;
var hh = 4;
var col = c_white;

draw_rectangle_pixel(xx,yy+header_submenu_height-y_pct_y(hh),header_sep,y_pct_y(hh),col,false);
draw_line_pixel(xx,yy+header_submenu_height-1,header_sep,1,c_lt_gray,1);

// draw headers
for(var i=0;i<header_num;i++)
	{		
	var pos = i*header_sep;
	var str_col = pick(c_lt_gray,c_white,i==sort_index);

	if click_button(pos,yy,argument[i+2],header_submenu_font_height,str_col,header_sep,header_submenu_height,undefined,false,false,submenu)
	val = i;
	}

return val;
}

function draw_header_delete(yy,ww,hh){

// don't draw
if headerDeleteOffsetDisp < 0.1
exit;

var xx = 0;
var size = header_height*0.3;
var xoff = (hh-size)*0.8;
var yoff = (hh-size)*0.5;

draw_menu_xout(xx+xoff,yy+yoff,size,size,x_pct_x(5),c_white,headerDeleteOffsetDisp); // draw xout

if mode_delete && click_region_released(0,yy,pct_x(10),hh,true,submenu,1)
	{
	mode_delete = false;
	androidBack = false;
	}

// clicked on trash
var xx = pct_x(88);
draw_icon_height_centered_color(ico_trash3,0,xx,yy,hh,hh,header_height*0.55,c_white,headerDeleteOffsetDisp); // trash icon

draw_set_alpha(headerDeleteOffsetDisp);

if mode_delete && click_region_released(xx,yy,hh,hh,true,submenu,1)
delete_list_delete_array(deleteList,mode_delete_list_id);

// number of items selected
var xx = 120;
var height = 40;
var count = 0;
var size = ds_list_size(deleteList);

for(var i=0;i<size;i++)
count += deleteList[| i];

draw_text_height_middled_color(pct_x(13),yy,string(count)+" selected",hh,c_white,header_height*0.44,headerDeleteOffsetDisp); // draw number of items to delete

draw_set_alpha(1);
}







