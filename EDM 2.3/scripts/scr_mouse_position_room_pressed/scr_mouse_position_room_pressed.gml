
function scr_mouse_position_room_pressed(x_left,y_top,ww,hh,button,highlight,sound) {

	var mx = mouse_x;
	var my = mouse_y;

	if point_in_rectangle(mx,my,x_left,y_top,x_left+ww,y_top+hh)
	    {
		// highlight area
	    if highlight {
			
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if mouse_check_button_pressed(button) || (button == noone)
	        {
	        if button != noone && sound {
				
				var num = irandom(2);
				audio_play_sound(asset_get_index("snd_tap"+string(num)),0,false);
				}
        
	        return true;
	        }
	    }
	
	return false;
	}


function scr_mouse_position_room_released(x_left,y_top,ww,hh,button,highlight) {

	if global.clicked
	exit;

	var mx = mouse_x;
	var my = mouse_y;

	if point_in_rectangle(mx,my,x_left,y_top,x_left+ww,y_top+hh) {
		
		// highlight area
	    if highlight && ((os_type == os_windows) || mouse_check_button(mb_left)) {
			
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if (mouse_check_button_released(button) && (abs(global.mouse_ydist) < 15) && (abs(global.mouse_xdist) < 30) && !con_main.scrolling && !con_main.results_scrolling && !con_main.edit_score_scrolling) || (button == noone) {
			
	        if (button != noone) {
				
				var num = irandom(2);			
		        audio_play_sound(asset_get_index("snd_tap"+string(num)),0,false);
		        global.clicked = true;
				}
			
	        return true;
	        }
	    }
	
	return false;
	}
