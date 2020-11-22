function async_virtual_keyboard() {
	
	
var status = async_load[? "keyboard_status"];

switch status
	{
	case "hidden": kvStatus = vk.hidden; break; 
	case "hiding": kvStatus = vk.hiding; break; 
	case "showing": kvStatus = vk.showing; break; 
	case "visible": kvStatus = vk.visible; break; 
	}
	
	
if (timer[timerIndex.vk_switch] == -1) && (kvStatus <= 1) // not switching
vk_hide();
	
// debug showing
show_debug_message("****"+string(kvStatus))
show_debug_message(async_load[? "screen_height"]);


}
