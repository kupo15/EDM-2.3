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
	drawScreen[screenEnum.manageMembers] = screen_manage_members;
	
	drawScreen[screenEnum.eventRunning] = screen_score_entry;
	drawScreen[screenEnum.eventResults] = screen_results;
	
	screen_index = screenEnum.homeScreen;
	prevScreenStack = [];
	}

function draw_menu() {
	
	draw_set_font(fn_normal);
	draw_set_halign(fa_center);

	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,1);
	script_execute(drawScreen[screen_index]);
	
	draw_settings_icon();
	}
	
function screen_change(ind,clear=false) {
	
	array_push(prevScreenStack,screen_index);
	screen_index = ind;
	
	if clear
	prevScreenStack = [];
	}
	
function screen_back(clear=false) {
	
	if (array_length(prevScreenStack) > 0)
	screen_index = array_pop(prevScreenStack);
	
	if clear
	prevScreenStack = [];
	}
	
function draw_settings_icon() {
	
	var yy = 0;
	var ind = pick(0,1,in_settings);
	var ww = sprite_get_width(ico_settings)*1.2;
	var xx = room_width-ww;

	// draw icon
	if draw_icon_click(ico_settings,ind,xx,yy,ww,ww) && (edit_score == noone) && (edit_team_score == noone) {
		
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
