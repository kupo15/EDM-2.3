function draw_clear_all_teams_button() {
	
	var xx = 530;
	var yy = 500;
	var ww = 180;
	var hh = 90;

	// clicking
	if mouse_check_button_pressed(mb_left) && !scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	clear_all_safty = true;

	// draw button
	var alpha = (!clear_all_safty*0.3)+0.7;
	var col = pick(c_black,c_red,!clear_all_safty);

	draw_set_alpha(alpha);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // button outline
	draw_text_centered(xx,yy,"(tap twice)",25,ww,hh*1.6);
	draw_set_alpha(1);
	
	var str = pick("Teams","Groups",eventType);

	if draw_text_button(xx,yy,"Clear "+str,35,ww,hh,col,alpha) {
		
	    if !clear_all_safty
	    clear_all_teams();
	    else
	    clear_all_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	clear_all_safty = true;
	}

function draw_create_teams_button(alphaOverride=false) {
	
	// Create Teams Button
	var xx = 820;
	var yy = 500;
	var ww = 190;
	var hh = 90;
	var height = 33;

	var create = pick(ENTRANT_COUNT >= 4,1,debug)*!alphaOverride;
	var alpha = (create*0.5)+0.5;

	draw_set_alpha(alpha);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,false); // draw outline
	draw_set_alpha(1);
	
	var str = pick("Teams","Groups",eventType);
	
	if (draw_text_button(xx,yy,"Create "+str,height,ww,hh,c_white,alpha,,,create) || keyboard_check_pressed(vk_enter)) && create {
		
		scr_create_teams();
		screen_change(screenEnum.entrantDetails);
		}
	}
	