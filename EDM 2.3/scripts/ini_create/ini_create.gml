function ini_create() {

show_debug_overlay(true);

subheader_member = 0;
teamlist_index = 0;
teammate_index = 0;
entrant_index = 0;
score_nine_index = 0;

numpad_negate = -1;
numpad_next = false;

assigning_blind = undefined;

event_entrant_array = [];

// create 6 blank teams
for(var i=0;i<6;i++)
setup_team_struct[i] = scr_team_create();

active_event = undefined;
active_event_team_header = [];
}
