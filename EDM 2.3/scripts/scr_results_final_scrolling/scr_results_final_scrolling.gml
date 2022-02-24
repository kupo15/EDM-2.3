function scr_results_final_scrolling(xx,yy,ww) {

	var hh = 406;
	var disp_count = 12;
	var size = array_length(EVENT_RESULTS.entrantResults);

	if (size-1 < disp_count) || (close_enough_timer != -1)
	exit;

	draw_set_color(c_gray);
	funct_draw_scrollbar(xx-5,yy,disp_count,0,size,20,results_final_offset,33.8,0);
	draw_set_color(c_black);

	if results_scrolling
	exit;

	// scroll
	if scr_mouse_position_room_pressed(xx-30,yy,ww+30,hh,mb_left,false,false)
	results_final_offset_start = results_final_offset;

	if scr_mouse_position_room(xx,yy,ww,hh,mb_left,false) {
		
	    var num = 1;
	    var amt = (global.mouse_ydist*num);
		
	    results_final_offset = results_final_offset_start-amt;
	    results_final_offset = clamp(results_final_offset,0,size-disp_count);
    
	    if (abs(results_final_offset-results_final_offset_start) > 0.01) {
			
			scrollbar_disp_end = 1;
		    scrolling = true;
			}
	    }     
	}
