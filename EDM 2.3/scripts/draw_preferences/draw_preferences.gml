function draw_preferences() {
	// close enough preference
	var xx = 950;
	var yy = 140;
	var ww = 60;

	draw_sprite_ext(spr_close_enough,0,xx,yy,0.1,0.1,0,c_white,0.3+(0.7*settings_close_enough));

	// clicked on close enough
	if scr_mouse_position_room_released(xx-10,yy,ww,ww,mb_left,true)
		{
		settings_close_enough = !settings_close_enough; // toggle
		ini_settings_save();
		}

	var str = "on";
	if !settings_close_enough
	str = "off";
	draw_set_halign(fa_center);
	draw_text_transformed(xx+20,yy+50,str,0.5,0.5,0);

	// season ranking screen
	var xx = 530;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	draw_set_halign(fa_center);
	draw_text(xx+85,yy+20+fn_off-15,"Season");
	draw_text_transformed(xx+85,yy+20+38+fn_off-10,"Ranking",0.6,0.6,0);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	// clicked on Season Ranking GOTO
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    season_ranking_load();
	    pref_phase = prefPhase.seasonRank;
	    }

	// reset data
	var xx = 830;
	var yy = 500;
	var ww = 180;
	var hh = 80;
	var ysep = 40;

	if mouse_check_button_pressed(mb_left) && !scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	default_payout_safty = true;

	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    if mouse_ydist < 15 && mouse_xdist < 15 && !default_payout_safty
	    scr_reset_payout();
	    else
	    default_payout_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	default_payout_safty = true;

	var col = c_black;
	if !default_payout_safty
	col = c_red;

	draw_set_halign(fa_left);
	draw_text_colour(xx+15,yy+30+fn_off-15,"Reset Data",col,col,col,col,1);
	draw_text_transformed(xx+45,yy+30+38+fn_off-10,"(tap twice)",0.6,0.6,0);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	var xx = 100;
	var yy = 70;
	var ww = 350;
	var hh = 5*ysep; 
	var col = make_color_rgb(98,145,242);

	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_font(fn_name);

	// entry fee table
	draw_rectangle(xx-60,yy-ysep,xx-60+ww,yy-ysep+hh,true);
	draw_line(xx-60,yy,xx-60+ww,yy);

	draw_text_colour(xx+180,yy-fn_off-75,"Entry Fees",col,col,col,col,1);
	draw_text(xx+150,yy-fn_off-30,"Team Entry:");
	draw_text(xx+150,yy+(ysep*1)-fn_off-30,"Low Net Entry:");
	draw_text(xx+150,yy+(ysep*2)-fn_off-30,"Skins Entry:");
	draw_text(xx+150,yy+(ysep*3)-fn_off-30,"Blind Fee:");

	draw_set_halign(fa_left);
	draw_text(xx+170,yy-fn_off-30,string(team_entry)+" pesos");
	draw_text(xx+170,yy+(ysep*1)-fn_off-30,string(low_net_entry)+" pesos");
	draw_text(xx+170,yy+(ysep*2)-fn_off-30,string(skins_entry)+" pesos");
	draw_text(xx+170,yy+(ysep*3)-fn_off-30,string(blind_fee)+" pesos");

	// team payout table
	yy += 230;
	hh = 5*ysep;

	draw_rectangle(xx-60,yy-ysep,xx-60+ww,yy-ysep+hh,true);
	draw_line(xx-60,yy,xx-60+ww,yy);

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_font(fn_name);

	draw_text_colour(xx+30,yy-fn_off-75,"Team Payout",col,col,col,col,1);
	draw_text(xx-55,yy-fn_off-75+(1*ysep),string(pref_team_num+1)+" Teams");


	var slots = array_length_2d(team_pay_table,pref_team_num);
	for(var i=0;i<slots;i++)
	    {    
	    // draw payout slot
	    draw_set_halign(fa_left);
	    draw_text(xx-50,yy-fn_off-75+(2*ysep)+(i*ysep),string(i+1)+")");
    
	    draw_set_halign(fa_right);
	    draw_text(xx+150,yy-fn_off-75+(2*ysep)+(i*ysep),string(team_pay_table[pref_team_num,i])+" pesos");
	    }

	// low net payout table
	xx += 500;
	yy -= 230;
	hh = 9*ysep;

	draw_rectangle(xx-60,yy-ysep,xx-60+ww,yy-ysep+hh,true);
	draw_line(xx-60,yy,xx-60+ww,yy);

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_font(fn_name);

	draw_text_colour(xx+30,yy-fn_off-75,"Low Net Payout",col,col,col,col,1);
	draw_text(xx-55,yy-fn_off-75+(1*ysep),"Entrants: "+string(pref_low_net_num+1));

	var slots = array_length_2d(low_net_pay_table,pref_low_net_num);
	for(var i=0;i<slots;i++)
	    {    
	    // draw payout slot
	    draw_set_halign(fa_left);
	    draw_text(xx-50,yy-fn_off-75+(2*ysep)+(i*ysep),string(i+1)+")");
    
	    draw_set_halign(fa_right);
	    draw_text(xx+150,yy-fn_off-75+(2*ysep)+(i*ysep),string(low_net_pay_table[pref_low_net_num,i])+" pesos");
	    }
    
	if draw_slider() = -1
	exit;

	// keypad entry
	var def_num = 0; 
	if preference_type = 0 
	    {// payouts
	    switch preference_index
	        {
	        case 0: def_num = team_entry; break;
	        case 1: def_num = low_net_entry; break;
	        case 2: def_num = skins_entry; break;
	        case 3: def_num = blind_fee; break;
	        }
	    }
	else if preference_type = 1
	    {// low net
	    def_num = low_net_pay_table[pref_low_net_num,preference_index];
	    }
	else if preference_type = 2
	    {// teams
	    def_num = team_pay_table[pref_team_num,preference_index];
	    }
    
	var entry = draw_numpad_entry(400,125,def_num);
	if entry = -2
	exit;

	if entry != -1 // entered number on keypad
	    {
	    entry = abs(entry);
    
	    if preference_type = 0
	    switch preference_index
	        {
	        case 0: team_entry = entry; break;
	        case 1: low_net_entry = entry; break;
	        case 2: skins_entry = entry; break;
	        case 3: blind_fee = entry; break;
	        }
	    else if preference_type = 1
	    low_net_pay_table[pref_low_net_num,preference_index] = entry;
	    else if preference_type = 2
	    team_pay_table[pref_team_num,preference_index] = entry;
	    }

	// low net selection
	for(var i=0;i<slots;i++)
	if scr_mouse_position_room_released(xx-60,yy-80+(3*ysep)+(i*ysep),ww,30,mb_left,!keypad_entry)
	    { // select payout row
	    keypad_entry = true;
	    preference_type = 1;
	    preference_index = i;
	    negate = 1;
	    break;
	    }
    
	xx -= 500;    
	// entry fee selection
	for(var i=0;i<4;i++)
	if scr_mouse_position_room_released(xx-60,yy+(i*ysep),ww,ysep,mb_left,!keypad_entry)
	   {// select entry fee
	   keypad_entry = true;
	   preference_index = i;
	   preference_type = 0;
	   negate = 1;
	   break;
	   }
   
	yy += 230;
	var slots = array_length_2d(team_pay_table,pref_team_num);

	// team selection
	for(var i=0;i<slots;i++)
	if scr_mouse_position_room_released(xx-60,yy-80+(3*ysep)+(i*ysep),ww,30,mb_left,!keypad_entry)
	    { // select payout row
	    keypad_entry = true;
	    preference_type = 2;
	    preference_index = i;
	    negate = 1;
	    break;
	    }
    
	// back out of preferences
	if (android_back || scr_mouse_position_room_released(950,15,60,60,mb_left,true))
	    {
	    pref_phase = prefPhase.none;
    
	    if phase > 1 // results screen
	    scr_calculate_results();
	    }
	}
