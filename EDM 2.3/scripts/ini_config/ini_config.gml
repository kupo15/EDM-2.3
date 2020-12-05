function ini_config() {
	
gpu_set_texfilter(true);
	
if os_type == os_android
	{
	// disable fullscreen 
	var flags = 1024|4096;
	display_set_ui_visibility(flags);	
	
	// set layout
	var ww = display_get_width();
	var hh = display_get_height();
	
	app_width = room_width;
	app_height = room_height;
	
	canvas_width = 0;
	canvas_height = 0;

	// apply settings
	alarm[0] = 2;
	}
else
	{
	// set app settings
	app_width = room_width;	
	app_height = room_height;	
	
	// set app layout variables
	DPI_X = DPI_POINT;
	DPI_Y = DPI_POINT;
		
	// apply settings
	var ww = app_width;
	var hh = app_height;
	var scale = 1.5;
	var debug_ww = 2.5;
		
	var disp_ww = display_get_width();
	var disp_hh = display_get_height();
	
	var window_ww = ww*scale;
	var window_hh = hh*scale;
	
	if disp_hh < window_hh
		{
		var adjust_scale = disp_hh/window_hh;
		
		window_ww *= adjust_scale*0.9;
		window_hh *= adjust_scale*0.9;
		}
		
	window_set_size(window_ww*debug_ww,window_hh);
	
	// set window
	var window_xx = (disp_ww-(window_ww*debug_ww))*0.5;
	var window_yy = (disp_hh-window_hh)*0.5; // disp_center_hh-(window_hh*0.5);
	
	window_set_position(window_xx,window_yy);
	
	// set surface
	surface_resize(application_surface,window_ww,window_hh);
	display_set_gui_size(app_width,app_height); // set GUI
	
	canvas_width = surface_get_width(application_surface);
	canvas_height = surface_get_height(application_surface);
	}
	
// set dpi variables
DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
	
DPI_X_CONVERT = display_get_dpi_x()/DPI_POINT;
DPI_Y_CONVERT = display_get_dpi_y()/DPI_POINT;
}
