function scr_sort_members() {
	var favorite_sort_list = ds_list_create();
	var member_sort_list = ds_list_create();

	ds_list_copy(favorite_sort_list,member_list);
	ds_list_copy(member_sort_list,member_list);

	// delete normal members
	var size = ds_list_size(favorite_sort_list);
	for(var i=last_entrant_number;i<size;i++)
	ds_list_delete(favorite_sort_list,last_entrant_number);

	// delete favorite memebers
	for(var i=0;i<last_entrant_number;i++)
	ds_list_delete(member_sort_list,0);

	ds_list_sort(favorite_sort_list,true);
	ds_list_sort(member_sort_list,true);

	ds_list_copy(member_list,favorite_sort_list);  
   
	// add in normal members
	var size = ds_list_size(member_sort_list);
	for(var i=0;i<size;i++)
	ds_list_add(member_list,member_sort_list[| i]);

	ds_list_destroy(favorite_sort_list);
	ds_list_destroy(member_sort_list); 



}
