function draw_results() {
				
	// scrolling navigation
	scr_results_screen_scrolling();
	
	if !surface_exists(results_surface)
	results_surface = surface_create(room_width*3,room_height);

	// build surface
	surface_set_target(results_surface);
	draw_clear_alpha(c_black,0);
	
	// draw pages
	draw_set_halign(fa_left);
	draw_results_overview(0);
	draw_results_teams(1);
	//draw_results_low_net(2);
	
	surface_reset_target();
	
	var xx = -results_screen*room_width;
	draw_surface(results_surface,xx,0); // draw surface
	}
