/*var a = 0<<0
a = a | 1<<1;
a = a | 0<<2;
a = a | 1<<3;
var b = a & 1;
show_message(b);
var b = a & 2;
show_message(b);
var b = a & 4;
show_message(b);
var b = a & 8;
show_message(b);*/


randomize();
device_mouse_dbclick_enable(false);
debug = false;

//show_debug_overlay(true);

// set resolution
var debg_ww = 1.3;
var scale = 1.5;
resolution_height = display_get_height();
resolution_height = 600;
resolution_width = round(resolution_height*1.70666);
window_set_size(resolution_width*debg_ww*scale,resolution_height*scale);
window_set_position(0,0);


instance_create_depth(0,0,0,con_main);