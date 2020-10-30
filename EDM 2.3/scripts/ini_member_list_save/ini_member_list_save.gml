function ini_member_list_save() {
	ini_open("member_list.ini");
	// save member list
	var save = ds_list_write(member_list_save);
	ini_write_string("members","all",save);

	// save entrant list
	var save = ds_list_write(recent_list);
	ini_write_string("members","recent",save);

	// save favorites list
	var save = ds_list_write(favorites_list);
	ini_write_string("members","favorites",save);

	ini_close();



}
