function scr_calculate_results() {
	
	// calculate all
	scr_calculate_missing_fields();
	//scr_event_results_build();

	create_entrant_list_results();
	scr_calculate_results_teams();
	scr_calculate_net_scores();
	scr_calculate_results_final();
	scr_calculate_member_handicaps();
	db("calculated");

	cs(js(TEAM_LIST))
	sm("")
    
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

function scr_event_results_build() {
	
	EVENT_RESULTS = new EventResults();
		
		
	cs(js(EVENT_RESULTS))
	}
	
function EventResults() constructor {
	
	lowNetResults = [];
	teamResults = [];
	}
