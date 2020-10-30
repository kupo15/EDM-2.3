function scr_sort_season_ranking() {
	// sort season by best score

	var grid_ww = ds_grid_width(season_ranking_grid);
	var grid_hh = ds_grid_height(season_ranking_grid);

	ds_grid_resize(season_ranking_grid,grid_ww+1,grid_hh); // add one to the end to the breakdown row
	ds_grid_resize(season_ranking_usage_grid,grid_ww+1,grid_hh); // add one to the end to the usage row

	for(var i=0;i<grid_hh;i++) // loop through grid
		{
		season_ranking_grid[# grid_ww,i] = ds_grid_get_sum(season_ranking_grid,1,i,grid_ww,i); // calculate total
		season_ranking_usage_grid[# grid_ww,i] = season_ranking_grid[# grid_ww,i]; // duplicate on usage grid
		}

	// sort grids
	ds_grid_sort(season_ranking_grid,grid_ww,false); // sort by value        
	ds_grid_sort(season_ranking_usage_grid,grid_ww,false); // sort usage by value        

	// delete extra row
	ds_grid_resize(season_ranking_grid,grid_ww,grid_hh); // remove end
	ds_grid_resize(season_ranking_usage_grid,grid_ww,grid_hh); // remove end



}
