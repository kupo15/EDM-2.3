function scr_calculate_results() {

	// reset scrollbars
	results_final_offset = 0;
	results_low_net_offset = 0;
	
	picture_timer_skip = false;

	// calculate all
	scr_calculate_missing_fields();
	scr_calculate_results_teams();
	scr_calculate_net_scores();
	scr_calculate_results_skins();
	scr_calculate_results_final();

	// create event results struct to display
	FINAL_EVENT_RESULTS = new EventFinalResults();
	lowNetResults = deep_copy(FINAL_EVENT_RESULTS.entrantResults);
	
	// sort event results
	low_net_rank_sort_results();
	activate_results_animation();
	
	// save event history and round history
	member_round_save();
	season_ranking_save();
	save_program;
	
	// go to event results screen
	screen_change(screenEnum.eventResults);
	}
	
function activate_results_animation() {
	
	// do the close enough screen
	if SETTINGS.closeEnough && !close_enough_shown {
		
		close_enough_shown = true;
	    picture_timer_start = GAME_TIME;
	    close_enough_timer = room_speed*5;
	    }
	}

function EventFinalResults() constructor {
	
	entrantResults = deep_copy(con_main.entrantResultsList);
	teamResults = TeamResults();
	eventDate = date_current_datetime();
	
	array_sort_struct(entrantResults,"entrantNumber",true,["activeEvent","eventDetails"]);
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