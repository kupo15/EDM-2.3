function draw_clear_all_teams_button() {
	
	var xx = 530;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	// clicking
	if mouse_check_button_pressed(mb_left) && !scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	clear_all_safty = true;

	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true) {
		
	    if (global.mouse_ydist < 15) && (global.mouse_xdist < 15) && !clear_all_safty
	    scr_reset_bracket();
	    else
	    clear_all_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	clear_all_safty = true;

	// draw button
	var alpha = (!clear_all_safty*0.3)+0.7;
	var col = pick(c_black,c_red,!clear_all_safty);

	draw_set_alpha(alpha);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // button outline
	draw_text_centered(xx,yy,"Clear Teams",35,ww,hh,col,alpha);
	draw_text_centered(xx,yy,"(tap twice)",25,ww,hh*1.6);
	draw_set_alpha(1);
	}

function draw_create_teams_button() {
	
	// Create Teams Button
	var xx = 830;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	var create = pick(ENTRANT_COUNT >= 4,1,debug);
    
	if create && keyboard_check_pressed(vk_enter)
	scr_create_teams();

	if create && scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true) {
		
	    if (global.mouse_ydist < 15) && (global.mouse_xdist < 15)
	    scr_create_teams();
	    }

	var alpha = (create*0.5)+0.5;

	draw_set_alpha(alpha);
	draw_text_centered(xx,yy,"Create Teams",35,ww,hh);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // draw outline
	draw_set_alpha(1);
	}
