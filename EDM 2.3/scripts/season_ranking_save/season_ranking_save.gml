function season_ranking_save() {
exit;	
	var hh = ds_grid_height(scores_grid); // height of entrants
	var ranking_ww = ds_grid_width(season_ranking_grid); // width of ranking
	var ranking_hh = ds_grid_height(season_ranking_grid); // height of ranking

	var _day = "0";
	if current_day < 10
	_day += string(current_day);
	else
	_day = current_day;

	if !settings_date_duplicate // if not duplicating date
		{
		var str = string(current_month)+"/"+string(_day); // get current date	
	
		if season_ranking_header_grid[# ranking_ww-1,0] == str // if the same date as last column
		season_new_day = false;
		}

	var col_adj = !season_new_day;

	if season_new_day // if adding a new event date to the breakdown
	    {
		// resize grid
	    ds_grid_resize(season_ranking_grid,ranking_ww+1,ranking_hh); // add column to season
	    ds_grid_resize(season_ranking_usage_grid,ranking_ww+1,ranking_hh); // add column to usage
    
		// add header
	    var header_hh = ds_grid_height(season_ranking_header_grid);
	    ds_grid_resize(season_ranking_header_grid,ranking_ww+1,header_hh); // add column
	
	    season_new_day = false;
	    }
	else // if overwriting date
		{
		ds_grid_set_region(season_ranking_grid,ranking_ww-1,0,ranking_ww-1,ranking_hh-1,0); // clear the breakdown column
		ds_grid_set_region(season_ranking_usage_grid,ranking_ww-1,0,ranking_ww-1,ranking_hh-1,false); // clear the usage column
		}

	for(var i=0;i<hh;i++) // loop through players
	    {
	    var new_entry = true;
	    for(var ii=0;ii<ranking_hh;ii++) // loop through season ranking
	    if scores_grid[# 0,i] == season_ranking_grid[# 0,ii] // if names match, overwrite existing peso amount
	        {
	        season_ranking_grid[# ranking_ww-col_adj,ii] = scores_grid[# 23,i]; // add pesos
	        season_ranking_usage_grid[# ranking_ww-col_adj,ii] = true; // add usage
	        new_entry = false;
	        break;
	        }
        
		// if the names have never been on the breakdown
	    if new_entry
	        {
	        if season_ranking_grid[# 0,0] == undefined
	        ranking_hh --;
        
			// add column
	        ds_grid_resize(season_ranking_grid,ds_grid_width(season_ranking_grid),ranking_hh+1); // add to end of grid
	        ds_grid_resize(season_ranking_usage_grid,ds_grid_width(season_ranking_grid),ranking_hh+1); // add to end of usage grid
		
			// add values
	        season_ranking_grid[# 0,ranking_hh] = scores_grid[# 0,i]; // add name to breakdown
	        season_ranking_usage_grid[# 0,ranking_hh] = scores_grid[# 0,i]; // add name to usage for sorting
		
	        season_ranking_grid[# ranking_ww-col_adj,ranking_hh] = scores_grid[# 23,i]; // add pesos
	        season_ranking_usage_grid[# ranking_ww-col_adj,ranking_hh] = true; // add usage data
		
			//show_message(string(i)+": "+string(scores_grid[# 23,i]));
	        ranking_hh ++; // add an extra row
	        }
	    }
    
	// add header info
	var str = string(current_month)+"/"+string(_day); // +"/"+string(current_year); //+"#"+string(current_hour)+":"+string(current_minute);
	season_ranking_header_grid[# ranking_ww-col_adj,0] = str; // add tourney day

	var str = string(current_hour)+":"+string(current_minute);
	season_ranking_header_grid[# ranking_ww-col_adj,1] = str; // add tourney time

	var str_sort = string(current_month)+string(_day);
	season_ranking_header_grid[# ranking_ww-col_adj,2] = real(str_sort); // add tourney date sortable formate

	// sort grid
	ds_grid_sort(season_ranking_grid,1,false); // sort descending    
	ds_grid_sort(season_ranking_usage_grid,1,false); // sort usage descending    
    
	scr_season_breakdown_player_delete();
	ini_season_ranking_save();
	}
