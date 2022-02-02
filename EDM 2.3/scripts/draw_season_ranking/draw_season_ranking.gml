function draw_season_ranking() {
	
	var xx = 100;
	var xsep = 80;
	var cols = 8;
	var ww = 250+(cols*xsep);
	var not_in_menu = !season_breakdown_add_member && (season_breakdown_date_x == noone) && (season_breakdown_edit_x == noone);

	var col = make_color_rgb(98,145,242);
	var str = pick("Season Breakdown","Season Ranking",!season_ranking_disp);
	
	draw_set_halign(fa_center);
	draw_text_colour(xx+(ww*0.5),10,str,col,col,col,col,1);

	// draw view all
	var xx = 20;
	var yy = 10;
	var ww = 150;
	var hh = 80;

	draw_set_color(c_black);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	var str = pick("Breakdown","Ranking",season_ranking_disp);

	draw_set_halign(fa_left);
	draw_text(xx+5,yy+30+fn_off-10,str);

	// ranking/breakdown toggle
	if not_in_menu && scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    season_ranking_disp = !season_ranking_disp; // toggle
	    season_offset = 0;
    
	    if season_ranking_disp // breakdown
			{
		    ds_grid_sort(season_ranking_grid,0,true); // sort by name
		    ds_grid_sort(season_ranking_usage_grid,0,true); // sort usage by name
			}
	    else // go to ranking
			{
			scr_season_breakdown_player_delete(); // cull unused players
		    scr_sort_season_ranking(); // sort for ranked leaderboard
			}
	    }

	// draw ranked or breakdown
	if (season_ranking_disp == 0)
	draw_season_ranking_simple();
	else
	draw_season_ranking_breakdown();

	// back to preferences
	if not_in_menu && (android_back || scr_mouse_position_room_released(950,15,60,60,mb_left,true))
		{
		android_back = false;
		season_ranking_disp = 0; // reset to simple season
		pref_phase = prefPhase.preferences;
		}
	}
