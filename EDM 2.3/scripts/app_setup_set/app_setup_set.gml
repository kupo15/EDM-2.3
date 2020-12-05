
function app_setup_set() {
	
var ww = display_get_width();
var hh = display_get_height();	
	
window_set_position(0,0);
	
surface_resize(application_surface,ww,hh); // resize app surface
display_set_gui_size(ww,hh); // set GUI

canvas_width = ww;
canvas_height = hh;
}