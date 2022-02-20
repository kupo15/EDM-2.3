function draw_results() {
		
	if !surface_exists(results_surface)
	results_surface = surface_create(room_width*3,room_height);

	// build surface
	surface_set_target(results_surface);
	draw_clear_alpha(c_black,0);
	
	draw_set_halign(fa_left);
	draw_results_final();   
	//draw_results_teams();
	//draw_results_low_net();
	
	surface_reset_target();
	
	scr_results_screen(); // scrolling navigation
	draw_surface(results_surface,0,0); // draw surface
	}
