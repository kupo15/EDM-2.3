function scr_event_create() {
	
active_event = {
		
	teams: [],
	
	payoutTable: [],
	
	eventDetails: {
		
		eventDate: date_current_datetime(),
		}
	}	
	
// create 6 blank teams
for(var i=0;i<6;i++)
active_event.teams[i] = scr_team_create();

//cs(js(active_event))
//sm("")
}

function scr_team_create() {
	
var team_struct = {
	
	players: [],
	
	frontScore: "",
	backScore: "",
	roundScore: undefined,
	}
	
return team_struct;
}

function scr_event_player_create() {
	
var player = {
	
	memberID: -1,
	frontScore: "",
	backScore: "",
	roundScore: undefined,
	
	grossSkins: "",
	netSkins: "",
	
	blind: undefined,
	noTeam: false,
	}
}