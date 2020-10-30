function ini_season_ranking_save() {
	ini_open("season_ranking.ini");
	var save = ds_grid_write(season_ranking_grid);
	var save_header = ds_grid_write(season_ranking_header_grid);
	var save_usage = ds_grid_write(season_ranking_usage_grid);

	ini_write_string("season","0",save);
	ini_write_string("header","0",save_header);
	ini_write_string("usage","0",save_usage);
	ini_close();

	season_save = true;
	show_debug_message("season saved");



}
