function draw_screens() {
	
// android back
if androidBack
	{
	if modeDelete
		{
		modeDelete = false;
		androidBack = false;
		}
	else if submenu == navbar.main
		{
		if (screenIndex == screen.home) && (os_type == os_android)
		game_end();

		screen_change(screen.home,undefined,true);
		}
	}

// draw screens
draw_background_screen();
		
// draw numpad
//numpad_value = draw_numpad_golf(numpad_value);
	
//draw_footer_button();

//draw_darken_screen();
//draw_navbar();
//
//// popup overlays
draw_overlay_sidebar();

//draw_overlay_calendar();
////draw_overlay_circle_button();
//	
draw_highlight_click_static(submenu != navbar.sidebar);


// update the virtual keyboard
if kvActive // || timer[timerIndex.vk_switch] > -1
	{
	kvLastString = keyboard_string;
	kvInputString = keyboard_string; // get string input
	}

if androidBack
vk_hide();
}
