
if locked
   {
   draw_app_locked();	
   exit;
   }

draw_screens();
//draw_menu();

if mouse_check_button_released(mb_left)
    {
	scrollbar_disp_end = 0;
    scrolling = false;
    results_scrolling = false;
    deleting_member = false;
    }
    