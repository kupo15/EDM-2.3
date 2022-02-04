function scr_sort_members(arr) {
	
	var tempArr = deep_copy(arr);
	var tempRecent = [];
	var tempFavorite = [];
	
	arr = [];
	
	// loop through tempArr and sort into lists
	for(var i=array_length(tempArr)-1;i>-1;i--)
		{
		var entry = tempArr[i];
			
		if entry.favorite
		array_push(tempFavorite,entry);		
		else if entry.recent
		array_push(tempRecent,entry);
		else
		array_push(arr,entry);
		}
			
	array_sort_struct(arr,"name",true);
	array_sort_struct(tempFavorite,"name",false);
	array_sort_struct(tempRecent,"name",false);
	
	// add recent
	for(var i=0;i<array_length(tempRecent);i++)
		{
		var entry = tempRecent[i];		
		array_insert(arr,0,entry);
		}
	
	// add favorite
	for(var i=0;i<array_length(tempFavorite);i++)
		{
		var entry = tempFavorite[i];		
		array_insert(arr,0,entry);
		}
	
	return arr;
	}
