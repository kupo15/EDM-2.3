function scr_event_create() {
	
active_event = {
		
	teams: [],
	
	payoutTable: [],
	
	eventDetails: {
		
		eventDate: date_current_datetime(),
		}
	}	
	
for(var i=0;i<6;i++)
active_event.teams[i] = scr_team_create();

//cs(js(active_event))
//sm("")
}

function scr_team_create() {
	
var team_struct = {
	
	players: [],
	
	}
	
return team_struct;
}