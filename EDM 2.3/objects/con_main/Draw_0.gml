draw_menu();

if mouse_check_button_released(mb_left) {
	
	scrollbar_disp_end = 0;
    scrolling = false;
    results_scrolling = false;
    deleting_member = false;
    }
	
// debug
if keyboard_check_pressed(vk_tab)
debug = !debug;
	
if debug
draw_circle(15,580,5,false);