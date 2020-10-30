function season_ranking_load() {
	// set default variables
	season_ranking_grid[# 0,0] = undefined;
	season_ranking_grid[# 1,0] = 0; // history

	ds_grid_clear(season_ranking_usage_grid,0); // make all 0

	season_ranking_header_grid[# 0,0] = undefined; // not needed
	season_ranking_header_grid[# 1,0] = "Adj."; // 

	if file_exists("season_ranking.ini")
		{
		ini_open("season_ranking.ini");
		var load = ini_read_string("season","0","");
		var load_header = ini_read_string("header","0","");
		var load_usage = ini_read_string("usage","0","");

		ds_grid_read(season_ranking_grid,load); // load the data
		ds_grid_read(season_ranking_header_grid,load_header); // load the header data
		ds_grid_read(season_ranking_usage_grid,load_usage); // load the usage data
		ini_close();
		}
	
	scr_season_breakdown_player_delete(); // cull unused players
	scr_sort_season_ranking(); // sort for leaderboard

	// fail safe
	if ds_grid_height(season_ranking_grid) == 0
	scr_season_ranking_delete_data();


}
