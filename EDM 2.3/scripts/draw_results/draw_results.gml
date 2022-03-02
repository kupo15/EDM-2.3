function draw_results(alpha) {
				
	// scrolling navigation
	draw_set_alpha(1);
	scr_results_screen_scrolling();
	
	if !surface_exists(results_surface)
	results_surface = surface_create(room_width*3,room_height);

	// build surface
	surface_set_target(results_surface);
	draw_clear_alpha(c_black,0);
	
	// draw pages
	draw_set_halign(fa_left);
	draw_results_overview(0);
	
	if (FINAL_EVENT_RESULTS != undefined) {
		
		draw_results_teams(1);
		draw_results_low_net(2);
		}
	
	surface_reset_target();
	
	// draw surface
	var xx = -results_screen*room_width;
	draw_surface_ext(results_surface,xx,0,1,1,0,c_white,1-alpha);
	}

function draw_close_enough_animation() {

	if (close_enough_timer == -1)
	return 0;
	
	// picture
	var time = (GAME_TIME-picture_timer_start);
	var ind = clamp(time/100,0,1);
	var alpha = sin(ind-50.09)+0.08;

	picture_timer_skip = clamp(picture_timer_skip+(close_enough_skip/70),0,1);

	var curve = animcurve_get_channel(AnimationCurve1,"curve2");
	var val = animcurve_channel_evaluate(curve,picture_timer_skip);
	var alpha_out = val;

	draw_sprite_ext(spr_close_enough,0,150,0,1,1,0,c_white,alpha*alpha_out);

	// quote	
	var curve = animcurve_get_channel(AnimationCurve1,"curve1");
	var stop_point = pick(curve.points[1].posx+0.055,1,close_enough_skip);
	var ind = clamp(time/200,0,stop_point);
	var val = animcurve_channel_evaluate(curve,ind);
	var alpha = clamp((1.0+val)*1.5,0,1);
	
	var xx = 630;
	var dist = (room_width-xx)*0.7;
	var text_off = val*dist;

	draw_set_alpha(alpha*alpha_out);
	draw_set_halign(fa_left);
	draw_text_ext(xx+text_off,510,("\"-It's close\n      enough...\""),60,-1);
	
	// details button
	var xx = 820;
	var yy = 200;
	var ww = 180;
	var hh = 100;
	
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	if draw_text_button(xx,yy,"Details",40,ww,hh) {
		
	    if (ind == stop_point)
	    picture_timer_start = GAME_TIME-111;
				
	    close_enough_skip = true;
	    }

	if (alpha_out <= 0)
	close_enough_timer = -1;
	
	return alpha_out;
	}
