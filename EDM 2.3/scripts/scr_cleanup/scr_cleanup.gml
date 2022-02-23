function scr_cleanup() {
	
	exit;

	for(var i=0;i<teams_max;i++)
	    {
	    ds_list_destroy(team_list[i]);
	    ds_list_destroy(blind_list[i]);
	    }

	ds_grid_destroy(season_ranking_header_grid);
	ds_grid_destroy(season_ranking_grid);
	ds_grid_destroy(season_ranking_usage_grid);
	}
