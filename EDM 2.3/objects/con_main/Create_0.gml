
enum tourneyType {
	
team,
individual
}


randomize();
device_mouse_dbclick_enable(false);

debug = false;
//show_debug_overlay(true);

ini_screens();
ini_styles();
ini_resolution();

season_breakdown_add_member = false;
season_breakdown_date_x = noone; // select a date
season_breakdown_edit_x = noone; // edit the breakdown
season_breakdown_edit_y = noone; // edit the breakdown
season_save = true;
season_new_day = true;

edit_event_scrolling = noone;
edit_event = false;
edit_event_month_offset_start = 0;
edit_event_month_offset = 0;
edit_event_day_offset = 0;
edit_event_day_offset_start = 0;
edit_event_time_offset = 8;
edit_event_time_offset_start = 0;
season_ranking_disp = 0;
scrollbar_disp = 0;
scrollbar_disp_end = 0;

tourney_type = tourneyType.team; // default to team event

distribute_leftover_skins = noone;

// pointer variables
global.clicked = false;
mouse_xstart = 0;
mouse_ystart = 0;
global.mouse_xdist = 0
global.mouse_ydist = 0;
mouse_left = 0;

scrolling = false;
results_calculated = false;
results_screen = 0;
results_screen_start = 0;
results_screen_end = 0;
results_screen_momentum = 0;
fn_off = -14;
clear_all_safty = true;
default_payout_safty = true;
global.save_loaded = false; // if you loaded previous results

edit_team_offset = 0;
edit_team_add_member = false;

restart = false;
keypad_entry = false;
deleting_member = false;

game_time = 0;
picture_timer_start = 0; // game time when you start the picture

close_enough_timer = -1;
close_enough_skip = false;
close_enough = false; // if already done once
close_enough_pause = false;

list_slot = noone;

button_index = 0;
button_ww = sprite_get_width(spr_member_button);
button_hh = sprite_get_height(spr_member_button);
button_sep = button_hh+3;

negate = 1;
last_entrant_number = 0; // number of entrants in the last game

// scrolling variables
favorites_scroll_offset = 0;
favorites_scroll_offset_start = 0;
member_scroll_offset = 0;
member_scroll_offset_start = 0;
team_scroll_offset = 0;
team_scroll_offset_start = 0;
team_scroll_speed = 0;
results_final_offset = 0;
results_final_offset_start = 0;
results_low_net_offset = 0;
results_low_net_offset_start = 0;
season_offset = 0;
season_offset_start = 0;
season_breakdown_offset = 0;
season_breakdown_offset_start = 0;
results_scrolling = false;
entrant_scrolling = false;
select_blind_team = noone;

edit_score_highlight_pos = 0;

edit_score_offset = 0;
edit_score_scrolling_offset = 0;
edit_score_scrolling_offset_end = 0;
edit_score_scrolling = false;
can_edit_score_scroll = false;

surface = surface_create(room_width,room_height);

// logic variables
add_member = false;
edit_member = false;
edit_member_slot = noone;
phase = 0;
edit_score = noone;
edit_team_score = noone;
edit_score_pos = 0;
team_index = 0; // the team selected to add to
team_number = -1; // number of teams entered
teams_max = 6; // the max number of teams to account for
net_score_tab = 0;
skins_total = 0;

skins_input = true;

pref_phase = screenEnum.homeScreen;
no_net_skins = false;
no_gross_skins = false;

ini_settings();

team_payout[5] = 0;

// create ds lists
recent_list = ds_list_create(); // list of recent players NOT in favorites
favorites_list = ds_list_create(); // list of frequent members to save to INI
favorites_members_list = ds_list_create(); // list of favorites to assign to teams
numpad_list = ds_list_create(); // to create scores from number pad

payout_list_front = ds_list_create(); // payout amounts
payout_list_back = ds_list_create(); // payout amounts
payout_list_total = ds_list_create(); // payout amounts

scores_grid = ds_grid_create(24,1);
scores_grid_front = ds_grid_create(ds_grid_width(scores_grid),1);
scores_grid_back = ds_grid_create(ds_grid_width(scores_grid),1);
scores_grid_total = ds_grid_create(ds_grid_width(scores_grid),1);

team_score_front_grid = ds_grid_create(4,teams_max);
team_score_back_grid = ds_grid_create(4,teams_max);
team_score_total_grid = ds_grid_create(4,teams_max);

pay_teams_save = ds_grid_create(6,3);
pay_low_net_save = ds_grid_create(24,7);

season_delete_safty = true;
season_ranking_header_grid = ds_grid_create(2,3); // the date and info of the day recorded
season_ranking_grid = ds_grid_create(2,1);
season_ranking_usage_grid = ds_grid_create(2,1);
season_ranking_load();

ds_grid_clear(scores_grid,0);

for(var i=0;i<teams_max;i++) {
	
    team_list[i] = ds_list_create();
    blind_list[i] = ds_list_create();
    team_score[i,0] = undefined;
    team_score[i,1] = undefined;
    team_score[i,2] = -99;
    }
    
ini_timer(mainTimers.enumcount);
ini_save_file();
ini_payout_table();

enum listType {
	
	members,
	favorites
	}

list_type = (ds_list_size(favorites_list) != 0); // default to favorites
dev_mode = false;

instance_create_layer(500,0,"Instances_1",obj_number_input);