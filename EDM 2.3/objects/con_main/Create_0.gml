
enum eventEnum {
	
team,
individual
}

draw_set_circle_precision(64);
//randomize();
device_mouse_dbclick_enable(false);

debug = false;
//show_debug_overlay(true);

ini_screens();
ini_styles();
ini_resolution();
ini_scrollbars();

manageMemberIndex = 0;

resultsEdited = false;

season_breakdown_add_member = false;
season_breakdown_date_x = noone; // select a date
season_breakdown_edit_x = noone; // edit the breakdown
season_breakdown_edit_y = noone; // edit the breakdown
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

scrollbarActive = scrollbarIndex.none;
scrollbar_disp = 0;
scrollbar_disp_end = 0;

eventType = eventEnum.team; // default to team event

// pointer variables
mouse_xstart = 0;
mouse_ystart = 0;
mouse_left = 0;

global.clicked = false;

global.mouse_xdist = 0
global.mouse_ydist = 0;

global.mouse_xprev = 0;
global.mouse_yprev = 0;

scrolling = false;
results_calculated = false;
results_screen = 0;
results_screen_start = 0;
results_screen_end = 0;
results_screen_momentum = 0;

clear_all_safty = true;
default_payout_safty = true;
global.save_loaded = false; // if you loaded previous results

edit_team_offset = 0;
edit_team_add_member = false;

restart = false;
keypad_entry = false;
deleting_member = false;

picture_timer_skip = 0;
picture_timer_start = 0; // game time when you start the picture

close_enough_timer = -1;
close_enough_skip = false;
close_enough_shown = false; // if already done once

list_slot = noone;

button_index = 0;
button_ww = sprite_get_width(spr_member_button);
button_hh = sprite_get_height(spr_member_button);
button_sep = button_hh+3;

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
select_blind_team = undefined;

edit_score_highlight_pos = 0;

edit_score_offset = 0;
edit_score_scrolling_offset = 0;
edit_score_scrolling_offset_end = 0;
edit_score_scrolling = false;
can_edit_score_scroll = false;

// edit score surface
surface = surface_create(room_width,room_height);

// logic variables
add_member = false;
edit_member = false;
edit_member_struct = undefined;
edit_score = noone;
edit_team_score = noone;

edit_score_pos = entryType.memberFront; // which score you are entering
team_index_entry = undefined;

team_index = 0; // the team selected to add to
team_number = -1; // number of teams entered
net_score_tab = 0;

skins_input = true;
noTeamCount = 0;

pref_phase = screenEnum.homeScreen;
no_net_skins = false;
no_gross_skins = false;

entrant_list = [];

results_surface = -1;

ini_settings();

season_delete_safty = true;
season_ranking_header_grid = ds_grid_create(2,3); // the date and info of the day recorded
season_ranking_grid = ds_grid_create(2,1);
season_ranking_usage_grid = ds_grid_create(2,1);
season_ranking_load();
    
ini_timer(mainTimers.enumcount);
ini_save_file();

enum listType {
	
	members,
	favorites
	}

dev_mode = (os_type == os_windows);

instance_create_layer(500,0,"Instances_1",obj_number_input);
instance_create_layer(0,room_height,"Instances_1",obj_tee_selector);