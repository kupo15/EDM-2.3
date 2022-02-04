
function json_load_array(_filename) {

	if !file_exists(_filename) {
		
		db("RS: file doesn't exists");
		return undefined;
		}

	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);

	return json_parse(_string);
	}


function json_save_array(_filename,arrayId) {

	// save all
	var _string = json_stringify(arrayId);
	SaveStringToFile(_filename,_string);

	db(string(_filename)+" saved");
	}
	
function SaveStringToFile(_filename,_string) {

	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
	}