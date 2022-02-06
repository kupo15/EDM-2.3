scr_inputs();
scr_main_timer_beep();
retrieve_keypad(); // handle key entries
	
scrollbar_disp = lerp(scrollbar_disp,scrollbar_disp_end,0.1);
scrollbar_disp = clamp(scrollbar_disp,0,1);

if keyboard_check_pressed(vk_escape)
game_end();

if dev_mode {
	
	if keyboard_check_pressed(vk_backspace)
	scr_reset_bracket();
	
	if keyboard_check_pressed(vk_space)
	    {
	    file_delete("member_list.ini");
	    ini_member_list_load();
	    ini_member_list_save();
	    }
	}

//show_debug_message(fps);

