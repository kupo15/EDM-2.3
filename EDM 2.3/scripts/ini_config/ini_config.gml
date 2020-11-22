function ini_config() {
	
gpu_set_texfilter(true);
	
if os_type == os_android
	{
	// disable fullscreen 
	var flags = 1024|4096;
	display_set_ui_visibility(flags);	
	
	// set layout
	app_width = display_get_width();
	app_height = display_get_height();
	
	// set app layout variables
	DPI_X = display_get_dpi_x();
	DPI_Y = display_get_dpi_y();

	// apply settings
	surface_resize(application_surface,app_width,app_height); // resize app surface
	display_set_gui_size(app_width,app_height); // set GUI
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
	var scale = 1;
	var debug_ww = 1.9;
	
	surface_resize(application_surface,ww*scale,hh*scale);
	display_set_gui_size(app_width,app_height); // set GUI
	
	// set window
	var window_ww = ww*debug_ww*scale;
	var window_hh = hh*scale;
		
	window_set_size(window_ww,window_hh);

	var disp_center_ww = display_get_width()*0.5;
	var disp_center_hh = display_get_height()*0.5;
	
	var window_xx = disp_center_ww-(window_ww*0.5);
	var window_yy = disp_center_hh-(window_hh*0.5);
	
	window_set_position(window_xx,window_yy);
	}
	
// set dpi variables
DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
	
global.DPI_X_CONVERT = display_get_dpi_x()/DPI_POINT;
global.DPI_Y_CONVERT = display_get_dpi_y()/DPI_POINT;
}
