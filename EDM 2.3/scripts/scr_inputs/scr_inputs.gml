function scr_inputs() {
	mouse_left = mouse_check_button(mb_left);
	clicked = false;

	if os_type == os_windows
	android_back = keyboard_check_released(vk_left);
	else
	android_back = keyboard_check_released(vk_backspace);

	if mouse_check_button_pressed(mb_left)
	   {
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   }

	mouse_xdist = mouse_x-mouse_xstart;
	mouse_ydist = mouse_y-mouse_ystart;

	game_time ++;

	if timer > -1
	timer --;

	if timer < -1
	timer = -1;

	if (close_enough_pause != 1) && close_enough_timer > -1
	close_enough_timer -= 1+(5*close_enough_skip);

	if close_enough_timer < -1
	close_enough_timer = -1;



}
