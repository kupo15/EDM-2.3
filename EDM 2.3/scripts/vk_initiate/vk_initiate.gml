
function vk_initiate(kvtype,kvreturn) {
/// @param kvtype
/// @param [kvtypereturn_var]

// [optional argument]
if is_undefined(argument[1])
kvreturn = kbv_returnkey_next;

if kvtype == kbv_type_numbers
	{
	numpad_value = keyboard_string;//kvLastString;
	submenu = navbar.numpad;
	}
else
keyboard_virtual_show(kvtype,kvreturn,kbv_autocapitalize_words,false); // show keyboard

cursorSet = true;
kvActive = true;

if os_type == os_windows
kvHeight = 400*kvActive*(submenu != navbar.numpad);
else
kvHeight = keyboard_virtual_height();
}

