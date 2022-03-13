/*function scr_sort_season_breakdown() {
	
	var header_ww = ds_grid_width(season_ranking_header_grid);
	var header_hh = ds_grid_height(season_ranking_header_grid);

	var breakdown_ww = header_ww;
	var breakdown_hh = ds_grid_height(season_ranking_grid);

	// create temp grid copies
	var header_copy = ds_grid_create(header_ww,header_hh);
	var breakdown_copy = ds_grid_create(breakdown_ww,breakdown_hh);
	var usage_copy = ds_grid_create(breakdown_ww,breakdown_hh);

	// copy grids
	ds_grid_copy(header_copy,season_ranking_header_grid);
	ds_grid_copy(breakdown_copy,season_ranking_grid);
	ds_grid_copy(usage_copy,season_ranking_usage_grid);

	var sort_list_temp = ds_list_create();

	// add headers to temp list
	for(var i=2;i<header_ww;i++)
	sort_list_temp[| i-2] = season_ranking_header_grid[# i,2]; // add sortable format

	ds_list_sort(sort_list_temp,true); // sort list

	// sort grid
	var size = ds_list_size(sort_list_temp);
	for(var i=0;i<size;i++) // loop through list
		{
		var entry = sort_list_temp[| i]; // return entry

		for(var a=2;a<breakdown_ww;a++) // loop through grid copy
		if entry == header_copy[# a,2] // if dates match
			{
			ds_grid_set_grid_region(season_ranking_header_grid,header_copy,a,0,a,header_hh-1,i+2,0); // copy header info
			ds_grid_set_grid_region(season_ranking_grid,breakdown_copy,a,0,a,breakdown_hh-1,i+2,0); // copy season info
			ds_grid_set_grid_region(season_ranking_usage_grid,usage_copy,a,0,a,breakdown_hh-1,i+2,0); // copy usage info
		
			ds_grid_set_region(header_copy,a,0,a,header_hh-1,0); // clear used copy header column
			ds_grid_set_region(breakdown_copy,a,0,a,breakdown_hh-1,0); // clear used copy breakdown column
			ds_grid_set_region(usage_copy,a,0,a,breakdown_hh-1,0); // clear used copy usage column
			break;
			}
		}
		
	// destroy temp DS
	ds_grid_destroy(header_copy);
	ds_grid_destroy(breakdown_copy);
	ds_grid_destroy(usage_copy);

	ds_list_destroy(sort_list_temp);

	




}
