/// @param x_left
/// @param y_top
/// @param box_ww
/// @param box_hh
/// @param ms_button
/// @param highlight
function scr_mouse_position_room(argument0, argument1, argument2, argument3, argument4, argument5) {

	var mx = mouse_x;
	var my = mouse_y;

	var x_left = argument0;
	var y_top = argument1;
	var ww = argument2;
	var hh = argument3;
	var button = argument4
	var highlight = argument5;

	if mouse_check_button_pressed(mb_left)
	   {
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   }

	if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh)
	    {
	    if highlight
	        {// highlight area
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if mouse_check_button_pressed(button) || mouse_check_button(button) || button == noone
	        {
	        //if button != noone
	        //audio_play_sound(snd_tap0,0,0);
	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;




}
