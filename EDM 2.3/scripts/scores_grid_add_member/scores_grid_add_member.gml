/*function scores_grid_add_member(argument0, argument1, argument2) {

	var name = argument0;
	var _team = argument1;
	var pos = argument2;
	var size = ds_list_size(team_list[_team]);
	pos += size-1;

	var grid_ww = ds_grid_width(scores_grid);
	var grid_hh = ds_grid_height(scores_grid);

	if pos != grid_hh // don't shift when adding at end
	ds_grid_add_region(scores_grid,18,pos,18,grid_hh-1,1); // shift pos
	ds_grid_resize(scores_grid,grid_ww,grid_hh+1); // add a row

	scores_grid[# 0,grid_hh] = name; // copy names from entrant list
	scores_grid[# 1,grid_hh] = irandom_range(33,50); // front nine
	scores_grid[# 2,grid_hh] = irandom_range(33,50); // back nine
	scores_grid[# 3,grid_hh] = irandom_range(33,50); // total score

	if !debug
	    {
	    scores_grid[# 1,grid_hh] = undefined; // front nine
	    scores_grid[# 2,grid_hh] = undefined; // back nine
	    }

	scores_grid[# 4,grid_hh] = _team; // team number
	scores_grid[# 5,grid_hh] = noone; // blind
	scores_grid[# 6,grid_hh] = 1; // rank
	// 7 front payout
	// 8 back payout
	// 9 total payout
	// 10 total win
	// 11 entry fee
	// 12 net win
	// 13 net skins
	// 14 skins payout
	// 15 gross skins
	// 16 team winnings
	// 17 low net winnings
	scores_grid[# 18,grid_hh] = pos; // index
	// 19 no teams

	ds_grid_sort(scores_grid,18,true);



}
