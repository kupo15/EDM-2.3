function check_active_popovers() {
	
	with popover_parent
	if active
	return true;
	
	return false;
	}

function scr_inputs() {
	
	mouse_left = mouse_check_button(mb_left);
	global.clicked = false;

	switch os_type 
		{
		case os_windows: android_back = keyboard_check_released(vk_left); break;
		case os_android: android_back = keyboard_check_released(vk_backspace); break;
		}

	if mouse_check_button_pressed(mb_left) {
		
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   
	   global.mouse_xdist = 0;
	   global.mouse_ydist = 0;
	   }

	if mouse_check_button_pressed(mb_middle) {
		
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   }

	global.mouse_xdist = mouse_x-mouse_xstart;
	global.mouse_ydist = mouse_y-mouse_ystart;

	scr_timer_countdown(mainTimers.enumcount);
	}
