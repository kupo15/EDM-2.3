
function grid_row_add(grid_id) {

	var grid_www = ds_grid_width(grid_id);
	var grid_hhh = ds_grid_height(grid_id);

	ds_grid_resize(grid_id,grid_www,grid_hhh+1);

	return grid_hhh; // return last functional row
	}

function grid_row_delete(grid,row=undefined) {

	var grid_www = ds_grid_width(grid);
	var grid_hhh = ds_grid_height(grid);

	if (row == undefined) // delete last row
	ds_grid_resize(grid,grid_www,grid_hhh-1);
	else // delete specific row
		{
		ds_grid_resize(grid,grid_www+1,grid_hhh); // add temp column to end
	
		for(var i=0;i<grid_hhh;i++) // loop through grid
		grid[# grid_www,i] = i; // order last cell
	
		grid[# grid_www,row] = grid_hhh+1; // set deleted row cell to high number
		ds_grid_sort(grid,grid_www,true); // sort
	
		ds_grid_resize(grid,grid_www,grid_hhh-1); // delete last row and temp column
		}	
	}
