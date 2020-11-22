
function string_convert_real(str,limit) {
/// @description converts strings to real number

	var str_cull = string_digits(str); // string with non digits culled
	var str_ll = string_length(str_cull); // length of string

	if str_cull != str // if culled
	keyboard_string = str_cull;

	if str_ll > limit // if more than the limit
		{
		str = string_delete(str_cull,limit+1,1); // remove extra digits
		keyboard_string = str;
		}
	else str = str_cull;

	if cursorPos < textboxStringLength // if cursor is in the middle
		 {
		 if kv_input_backspace // if deleting a character
			{
			str = string_delete(kvLastString,cursorPos,1); // delete character from previous string
			keyboard_string = str; // update keyboard string
			}
		 else if (kvLastString != keyboard_string) // if adding a character
			{
			var last_char = string_char_at(str,str_ll); // get last character
			str = string_delete(str,str_ll,1); // delete last letter

			str = string_insert(last_char,str,cursorPos+1); // insert at cursor pos
			keyboard_string = str;
			}
		 }

	if os_type == os_android
	if string_length(kvLastString) == 1 && kv_input_backspace
		{
		keyboard_string = "";
		str = "";
		}

	return str;


}

function string_convert_real_numpad(str,limit) {
/// @description converts strings to real number

var str_cull = string_digits(str); // string with non digits culled
var str_ll = string_length(str_cull); // length of string

if str_cull != str // if culled
numpad_value = str_cull;

if str_ll > limit // if more than the limit
	{
	str = string_delete(str_cull,limit+1,1); // remove extra digits
	numpad_value = str;
	}
else str = str_cull;

if cursorPos < textboxStringLength // if cursor is in the middle
		{
		if kv_input_backspace // if deleting a character
		{
		str = string_delete(kvLastString,cursorPos,1); // delete character from previous string
		numpad_value = str; // update keyboard string
		}
		else if (kvLastString != numpad_value) // if adding a character
		{
		var last_char = string_char_at(str,str_ll); // get last character
		str = string_delete(str,str_ll,1); // delete last letter

		str = string_insert(last_char,str,cursorPos+1); // insert at cursor pos
		numpad_value = str;
		}
		}

if os_type == os_android
if string_length(kvLastString) == 1 && kv_input_backspace
	{
	numpad_value = "";
	str = "";
	}

return str;


}

function string_capitalize(str,str_limit) {
/// capitalizes the first character in a string

var str_ll = string_length(str);
if str_limit != -1 && str_ll > 0 && (str_ll > str_limit) // if more than the limit
	{
	str = string_delete(str,str_limit+1,1); // remove extra digits
	keyboard_string = str;
	}
else if cursorPos < textboxStringLength // if cursor is in the middle
		{
		if kv_input_backspace // if deleting a character
		{
		str = string_delete(kvLastString,cursorPos,1); // delete character from previous string
		keyboard_string = str; // update keyboard string
		}
		else if (kvLastString != keyboard_string) // if adding a character
		{
		var last_char = string_char_at(str,str_ll); // get last character
		str = string_delete(str,str_ll,1); // delete last letter

		str = string_insert(last_char,str,cursorPos+1); // insert at cursor pos
		keyboard_string = str;
		}
		}

// Override Auto capital
if os_type == os_android
if string_length(kvLastString) == 1 && kv_input_backspace
	{
	keyboard_string = "";
	str = "";
	}

return capitalize(str);


}

function string_convert_rating(str,limit) {
/// converts strings to currency format

var decimal_places = 0; // one tenth place

var str_cull = string_digits(str); // string with non digits culled
var str_ll = string_length(str_cull); // length of string

// remove 0s in front
repeat (2)
	{
	if string_char_at(str_cull,1) == "0"
	str_cull = string_delete(str_cull,1,1);
	}

if str_cull != str // if culled
keyboard_string = str_cull;

if str_ll > limit // if more than the limit
	{
	str = string_delete(str_cull,limit+1,1); // remove extra digits
	keyboard_string = str;
	}
else str = str_cull;

str = string(str); // convert back to a string

// add a decimal point
if str != ""
	{
	str_ll = string_length(str); // get the length of the string
	
	var str_ins = ".";
	
	// decimal insert
	if str_ll == 2
	str += ".";
	else if str_ll > 2
	str = string_insert(str_ins,str,str_ll-decimal_places); // insert a decimal only
	}
	
if string_length(kvLastString) == 1 && kv_input_backspace
	{
	keyboard_string = "";
	str = "";
	}

return str;
}
	
