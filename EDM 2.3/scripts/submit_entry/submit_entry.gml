function submit_entry() {

	
	}
	
function negate_entry() {
	
	var convert = real(entryString);
	entryString = string(convert*-1);
	}
	
function append_character(str) {
	
	var str_ll = string_length(entryString);
	
	if (str_ll >= maxCharacters)
	exit;

	entryString += str;
	}
	
function delete_character() {
	
	var str_ll = string_length(entryString);

	if (str_ll > 0)
	entryString = string_delete(entryString,str_ll,1);
	}