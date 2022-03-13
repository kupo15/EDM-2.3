/*function scr_season_breakdown_player_delete() {
	if season_ranking_grid[# 0,0] == undefined // if there is no data
	exit;

	var grid_ww = ds_grid_width(season_ranking_grid); // get width of breakdown
	var grid_hh = ds_grid_height(season_ranking_grid); // get height of breakdown
	var del_rows = 0;

	for(var i=0;i<grid_hh;i++) // loop through breakdown grid height
	if ds_grid_get_sum(season_ranking_usage_grid,1,i,grid_ww-1,i) == 0 // if not used at all
		{
		var name = season_ranking_grid[# 0,i]; // get name
		season_ranking_grid[# 0,i] = "zzzzzzzzzzz"; // set breakdown name to the end
		season_ranking_usage_grid[# 0,i] = "zzzzzzzzzzz"; // set usage name to the end

		del_rows ++; // add to row count
		}
	
	// sort grids by ABC
	ds_grid_sort(season_ranking_grid,0,true); // breakdown
	ds_grid_sort(season_ranking_usage_grid,0,true); // usage
	
	// delete unused rows
	ds_grid_resize(season_ranking_grid,grid_ww,grid_hh-del_rows); // breakdown
	ds_grid_resize(season_ranking_usage_grid,grid_ww,grid_hh-del_rows); // usage

	if del_rows == grid_hh // if deleting every row
	scr_season_ranking_delete_data(); // start fresh

	ini_season_ranking_save();


}
