function ini_resolution() {

	// set resolution
	var debg_ww = 1.3;
	var scale = 1.25;
	resolution_height = display_get_height();
	resolution_height = 600;
	resolution_width = round(resolution_height*1.70666);

	window_set_size(resolution_width*debg_ww*scale,resolution_height*scale);

	window_set_position(100,100);
	}