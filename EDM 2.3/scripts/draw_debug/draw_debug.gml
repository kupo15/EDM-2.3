function goto_draw_debug() {};

function draw_debug() {
	
if os_type == os_android
exit;

var win_ww = window_get_width();
var win_hh = window_get_height();
	
var xx = (app_width-(win_ww/testingScale)+20)*0.5;
var yy = 10;
var sep = y_pct_y(45);
var height = sep;

if !keyboard_check(vk_numpad0)
exit; 

draw_rectangle_color(xx-50,0,0,app_height,c_black,c_black,c_black,c_black,false);
draw_rectangle_color(app_width,0,app_width+760,app_height,c_black,c_black,c_black,c_black,false);


debugyoff = 0;

draw_set_colour(c_white);
draw_set_halign(fa_left);

debug_draw_screens(xx,yy,debugyoff,sep,height);
//debug_draw_screen_darken(xx,yy,debugyoff,sep,height);


debugyoff = 14;
//debug_draw_click_highlight(xx,yy,debugyoff,sep,height);
//debug_draw_vk(xx,yy,debugyoff,sep,height);
debug_draw_strings(xx,yy,debugyoff,sep,height);
//debug_draw_textbox(xx,yy,debugyoff,sep,height);
//debug_draw_sidebar_fades(xx,yy,debugyoff,sep,height);
//debug_draw_switch_tabs(xx,yy,debugyoff,sep,height);
//debug_draw_modes(xx,yy,debugyoff,sep,height);
//debug_draw_textbox_cursor(xx,yy,debugyoff,sep,height);	
//debug_draw_scrollbars(xx,yy,debugyoff,sep,height);	
//debug_device_info(xx,yy,debugyoff,sep,height);	
//draw_text_height(xx,yy+((debugyoff+0)*sep),"numpad_value: "+string(numpad_value),height);
//debug_draw_calendar(xx,yy,debugyoff,sep,height);
	
//draw_text_height(xx,yy+(25*sep),"search results "+string(ds_list_size(searchedList)),height);
//draw_text_height(xx,yy+((debugyoff+0)*sep),"Resolution: "+string(win_ww)+"x"+string(win_hh),height); // resolution
	

// right side
var xx = app_width+10;

// draw prev screen stack
var size = ds_list_size(prevScreenStack);

// draw current screen
if screenIndex == screen.appStartup
var str = "appStartup";
else
	{
	var str = script_get_name(drawScreen[screenIndex]);
	str = string_replace(str,"draw_","");
	}

draw_text_height(xx,yy+(0*sep),string(str),height);


draw_text_height(xx+x_pct_x(320),yy+(0*sep),string(fps_real),height);

// draw dividing line
draw_line(xx,yy+sep,xx+200,yy+sep);

// draw prev screens
for(var i=0;i<size;i++)
	{
	var arr = prevScreenStack[| size-i-1];
	var _screen = arr[0];
	var _sub = arr[1];
	
	var str = script_get_name(drawScreen[_screen]);

	draw_text_height(xx,yy+((i+1)*sep),str+" - "+string(enum_name_submenu[-navbar.enumstart+1+_sub]),height);
	}
		
debugyoff = 10;		
debug_draw_mouse(xx,yy,debugyoff,sep,height);
debug_draw_device_testing(xx,yy,debugyoff,sep,height);

		
draw_set_color(c_black);
}

