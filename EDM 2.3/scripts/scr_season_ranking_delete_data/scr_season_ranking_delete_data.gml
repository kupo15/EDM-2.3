function scr_season_ranking_delete_data() {
	season_delete_safty = true;
	season_new_day = true;
	season_offset = 0;
	season_offset_start = 0;
	season_breakdown_offset = 0;
	season_breakdown_offset_start = 0;
	file_delete("season_ranking.ini");

	ds_grid_destroy(season_ranking_header_grid);
	ds_grid_destroy(season_ranking_grid);
	ds_grid_destroy(season_ranking_usage_grid);

	season_ranking_header_grid = ds_grid_create(2,3); // the date and info of the day recorded
	season_ranking_grid = ds_grid_create(2,1);
	season_ranking_usage_grid = ds_grid_create(2,1);

	show_debug_message("season data deleted");
	season_ranking_load();


}
