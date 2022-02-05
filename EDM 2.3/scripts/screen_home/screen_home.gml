function screen_home() {
	
	var ysep = sprite_get_height(spr_member_button)+2;

	//if (list_type == listType.favorites)
	//draw_favorites_list(ysep);
	//else
	
	draw_member_list(ysep);
	draw_team_list_home(ysep);
	
	// buttons
	draw_clear_all_teams_button();
	draw_create_teams_button();
	}