function string_convert_rating_numpad(str,limit) {

var decimal_places = 0; // one tenth place

var str_cull = string_digits(str); // string with non digits culled
var str_ll = string_length(str_cull); // length of string

// remove 0s in front
repeat (2)
	{
	if string_char_at(str_cull,1) == "0"
	str_cull = string_delete(str_cull,1,1);
	}

if str_cull != str // if culled
numpad_value = str_cull;

if str_ll > limit // if more than the limit
	{
	str = string_delete(str_cull,limit+1,1); // remove extra digits
	numpad_value = str;
	}
else str = str_cull;

str = string(str); // convert back to a string

// add a decimal point
if str != ""
	{
	str_ll = string_length(str); // get the length of the string
	
	var str_ins = ".";
	
	// decimal insert
	if str_ll == 2
	str += ".";
	else if str_ll > 2
	str = string_insert(str_ins,str,str_ll-decimal_places); // insert a decimal only
	}
	
if string_length(kvLastString) == 1 && kv_input_backspace
	{
	numpad_value = "";
	str = "";
	}

return str;
}

function string_convert_upper(str) {

var upper = true;
var str_ll = string_length(str);
for(var i=1;i<str_ll+1;i++)
	{
	var char = string_char_at(str,i); // character to replace

	if upper
		{
		upper = false;
		var char = string_upper(char); // uppercase character
		str = string_delete(str,i,1); // delete character
		str = string_insert(char,str,i); // insert the capital version
		}
	else if char == " "
	upper = true;
	}
	
return str;
}
	
function scr_input_text(limit) {

var str = keyboard_string;

if limit != -1 && string_length(str) > limit
	{
	str = string_delete(str,limit+1,1);
	keyboard_string = str;
	}
    
return str;
}

function string_convert_currency(str_,limit) {
/// converts strings to currency format
/// @param string
/// @param number_limit

var decimal_places = 1; // two cents places

var str_cull = string_digits(str_); // string with non digits culled
var str_ll = string_length(str_cull); // length of string

// remove 0s in front
repeat (2)
	{
	if string_char_at(str_cull,1) == "0"
	str_cull = string_delete(str_cull,1,1);
	}

if str_cull != str_ // if culled
keyboard_string = str_cull;

if str_ll > limit // if more than the limit
	{
	str_ = string_delete(str_cull,limit+1,1); // remove extra digits
	keyboard_string = str_;
	}
else str_ = str_cull;

str_ = string(str_); // convert back to a string

if str_ != ""
	{
	str_ll = string_length(str_); // get the length of the string
	
	var str_ins = ".";
	
	// decimal insert
	if str_ll == 1
	str_ins = "0.0";
	else if str_ll == 2
	str_ins = "0.";
	
	str_ = string_insert(str_ins,str_,str_ll-decimal_places); // insert a decimal only
	
	if str_ll > 5
	str_ = string_insert(",",str_,str_ll-4); // insert a decimal and comma
	
	str_ = string(str_); // add currency symbol
	}
	
if (string_length(kvLastString) == 1) && kv_input_backspace
	{
	keyboard_string = "";
	str_ = "";
	}

return str_;


}

function string_convert_currency_numpad(str_,limit) {
/// converts strings to currency format
/// @param string
/// @param number_limit

var decimal_places = 1; // two cents places

var str_cull = string_digits(str_); // string with non digits culled
var str_ll = string_length(str_cull); // length of string

// remove 0s in front
repeat (2)
	{
	if string_char_at(str_cull,1) == "0"
	str_cull = string_delete(str_cull,1,1);
	}

if str_cull != str_ // if culled
numpad_value = str_cull;

if str_ll > limit // if more than the limit
	{
	str_ = string_delete(str_cull,limit+1,1); // remove extra digits
	numpad_value = str_;
	}
else str_ = str_cull;

str_ = string(str_); // convert back to a string

if str_ != ""
	{
	str_ll = string_length(str_); // get the length of the string
	
	var str_ins = ".";
	
	// decimal insert
	if str_ll == 1
	str_ins = "0.0";
	else if str_ll == 2
	str_ins = "0.";
	
	str_ = string_insert(str_ins,str_,str_ll-decimal_places); // insert a decimal only
	
	if str_ll > 5
	str_ = string_insert(",",str_,str_ll-4); // insert a decimal and comma
	
	str_ = string(str_); // add currency symbol
	}
	
if (string_length(kvLastString) == 1) && kv_input_backspace
	{
	keyboard_string = "";
	str_ = "";
	}

return str_;


}
	
function plural(str,value,ending_str) {
/// @param string	
/// @param compare_variable
/// @param [ending_string]

if value != 1
str += "s";

if ending_str != undefined
str += ending_str;

return str;	
}
	
function capitalize(str) {
	
var first_letter = string_char_at(str,1);
var letter_cap = string_upper(first_letter);
var str_missing = string_delete(str,1,1);
var final_str = string_insert(letter_cap,str_missing,1);

return final_str;	
}
	
function string_width_height(str,height) {

var currSize = string_height(str); // current height of string
var scale = height/currSize;

var ll = string_width(str);

return ll*scale;
}