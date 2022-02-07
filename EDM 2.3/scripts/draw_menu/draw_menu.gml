enum screenEnum {
	
homeScreen,

settingsHome,
preferences,
payoutSettings,
seasonRank,
manageMembers,

eventRunning,
eventResults
}

function ini_screens() {
	
	drawScreen[screenEnum.homeScreen] = screen_home;
	drawScreen[screenEnum.settingsHome] = screen_settings;
	drawScreen[screenEnum.seasonRank] = screen_season_rankings;
	drawScreen[screenEnum.preferences] = draw_preferences;
	drawScreen[screenEnum.payoutSettings] = screen_payouts;
	drawScreen[screenEnum.eventRunning] = screen_score_entry;
	drawScreen[screenEnum.eventResults] = screen_results;
	
	screen_index = screenEnum.homeScreen;
	prevScreenStack = [];
	}

function draw_menu() {
	
	draw_set_font(fn_name);
	draw_set_halign(fa_center);

	script_execute(drawScreen[screen_index]);
	
	draw_settings_icon();
	}
	
function screen_change(ind) {
	
	array_push(prevScreenStack,screen_index);
	screen_index = ind;
	}
	
function screen_back(clear=false) {
	
	if (array_length(prevScreenStack) > 0)
	screen_index = array_pop(prevScreenStack);
	
	if clear
	prevScreenStack = [];
	}
	
function draw_settings_icon() {
	
	var xx = 970;
	var yy = 15;
	var ind = pick(0,1,in_settings);
	var ww = sprite_get_width(ico_settings);

	// draw icon
    draw_sprite(ico_settings,ind,xx,yy);

	// clicked on icon
	if scr_mouse_position_room_released(xx,yy,ww,ww,mb_left,true) && (edit_score == noone) && (edit_team_score == noone) {
		
		if in_settings {
			
			if (screen_index == screenEnum.settingsHome)
			in_settings = false;
			
			screen_back();
			
			if (screen_index == screenEnum.eventResults)
			scr_calculate_results();
			}
		else {
			
			in_settings = true;
			screen_change(screenEnum.settingsHome);			
			}
		}
	}
