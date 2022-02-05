function draw_menu() {
	
	draw_set_font(fn_name);
	draw_set_halign(fa_center);


	draw_settings_icon();

	if (pref_phase == prefPhase.preferences)
	screen_settings();
	else if (pref_phase == prefPhase.seasonRank)
	screen_season_rankings();
	else if (phase == prefPhase.homeScreen)
	screen_home();
	else if phase = 1
	screen_score_entry();
	else if phase > 1
	screen_results();
	}
	
function draw_settings_icon() {
	
	// draw preferences icon
	var pref_xx = 970;
	var pref_yy = 15;
	
	if (pref_phase == prefPhase.homeScreen) {
		
	    draw_sprite(spr_preferences,0,pref_xx,pref_yy);
		
		// clicked on gear icon
	    if (edit_score == noone) && (edit_team_score == noone) && scr_mouse_position_room_released(pref_xx,pref_yy,40,40,mb_left,true)
	    pref_phase = prefPhase.preferences;
	    }
	else 
	draw_sprite(spr_back,0,950,15); // draw return button
	}
