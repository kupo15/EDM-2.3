function EventResults() constructor {
	
	lowNetResults = [];
	teamResults = [];
	}

function scr_calculate_results() {
	
	//scr_event_results_build();
	
	// calculate all
	scr_calculate_results_teams(2);
	//scr_calculate_net_scores(3);
	scr_calculate_results_final();
	//scr_calculate_member_handicap();

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

function scr_event_results_build() {
	
	EVENT_RESULTS = new EventResults();
	
	// team results
	EVENT_RESULTS.teamResults = deep_copy(TEAM_LIST);
	array_delete(EVENT_RESULTS.teamResults,team_number+1,teams_max-team_number-1);
	
	// low net results
	var copy = deep_copy(EVENT_RESULTS.teamResults);

	// loop through teams
	for(var i=0;i<array_length(copy);i++) {
		
		var teamList = copy[i].members;

		// while not empty
		for(var j=0;j<array_length(teamList);j++)
		array_push(EVENT_RESULTS.lowNetResults,teamList[j]);
		}
		
		
	cs(js(EVENT_RESULTS))
	}