// alarm[0]

function app_setup_set() {
	
if os_type == os_android
	{
	app_width = display_get_width();
	app_height = display_get_height();

	update_resolution(app_width,app_height);
	}
else
	{	
	app_width = window_get_width();
	app_height = window_get_height();
	
	// adjust window size and position for debugging
	var scale = 1;
	var debug_ww = 1.75;
		
	var disp_ww = display_get_width();
	var disp_hh = display_get_height();
	
	// set window size
	var window_ww = window_get_width()*scale;
	var window_hh = window_get_height()*scale;
	
	if disp_hh < window_hh
		{
		var adjust_scale = disp_hh/window_hh;
		
		window_ww *= adjust_scale*0.9;
		window_hh *= adjust_scale*0.9;
		}
		
	window_set_size(window_ww*debug_ww,window_hh);
	
	// set window position
	var window_xx = (disp_ww-(window_ww*debug_ww))*0.5;
	var window_yy = (disp_hh-window_hh)*0.5; // disp_center_hh-(window_hh*0.5);
	
	window_set_position(window_xx,window_yy);
	
	device_testing_select(deviceTesting.fireTablet);
	}

}