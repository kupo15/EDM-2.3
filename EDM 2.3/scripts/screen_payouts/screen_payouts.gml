function screen_payouts(ysep) {
	
	draw_team_payout_table(ysep);
	draw_entry_fee_table(ysep);
	draw_low_net_table(ysep);
	draw_payouts_reset_button();
	}
	
function draw_payouts_reset_button() {
	
	var xx = 830;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true) {
		
	    if !default_payout_safty {
			
			default_payout_safty = true;
			SAVE_FILE.prizePool = new PrizePool();
			json_save_array(config_file,SAVE_FILE); // save file
			}
	    else
	    default_payout_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	default_payout_safty = true;

	// draw button
	var col = pick(c_black,c_red,!default_payout_safty);
	draw_text_centered(xx,yy,"Reset Data",40,ww,hh,col);
	draw_text_centered(xx,yy,"(tap twice)",25,ww,hh*1.6,col);
	
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // outline
	}
	
function draw_team_payout_table(ysep) {
	
	var xx = 20;
	var yy = 300;
	var ww = 330;
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
		
	pref_team_num = draw_slider(xx,yy+hh-(2.5*ysep),ww,sliderEnum.teamPayout,"Entrants Slider",pref_team_num,pref_team_num_min,pref_team_num_max);
	}
	
function draw_entry_fee_table(ysep) {
		
	var xx = 20;
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
	
	var xx = 410;
	var yy = 140;
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
    
	pref_low_net_num = draw_slider(xx,yy+hh-(2.5*ysep),ww,sliderEnum.lowNetPayout,"Entrants Slider",pref_low_net_num,pref_low_net_num_min,pref_low_net_num_max);
	}