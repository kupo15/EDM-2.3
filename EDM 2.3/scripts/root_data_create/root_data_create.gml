function root_data_create() {
	
courselist_array = array_create(0);
scorelist_array = array_create(0);
			
ROOT_data_struct = {
	
	version: json_version,
	courselist: courselist_array,	
	scorelist: scorelist_array,
	}
	
scr_playing_clear();
}