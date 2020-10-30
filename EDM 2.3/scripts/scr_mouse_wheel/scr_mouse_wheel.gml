/// @description  scr_mouse_wheel(multiplier);
/// @param multiplier
function scr_mouse_wheel(argument0) {

	var scale = argument0;

	return (mouse_wheel_up()-mouse_wheel_down())*scale;



}
