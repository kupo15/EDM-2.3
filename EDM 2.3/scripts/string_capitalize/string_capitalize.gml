/// @description capitalizes the first character in a string
/// @param string
function string_capitalize(argument0) {

	var str_ = argument0;
	var str_1 = string_char_at(str_,1); // get the first character
	str_1 = string_upper(str_1); // upper case character

	str_ = string_delete(str_,1,1); // delete first character
	str_ = string_insert(str_1,str_,1); // insert capital character

	return str_;


}
