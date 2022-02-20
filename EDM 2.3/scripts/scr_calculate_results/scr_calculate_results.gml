function EventResults() constructor {
	
	lowNetResults = [];
	teamResults = [];
	}

function scr_calculate_results() {
	
	event_results = new EventResults();
	
	// calculate all
	//scr_calculate_results_teams(2);
	//scr_calculate_net_scores(3);
	//scr_calculate_results_final(4);

	show_debug_message("calculated");
    
	screen_change(screenEnum.eventResults);

	// do the close enough screen
	if SETTINGS.closeEnough && !close_enough { 
		
	    picture_timer_start = game_time;
	    close_enough_timer = room_speed*5;
	    }
		
	close_enough = true;
exit
	if !season_save
	season_ranking_save();
	
	// save results
	}
