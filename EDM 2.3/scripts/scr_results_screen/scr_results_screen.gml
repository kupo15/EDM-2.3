function scr_results_screen() {
	
	if scrolling || (close_enough_timer != -1)
	exit;

	if mouse_check_button_pressed(mb_left)
	results_screen_start = results_screen;
	else if mouse_check_button(mb_left)
	   {
	   var amt = global.mouse_xdist*0.0009765625;

	   results_screen = results_screen_start-amt;
	   results_screen = clamp(results_screen,0,2);
   
	   if (abs(amt) > 0.01)
	   results_scrolling = true;
	   }
	else if mouse_check_button_released(mb_left)
	    {
	    if (results_screen > results_screen_start) // if moving the left
	        {
	        if (frac(results_screen) > 0.25)
	        results_screen_end = ceil(results_screen);
	        }
	    else if (results_screen < results_screen_start) // if moving the right
	        {
	        if (frac(results_screen) < 0.75)
	        results_screen_end = floor(results_screen);
	        }
	    }

	// lerp screen
	results_screen = lerp(results_screen,results_screen_end,0.2);
	}
