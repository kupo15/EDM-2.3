function scr_mouse_position_room(x_left,y_top,ww,hh,button,highlight) {

	var mx = mouse_x;
	var my = mouse_y;

	if mouse_check_button_pressed(mb_left) {
		
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   }

	if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh) {
		
		// highlight area
	    if highlight {
			
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if mouse_check_button_pressed(button) || mouse_check_button(button) || (button == noone) {
	        
			//if button != noone
	        //scr_play_sound(snd_tap0);
			
	        return true;
	        }
	    }
		
	return false;
	}
