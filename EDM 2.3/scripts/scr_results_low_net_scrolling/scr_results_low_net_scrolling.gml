function scr_results_low_net_scrolling(xx,yy,ww,hh,sep,disp_count) {
	
	var size = array_length(EVENT_RESULTS.entrantResults);

	if (size-1 < disp_count)
	exit;

	draw_set_color(c_gray);
	funct_draw_scrollbar(xx,yy+(3*30),disp_count,0,size,20,results_low_net_offset,30.33,0);
	draw_set_color(c_black);

	if results_scrolling
	exit;

	// scroll
	if scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	results_low_net_offset_start = results_low_net_offset;

	if scr_mouse_position_room(xx,yy,ww,hh,mb_left,false) {
		
		var num = 1/sep;
	    var amt = (global.mouse_ydist*num);
		
	    results_low_net_offset = clamp(results_low_net_offset_start-amt,0,size-disp_count);
    
	    if (abs(results_low_net_offset-results_low_net_offset_start) > 0.01) {
			
			scrollbar_disp_end = 1;
		    scrolling = true;
			}
	    }
	}
