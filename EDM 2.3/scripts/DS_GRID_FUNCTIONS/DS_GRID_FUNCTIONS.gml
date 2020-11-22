
function grid_row_add(grid_id) {

var grid_ww = ds_grid_width(grid_id);
var grid_hh = ds_grid_height(grid_id);

ds_grid_resize(grid_id,grid_ww,grid_hh+1);

return grid_hh; // return last functional row
}

function grid_row_delete(grid,row) {
/// @param grid_id;
/// @param [row];

var int = argument[1];

var grid_ww = ds_grid_width(grid);
var grid_hh = ds_grid_height(grid);

if row == undefined // delete last row
ds_grid_resize(grid,grid_ww,grid_hh-1);
else // delete specific row
	{
	ds_grid_resize(grid,grid_ww+1,grid_hh); // add temp column to end
	
	for(var i=0;i<grid_hh;i++) // loop through grid
	grid[# grid_ww,i] = i; // order last cell
	
	grid[# grid_ww,row] = grid_hh+1; // set deleted row cell to high number
	ds_grid_sort(grid,grid_ww,true); // sort
	
	ds_grid_resize(grid,grid_ww,grid_hh-1); // delete last row and temp column
	}
	
}
