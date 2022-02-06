
function screen_settings() {

	var ysep = 40;

	draw_set_halign(fa_left);
	screen_payouts(ysep);
	//draw_preferences();
	}
	
function screen_payouts(ysep) {
	
	draw_team_payout_table(ysep);
	draw_entry_fee_table(ysep);
	draw_low_net_table(ysep);
	}
	
function draw_team_payout_table(ysep) {
	
	var xx = 20;
	var yy = 50;
	var ww = 300;
	var hh = 6*ysep;
	var height = ysep*0.7;
	var header_col = make_color_rgb(98,145,242);

	draw_rectangle(xx,yy,xx+ww,yy-ysep+hh,true);
	draw_text_centered(xx,yy,"Team Payout",height,ww,ysep,header_col);

	yy += ysep;
	draw_line(xx,yy,xx+ww,yy); // header line
	draw_text_centered(xx+15,yy,string(pref_team_num+1)+" Teams",height,,ysep);

	draw_text_centered(xx+ww-ysep-ysep,yy,"-",ysep,ysep,ysep);
	draw_text_centered(xx+ww-ysep,yy,"+",ysep,ysep,ysep);
	draw_line_pixel(xx+ww-ysep,yy+5,1,ysep-2,,0.2);

	yy += ysep;	
	var arr = PAYOUT_TABLES.teamPayout[pref_team_num];
	var size = array_length(arr);
	for(var i=0;i<size;i++)
	    {    
		var str = arr[i];	
			
	    // draw payout slot
		draw_set_halign(fa_left);
	    draw_text_centered(xx+15,yy+(i*ysep),string(i+1)+")",height,,ysep);
    
	    draw_set_halign(fa_right);
	    draw_text_centered(xx+145,yy+(i*ysep),string(str)+" pesos",height,,ysep);
		
		// horizontal line
		draw_line_pixel(xx+20,yy+((i+1)*ysep),ww-40,1,,0.3);
		
		// edit icon
		//draw_icon(ico_edit,0,xx+ww-40,yy+(i*ysep),ysep,ysep,,0.5);
		
		// if clicked
		if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,ysep,mb_left,!keypad_entry) {
			
			init_keypad(entryType.teamPayout,str);
			settings_clicked_index = i;
			}
	    }
	}
	
function draw_entry_fee_table(ysep) {
		
	var xx = 360;
	var yy = 50;
	var ww = 330;
	var hh = 6*ysep;
	var height = ysep*0.7;
	var header_col = make_color_rgb(98,145,242);

	draw_rectangle(xx,yy,xx+ww,yy-ysep+hh,true);
	draw_text_centered(xx,yy,"Entry Fees",height,ww,ysep,header_col);

	yy += ysep;
	draw_line(xx,yy,xx+ww,yy); // header line

	var arr = ["Team Entry","Low Net Entry","Skins Entry","Blind Fee"];
	var arrVal = [ENTRY_FEES.teamEntry,ENTRY_FEES.lowNetEntry,ENTRY_FEES.skinsEntry,ENTRY_FEES.blindFee];
	var arrEnum = [entryType.teamEntry,entryType.lowNetEntry,entryType.skinsEntry,entryType.blindFee];
	var size = array_length(arr);
	for(var i=0;i<size;i++)
	    {    
		var str = arrVal[i];
			
	    draw_set_halign(fa_right);
	    draw_text_centered(xx+180,yy+(i*ysep),string(arr[i])+":",height,,ysep);
			
	    draw_set_halign(fa_left);
	    draw_text_centered(xx+190,yy+(i*ysep),str+" pesos",height,,ysep);
		
		// horizontal line
		draw_line_pixel(xx+20,yy+((i+1)*ysep),ww-40,1,,0.3);
		
		// edit icon
		//draw_icon(ico_edit,0,xx+ww-40,yy+(i*ysep),ysep,ysep,,0.5);
		
		// if clicked
		if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,ysep,mb_left,!keypad_entry) {			
			
			init_keypad(arrEnum[i],str);
			settings_clicked_index = i;
			}
	    }	
	}	
	
function draw_low_net_table(ysep) {
	
	var xx = 700;
	var yy = 100;
	var ww = 300;
	var hh = 10*ysep;
	var height = ysep*0.7;
	var header_col = make_color_rgb(98,145,242);

	draw_rectangle(xx,yy,xx+ww,yy-ysep+hh,true);
	draw_text_centered(xx,yy,"Low Net Payout",height,ww,ysep,header_col);

	yy += ysep;
	draw_line(xx,yy,xx+ww,yy); // header line
	draw_text_centered(xx+15,yy,"Entrants: "+string(pref_low_net_num+1),height,,ysep);

	draw_text_centered(xx+ww-ysep-ysep,yy,"-",ysep,ysep,ysep);
	draw_text_centered(xx+ww-ysep,yy,"+",ysep,ysep,ysep);
	draw_line_pixel(xx+ww-ysep,yy+5,1,ysep-2,,0.2);

	yy += ysep;	
	var arr = PAYOUT_TABLES.lowNetPayout[pref_low_net_num];
	var size = array_length(arr);
	for(var i=0;i<size;i++)
	    {    
		var str = arr[i];	
			
	    // draw payout slot
		draw_set_halign(fa_left);
	    draw_text_centered(xx+15,yy+(i*ysep),string(i+1)+")",height,,ysep);
    
	    draw_set_halign(fa_right);
	    draw_text_centered(xx+145,yy+(i*ysep),string(str)+" pesos",height,,ysep);
		
		// horizontal line
		draw_line_pixel(xx+20,yy+((i+1)*ysep),ww-40,1,,0.3);
		
		// edit icon
		//draw_icon(ico_edit,0,xx+ww-40,yy+(i*ysep),ysep,ysep,,0.5);
		
		// if clicked
		if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,ysep,mb_left,!keypad_entry) {
			
			init_keypad(entryType.lowNetPayout,str);
			settings_clicked_index = i;
			}
	    }
    
	if draw_slider() = -1
	exit;
	}
	
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
	    if (global.mouse_ydist < 15) && (global.mouse_xdist < 15) && !default_payout_safty
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
        
	// back out of preferences
	if (android_back || scr_mouse_position_room_released(950,15,60,60,mb_left,true))
	    {
	    pref_phase = prefPhase.homeScreen;
    
	    if phase > 1 // results screen
	    scr_calculate_results();
	    }
	}
	