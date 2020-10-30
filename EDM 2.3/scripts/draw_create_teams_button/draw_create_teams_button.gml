function draw_create_teams_button() {
	// Clear All
	var xx = 530;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	draw_set_font(fn_name);
    
	if mouse_check_button_pressed(mb_left) && !scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	clear_all_safty = true;

	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    if mouse_ydist < 15 && mouse_xdist < 15 && !clear_all_safty
	    scr_reset_bracket();
	    else
	    clear_all_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	clear_all_safty = true;

	var alpha = (!clear_all_safty*0.3)+0.7;
	var col = c_black;
	if !clear_all_safty
	col = c_red;

	draw_set_alpha(alpha);
	draw_set_halign(fa_left);
	draw_text_colour(xx+15,yy+30+fn_off-15,"Clear Teams",col,col,col,col,alpha);
	draw_text_transformed(xx+45,yy+30+38+fn_off-10,"(tap twice)",0.6,0.6,0);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	draw_set_alpha(1);

	// Create Teams Button
	var xx = 830;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	var create = ds_list_size(entrant_list) > 3;
	if debug 
	create = 1;
    
	if create && keyboard_check_pressed(vk_enter)
	scr_create_teams();

	if create && scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    if mouse_ydist < 15 && mouse_xdist < 15
	    scr_create_teams();
	    }

	var alpha = (create*0.5)+0.5;

	draw_set_alpha(alpha);
	draw_set_halign(fa_left);
	draw_text(xx+5,yy+30+fn_off-10,"Create Teams");
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	draw_set_alpha(1);



}
