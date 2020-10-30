function scr_calculate_results() {
	// calculate all
	scr_calculate_results_teams(2);
	scr_calculate_net_scores(3);
	scr_calculate_results_final(4);

	show_debug_message("calculated");
    
	phase = 2;

	if settings_close_enough && !close_enough
	    { // do the close enough screen
	    picture_timer_start = game_time;
	    close_enough_timer = room_speed*5;
	    }
	close_enough = true;

	if !season_save
	season_ranking_save();

	ini_results_save();



}
