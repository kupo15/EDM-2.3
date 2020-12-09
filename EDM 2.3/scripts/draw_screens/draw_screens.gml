function draw_screens() {
	
// android back
if androidBack
	{
	if mode_delete
		{
		mode_delete = false;
		androidBack = false;
		}
	else if submenu == navbar.main
		{
		if (screenIndex == screen.home) && (os_type == os_android)
		game_end();

		screen_change(screen.home,undefined,true);
		}
	}
	

	
// draw the 3 dots
var region = header_height;
var ww = header_height*0.33;
var hh = header_height*0.27;
var xx = (region-ww)*0.5;
var yy = header_height*0.5;
var thick = y_pct_y(4);
		
//		var xx = pct_x(3);
//		var yy = header_height*0.5;
//		var ww = header_height*0.33*1.33;
//		var hh = header_height*0.33;
//		
//		var xx = 0;
//var size = header_height*0.3;
//var xoff = (hh-size)*0.5;

//if !keyboard_check(vk_numpad7)
//draw_menu_xout(xx+xoff,yy+xoff,size,size,x_pct_x(5),c_white); // draw xout

//exit;
		
		//draw_plus_button(pct_x(5),pct_y(6.5),region,false,c_white); // plus button

		//draw_menu_arrow(xx,yy,ww,hh,4,1,c_white);
	//	
	//exit	
						//draw_menu_arrow(xx,yy,ww,hh,4,1,c_white);

//exit
//draw_menu_bars(xx,yy,ww,hh,thick,c_black);
						//draw_icon_height_centered_color(ico_trash3,0,xx,0,region,region,header_height*0.44,c_white,1); // trash icon

//exit;
	
// draw screens
draw_background_screen();

if screenIndex == screen.appStartup
draw_appStartup();
else
script_execute(drawScreen[screenIndex]);
		
// draw numpad
//numpad_value = draw_numpad_golf(numpad_value);
	
//draw_footer_button();

//draw_darken_screen();
//draw_navbar();
//draw_sidebar_main_menu();
//
//// popup overlays
//draw_overlay_calendar();
////draw_overlay_circle_button();
//	
//draw_highlight_click_static(submenu != navbar.sidebar);


// update the virtual keyboard
if kvActive // || timer[timerIndex.vk_switch] > -1
	{
	kvLastString = keyboard_string;
	kvInputString = keyboard_string; // get string input
	}

if androidBack
vk_hide();

}
