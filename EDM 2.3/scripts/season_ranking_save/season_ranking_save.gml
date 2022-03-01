function season_ranking_save() {
	
	if resultsEdited
	EVENT_HISTORY[0] = FINAL_EVENT_RESULTS; // edit last entry
	else
	array_push(EVENT_HISTORY,FINAL_EVENT_RESULTS); // add new entry
	
	cs(js(EVENT_HISTORY))
	}
