function draw_menu() {
	
	draw_set_font(fn_name);
	draw_set_halign(fa_center);

	// draw preferences icon
	var pref_xx = 970;
	var pref_yy = 15;
	
	if (pref_phase == prefPhase.none) {
		
	    draw_sprite(spr_preferences,0,pref_xx,pref_yy);
		
		// clicked on gear icon
	    if (edit_score == noone) && (edit_team_score == noone) && scr_mouse_position_room_released(pref_xx,pref_yy,40,40,mb_left,true)
	    pref_phase = prefPhase.preferences;
	    }
	else 
	draw_sprite(spr_back,0,950,15); // draw return button

	var ysep = sprite_get_height(spr_member_button)+2;

	if (pref_phase == prefPhase.preferences)
	draw_preferences();
	else if (pref_phase == prefPhase.seasonRank)
	draw_season_ranking();
	else if (phase == prefPhase.none)
	    {
	    if (list_type == listType.favorites)
	    draw_favorites_list(ysep);
	    else
	    draw_member_list(ysep);
		
	    draw_team_list(ysep);
	    draw_create_teams_button();
	    }
	else if phase = 1
	draw_teams();
	else if phase > 1
	draw_results();
	}
