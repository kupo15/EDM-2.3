function scr_event_create() {
	
active_event = {
		
	entrantNum: 0,	
		
	teams: [],
	
	payoutTable: [],
	
	eventDetails: {
		
		eventDate: date_current_datetime(),
		}
	}	
	
// event variables
teamlist_index = 0;
teammate_index = 0;
entrant_index = 0;

// create 6 blank teams
for(var i=0;i<6;i++)
setup_team_struct[i] = scr_team_create();

	
//cs(js(active_event))
//sm("")
}

function scr_team_create() {
	
var team_struct = {
	
	players: [],
	
	team: {
		frontScore: "",
		backScore: "",
		roundScore: "",
		}
	}
	
return team_struct;
}

function scr_event_player_create(member_id,disp_name) {
	
var player = {
	
	memberID: member_id,
	dispName: disp_name,
	frontScore: "",
	backScore: "",
	roundScore: "",
	
	grossSkins: 0,
	netSkins: 0,
	
	blind: undefined,
	noTeam: false,
	}
	
return player;
}
	
function scr_event_struct_setup() {
	
active_event.teams = []; // clear teams data
active_event_team_header = [];

// add teams to event struct
var size = array_length(setup_team_struct);
for(var i=0;i<size;i++)
	{
	var setup_team_players = setup_team_struct[i].players;
	var in_use = (array_length(setup_team_players) > 0);
	
	if in_use
		{
		var team_struct = scr_team_create(); // create a team struct
		var team_size = array_length(setup_team_players);
		
		for(var n=0;n<team_size;n++)
			{
			var member_pointer = setup_team_players[n];
			var member_id = member_pointer.memberID;
			
			var member_data = database_get_pointer(MEMBER_database,member_id,"memberID");
			var disp_name = member_data.firstName+" "+member_data.lastName;
		
			var entrant = scr_event_player_create(member_id,disp_name);
			array_push(team_struct.players,entrant); // add entrant to team
			}
			
		// add team to main struct
		array_push(active_event.teams,team_struct);
		}
	}
	
// add to header
var size = array_length(active_event.teams);
for(var i=0;i<size;i++)
array_push(active_event_team_header,"Team "+string(i+1));
}