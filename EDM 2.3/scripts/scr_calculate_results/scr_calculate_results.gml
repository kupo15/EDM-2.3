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
	EVENT_RESULTS = new EventResults();

	screen_change(screenEnum.eventResults);

	// do the close enough screen
	if SETTINGS.closeEnough && !close_enough {
		
		close_enough = true;
	    picture_timer_start = game_time;
	    close_enough_timer = room_speed*5;
	    }
	
exit
	if !season_save
	season_ranking_save();
	
	// save results
	}

function EventResults() constructor {
	
	entrantResults = deep_copy(con_main.entrantResultsList);
	teamResults = TeamResults();
	
	array_sort_struct(entrantResults,"entrantNumber",true);
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