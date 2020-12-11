
function scr_member_sort_abc(source_array,ascending) {

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0);


// add data to grid
var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var memberId = pointer.memberID;
	var sort_value = database_member_get_pointer(memberId,"firstName");

	// debug
	if sort_value == undefined
		{
		if os_type == os_windows
		sma(string(i)+"- member key undefined >> deleting entry");
		
		array_delete(source_array,i,1);
		
		i--;
		size --;
		continue;
		}

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
scr_sorting_finish(source_array,size,sorting_grid,ascending);	
}
	
function scr_member_sort_favorite(source_array,ascending) {

membersort; // put in abc order first

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0);

// add data to grid
var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var sort_value = variable_struct_get(pointer,"favorite");
	var sort_ind = i-(size*sort_value);

	// debug
	if sort_value == undefined
		{
		if os_type == os_windows
		sma(string(i)+"- member key undefined >> deleting entry");
		
		array_delete(source_array,i,1);
		
		i--;
		size --;
		continue;
		}

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_ind; // add value to sort to grid
	}
	
scr_sorting_finish(source_array,size,sorting_grid,ascending);		
}

function scr_sorting_finish(source_array,size,sorting_grid,ascending) {
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source array
for(var i=0;i<size;i++)
source_array[@ i] = sorting_grid[# 0,i];

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);	
	
}


#region
/*
function scr_score_sort(source_array,ascending) {

// create temp sorting grid
var sorting_grid = ds_grid_create(2,0);

// add data to grid
var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var sort_value = variable_struct_get(pointer.roundData,"roundDate");

	// debug
	if sort_value == undefined
		{
		sm("score key undefined >> not sorted");
		exit;
		}

	grid_row_add(sorting_grid); // add a row to the temp sorting grid
	sorting_grid[# 0,i] = pointer; // add list pointer to grid
	sorting_grid[# 1,i] = sort_value; // add value to sort to grid
	}
	
// sort grid
ds_grid_sort(sorting_grid,1,ascending); 

// re add pointers back to the source array
for(var i=0;i<size;i++)
source_array[@ i] = sorting_grid[# 0,i];

// destroy temp sorting grid
ds_grid_destroy(sorting_grid);	
}
*/
#endregion