/// @param x_left
/// @param y_top
/// @param box_ww
/// @param box_hh
/// @param ms_button
/// @param highlight
/// @param sound
function scr_mouse_position_room_pressed(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var mx = mouse_x;
	var my = mouse_y;

	var x_left = argument0;
	var y_top = argument1;
	var ww = argument2;
	var hh = argument3;
	var button = argument4
	var highlight = argument5;
	var sound = argument6;

	if mouse_check_button_pressed(mb_left)
	   {
	   mouse_xstart = mouse_x;
	   mouse_ystart = mouse_y;
	   mouse_xdist = 0;
	   mouse_ydist = 0;
	   }

	if (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh)
	    {
	    if highlight
	        {// highlight area
	        draw_set_alpha(0.3);
	        draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,c_yellow,c_yellow,c_yellow,c_yellow,false);
	        draw_set_alpha(1);
	        }
           
	    if mouse_check_button_pressed(button) || button = noone
	        {
	        var num = irandom(2);
	        if button != noone && sound
	        audio_play_sound(asset_get_index("snd_tap"+string(num)),0,false);
        
	        return true;
	        }
	    else 
	    return false;
	    }
	else return false;




}
