
function LoadJSONFromFile(_filename) {
/// @param filename

var _buffer = buffer_load(_filename);
var _string = buffer_read(_buffer,buffer_string);
buffer_delete(_buffer);

var _json = json_parse(_string);
return _json;

}

function SaveStringToFile(_filename,_string) {
/// @param filename
/// @param string

var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
buffer_write(_buffer,buffer_string,_string);
buffer_save(_buffer,_filename);
buffer_delete(_buffer);

db(_string);
}


function json_load_array(_filename) {
/// @param filename

if file_exists(_filename)
	{
	ROOT_data_struct = LoadJSONFromFile(_filename); 

	var saveVersion = variable_struct_get(ROOT_data_struct,"version");

	if saveVersion != json_version
		{
		scr_json_version_transition(saveVersion);
		ROOT_data_struct.version = json_version;
		
		app_save;
		}
	else // load 
		{
		// create data arrays
		courselist_array = ROOT_data_struct.courselist;
		scorelist_array = ROOT_data_struct.scorelist;

		db(string(_filename)+" loaded");
		}
	}
else
	{
	json_conversion_missing();
	db(string(_filename)+" not found > creating data structures");
	}
}

function json_save_array(_filename,arrayId) {
/// @param filename

// save all
var _string = json_stringify(arrayId);
SaveStringToFile(_filename,_string);

db(string(_filename)+" saved");
}

function json_save(_filename) {
/// @param filename

var _wrapper = ds_map_create();

var root_map = ds_map_create();
ds_map_add_map(_wrapper,"ROOT",root_map); // add root map to wrapper

// save all
var _string = json_encode(arrayId);
SaveStringToFile(_filename,_string);

// destroy map
root_map[? "course list"] = undefined;
root_map[? "score list"] = undefined;
ds_map_destroy(_wrapper);

show_debug_message(string(_filename)+" saved");

}

function json_load(_filename) {
/// @param filename

if file_exists(_filename)
	{
	var _wrapper = LoadJSONFromFile(_filename);
	var root_map = _wrapper[? "ROOT"];
		
	// clean up
	ds_map_destroy(_wrapper);
	show_debug_message(string(_filename)+" loaded");
	}
}
