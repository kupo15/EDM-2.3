

// background colors
#macro c_lt_gray make_color_rgb(228,228,228)
#macro c_click_color make_color_rgb(230,230,230)

// textbox scrolling
#macro fric 0.009
#macro flick_max 0.5
#macro flick_window 5
#macro refresh_dist 6

enum configTimer {
	
	appStart,
	}

randomize();
device_mouse_dbclick_enable(false);
draw_set_circle_precision(64);
draw_set_font(fnRegular);
draw_set_color(c_black);

ini_config();

instance_create_depth(0,0,0,con_main);
instance_destroy();