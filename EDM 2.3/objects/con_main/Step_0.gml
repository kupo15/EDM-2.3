
scrollbar_apply_friction();
scr_inputs();
scr_main_timer_beep();
retrieve_keypad(); // handle key entries
	
global.popoverActive = 	check_active_popovers();
	
scrollbar_disp = lerp(scrollbar_disp,scrollbar_disp_end,0.1);
scrollbar_disp = clamp(scrollbar_disp,0,1);

if keyboard_check_pressed(vk_escape)
game_end();


