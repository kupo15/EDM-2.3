

function scr_searchbar_array(source_array) {
	
// type in search bar
if kvActive
switch textboxIndex
	{
	case -1: searched_name = string_capitalize(keyboard_string,22); break;
	case 0: friend_name_entry = string_capitalize(keyboard_string,22); break;
	}	
	
if (searched_name == kvLastString)
exit;

// convert to using strings to set variables
course_list_offset = 0;
course_list_offset_start = 0;
searched = true;

// clear search results
searchedList = [];
ds_map_clear(searchedMap);

var size = array_length(source_array);
for(var i=0;i<size;i++)
	{
	var pointer = source_array[i];
	var name = pointer.courseName;
	var add_mem = true;
	var found = (string_count(string_lower(searched_name),string_lower(name)) != 0)

	if found && (searched_name != "") && (searched_name != " ") && add_mem
		{
		array_push(searchedList,pointer); // add the pointer to the searchedList
		ds_map_add(searchedMap,name,i); // add the pos of the friend in the source list
		}
	}
}

function scr_searchbar_list(source_list) {
	
// type in search bar
if kvActive
switch textboxIndex
	{
	case -1: searched_name = string_capitalize(keyboard_string,22); break;
	case 0: friend_name_entry = string_capitalize(keyboard_string,22); break;
	}	
	
if (searched_name == kvLastString)
exit;

master_friends_list_offset = 0;
master_friends_list_offset_start = 0;
searched = true;

// clear search results
ds_list_clear(searchedList);
ds_map_clear(searchedMap);

var size = ds_list_size(source_list);
for(var i=0;i<size;i++)
	{
	var pointer = source_list[| i];
	var name = pointer.dispName;
	var add_mem = true;
	var found = (string_count(string_lower(searched_name),string_lower(name)) != 0)

	if found && (searched_name != "") && (searched_name != " ") && add_mem
		{
		ds_list_add(searchedList,pointer); // add the pointer to the searchedList
		ds_map_add(searchedMap,name,i); // add the pos of the friend in the source list
		}
	}
}
