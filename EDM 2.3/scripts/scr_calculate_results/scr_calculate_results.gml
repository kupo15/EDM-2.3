function scr_calculate_results() {
	
	// calculate all
	scr_calculate_missing_fields();
	scr_calculate_results_teams();
	
	entrantResultsList = create_entrant_list_results();
	scr_calculate_net_scores();
	scr_calculate_results_skins();
	scr_calculate_results_final();

	db("calculated");

	// create event results struct to display
	scr_event_results_build();
	
	scr_calculate_member_handicaps();

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
	sm("")
	}
	
function EventResults() constructor {
	
	lowNetResults = [];
	teamResults = TeamResults();
	}

function TeamResults() {
	
	var results = [];
	
	for(var i=0;i<con_main.team_number+1;i++) {
		
		var teamStruct = deep_copy(TEAM_LIST[i]);
		variable_struct_remove(teamStruct,"members");
		
		array_push(results,teamStruct);
		}
	
	return results;
	}