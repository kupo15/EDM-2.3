
function scr_mouse_position_room_pressed(x_left,y_top,ww,hh,button=mb_left,highlight=true,sound=true,isKeypad=false) {

	if (!isKeypad && KEYPAD_ACTIVE)
	exit;

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

				var sfx = "snd_tap"+string(irandom(2));
				scr_play_sound(asset_get_index(sfx));
				}
        
	        return true;
	        }
	    }
	
	return false;
	}


function scr_mouse_position_room_released(x_left,y_top,ww,hh,button=mb_left,highlight=true,isKeypad=false,can_click=true,surf_xx=0,surf_yy=0) {

	if global.clicked || !global.canClick || (!isKeypad && KEYPAD_ACTIVE) || !can_click
	return false;

	var mx = mouse_x;
	var my = mouse_y;

	if point_in_rectangle(mx,my,x_left,y_top,x_left+ww,y_top+hh) {
		
		// highlight area
	    if highlight && (os_type == os_windows) {
			
			var xx = x_left-surf_xx;
			var yy = y_top-surf_yy;
			
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if (mouse_check_button_released(button) && !con_main.scrolling && !con_main.results_scrolling && !con_main.edit_score_scrolling) || (button == noone) {

	        if (button != noone) {
				
				var sfx = "snd_tap"+string(irandom(2));
				scr_play_sound(asset_get_index(sfx));
				
		        global.clicked = true;
				}
				
	        return true;
	        }
	    }
	
	return false;
	}
