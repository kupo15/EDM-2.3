function draw_results() {
	if phase > 1
	   {
	   if dev_mode && keyboard_check_pressed(vk_space)
	       {
	       season_new_day = true;
	       season_ranking_save();
	       }

	   scr_results_screen();
   
	   if floor(results_screen) = 0
	   draw_results_final();
   
	   if restart
	   exit;
   
	   if results_screen > 0 && results_screen < 2
	   draw_results_teams();
   
	   if ceil(results_screen) = 2
	   draw_results_low_net();
	   }



}
