/// @description  scores_grid_delete_member(position);
/// @param position
function scores_grid_delete_member(argument0) {

	var pos = argument0;
	var grid_ww = ds_grid_width(scores_grid);
	var grid_hh = ds_grid_height(scores_grid);

	scores_grid[# 18,pos] = 100; // set current position to end
	ds_grid_add_region(scores_grid,18,pos,18,grid_hh-1,-1); // shift pos down
	ds_grid_sort(scores_grid,18,true); // reorder

	ds_grid_resize(scores_grid,grid_ww,grid_hh-1); // delete last row





}
