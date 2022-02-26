
function scr_button_hover(x_left,y_top,ww,hh,highlight=true) {
	
	var in_region = point_in_rectangle(mouse_x,mouse_y,x_left,y_top,x_left+ww,y_top+hh);
	
	if in_region && highlight && (os_type == os_windows) {
		
	    draw_set_alpha(0.3);
	    draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	    draw_set_alpha(1);
		}
	
	return in_region;
	}

function scr_click_button(xx,yy,ww,hh,button,highlight) {

	if scr_button_hover(xx,yy,ww,hh,highlight) && mouse_check_button_released(button) {
		
		var num = irandom(2);			
		
		audio_play_sound(asset_get_index("snd_tap"+string(num)),0,false);
		global.clicked = true;
		
		return true;
		}
		
	return false;
	}
	
function scr_click_button_pressed(xx,yy,ww,hh,button,highlight) {

	if scr_button_hover(xx,yy,ww,hh,highlight) && mouse_check_button_pressed(button) {
		
		var num = irandom(2);			
		
		audio_play_sound(asset_get_index("snd_tap"+string(num)),0,false);
		global.clicked = true;
		
		return true;
		}
		
	return false;
	}
