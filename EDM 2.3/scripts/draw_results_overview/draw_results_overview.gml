function draw_results_overview(page) {

	var xx = 30+(page*room_width);
	var yy = 60;
	var ysep = 33;
	var row = 12;
	var ww = 970;
	var hh = (ysep*row)+10;
	
	draw_results_final_content(xx,yy);
	draw_results_final_headers(xx,yy);
	draw_results_final_totals(xx,yy+hh);
	draw_results_final_buttons(page);
	
	// draw screen label
	var height = 70;
	var col = appblue;

	draw_set_halign(fa_left);
	draw_text_centered(xx,0,"RESULTS",height,,,col);
	
	// draw outline
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	draw_close_enough_animation();
	
	// scr_results_final_scrolling(xx,yy,ww);
	}
	
function draw_close_enough_animation() {
    
	if (close_enough_timer == -1)
	exit;

	var off = ((room_speed*5)-close_enough_timer);
	var alph_off = off;
	var alph = sin((alph_off/100)-50.09);

	var xx = 820;
	var yy = 200;
	var ww = 180;
	var hh = 100;

	if (off < 128)
	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,1);

	else if (off == 128) && !close_enough_skip
	close_enough_pause = true;

	if (close_enough_pause == 1)
	alph = 1;

	draw_set_alpha(alph)
	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,alph);
	draw_sprite(spr_close_enough,0,150,0);
	draw_set_halign(fa_left);

	var text_off = game_time-picture_timer_start;

	if close_enough_pause
	text_off = min(text_off,280);

	draw_text_ext(600+(off*0.2),510,("\"-It's close\n      enough...\""),60,-1);

	// finished with picture
	
	// details button
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	if draw_text_button(xx,yy,"Details",40,ww,hh) {
		
	    close_enough_pause = false;
	    picture_timer_start = game_time-text_off;
	    // close_enough_timer = 196;
	    close_enough_skip = true;
	    }

	if (alph <= 0)
	close_enough_timer = -1;
	
	draw_set_alpha(1);
	}
	
function draw_results_final_headers(xx,yy) {
	
	var height = 50;
	var xoff = 315;

	xoff += draw_text_centered(xx+xoff,yy-height,"Team\nWinnings",height,100);
	xoff += draw_text_centered(xx+xoff,yy-height,"Low Net\nWinnings",height,100);
	xoff += draw_text_centered(xx+xoff,yy-height,"Gross\nSkins",height,60);
	xoff += draw_text_centered(xx+xoff,yy-height,"Net\nSkins",height,60);
	xoff += draw_text_centered(xx+xoff,yy-height,"Win\nTotal",height,60);
	xoff += draw_text_centered(xx+xoff,yy-height,"Entry\nFee",height,60);
	
	//if no_net_skins || no_gross_skins {
	{	
	   var str_s = "No ";
	   
	   if no_net_skins
	   str_s += "Net";
	   else if no_gross_skins
	   str_s += "Gross";
   
	   str_s += "\nSkins";
   
	   var entr_col = appblue;
	   draw_text_centered(xx+xoff,yy-height,str_s,height,70,,entr_col);
	   }
      
	draw_text_centered(890,yy-height,"Net\nWinnings",height,70);
	}

function draw_results_final_content_list(xx,yy) {
	
	var height = 35;
	var sep = 40;
	var teamOff = 0;
	var prevTeamInd = 0;
	
	var arr = EVENT_RESULTS.entrantResults;
	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var winningStruct = memberStruct.eventWinnings;
		var teamInd = memberStruct.teamAssigned;
		var newTeam = (teamInd != prevTeamInd);
		var yoff = (i*sep);	

		// highlight row
		scr_mouse_position_room(xx,yy+yoff,970,sep,noone,true);
				
		draw_set_halign(fa_left);
		draw_member_name(xx+5,yy+yoff,memberStruct,height,,sep); // member name
			
		var xoff = 315;
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.teamWinning,height,100,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.lowNetWinning,height,100,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.skinsGross,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.skinsNet,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.winningGrandTotal,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.entryFee,height,60,sep);
			
		draw_text_centered(xx+xoff,yy+yoff,"-60",height,70,sep);
			
		// grand total winning
		var col = pick(c_red,c_black,winningStruct.winningGrandTotal >= 0);
			
		draw_set_halign(fa_right)
		draw_text_centered(985,yy+yoff,string(winningStruct.winningGrandTotal)+" pesos",height,,sep,col);
			
		// line separator
		var col = pick(c_black,appblue,newTeam);
		var alpha = pick(0.3,0.9,newTeam);

		draw_line_pixel(xx+20,yy+yoff+(sep*!newTeam),930,1,col,alpha);
		
		prevTeamInd += newTeam;
		}
		
	// subtract top border
	gpu_set_blendmode(bm_subtract);
	draw_line_pixel(0,0,room_width,yy-1,c_black);
	gpu_set_blendmode(bm_normal);
	}

function draw_results_final_content(xx,yy) {
	
	draw_results_final_content_list(xx,yy)
	exit;
	
	var height = 35;
	var sep = 40;
	var teamOff = 0;
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];	
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];
			var winningStruct = memberStruct.eventWinnings;
			var yoff = (j*sep)+teamOff;

			// highlight row
			scr_mouse_position_room(xx,yy+yoff,970,sep,noone,true);
				
			draw_set_halign(fa_left);
			draw_member_name(xx+5,yy+yoff,memberStruct,height,,sep); // member name
			
			var xoff = 315;
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.teamWinning,height,100,sep);
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.lowNetWinning,height,100,sep);
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.skinsGross,height,60,sep);
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.skinsNet,height,60,sep);
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.winningGrandTotal,height,60,sep);
			xoff += draw_text_centered(xx+xoff,yy+yoff,winningStruct.entryFee,height,60,sep);
			
			draw_text_centered(xx+xoff,yy+yoff,"-60",height,70,sep);
			
			// grand total winning
			var col = pick(c_red,c_black,winningStruct.winningGrandTotal >= 0);
			
			draw_set_halign(fa_right)
			draw_text_centered(985,yy+yoff,string(winningStruct.winningGrandTotal)+" pesos",height,,sep,col);
			
			// line separator
			var lastTeam = (j+1 == size);
			var col = pick(c_black,appblue,lastTeam);
			var alpha = pick(0.3,0.9,lastTeam);

			draw_line_pixel(xx+20,yy+yoff+sep,930,1,col,alpha);
			}
		
		teamOff += (size*sep);
		}
		
	// subtract top border
	gpu_set_blendmode(bm_subtract);
	draw_line_pixel(0,0,room_width,yy-1,c_black);
	gpu_set_blendmode(bm_normal);
	}
	
function draw_results_final_totals(xx,yy) {
	
	var height = 30;
	var sep = 38;
	
	// subtract bottom border
	gpu_set_blendmode(bm_subtract);
	draw_line_pixel(0,yy,room_width,room_height,c_black);
	gpu_set_blendmode(bm_normal);
	
	draw_set_halign(fa_right);
	draw_text_centered(355,yy,"Totals:",height,,sep);
	
	var totals = draw_results_final_calculate_totals();
	
	// draw totals
	var xoff = 315;
	xoff += draw_text_centered(xx+xoff,yy,totals.team,height,100,sep);
	xoff += draw_text_centered(xx+xoff,yy,totals.lowNet,height,100,sep);
	xoff += draw_text_centered(xx+xoff,yy,totals.gSkin,height,60,sep);
	xoff += draw_text_centered(xx+xoff,yy,totals.nSkin,height,60,sep);
	xoff += draw_text_centered(xx+xoff,yy,totals.win,height,60,sep);
	xoff += draw_text_centered(xx+xoff,yy,totals.entry,height,60,sep);
	}

function draw_results_final_calculate_totals() {
	
	var teamTotal = 0;
	var lowNetTotal = 0;
	var grossSkinTotal = 0;
	var netSkinTotal = 0;
	var winSubtotal = 0;
	var entryTotal = 0;
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];
			var winningStruct = memberStruct.eventWinnings;
			
			teamTotal += winningStruct.teamWinning;
			lowNetTotal += winningStruct.lowNetWinning;
			grossSkinTotal += winningStruct.skinsGross;
			netSkinTotal += winningStruct.skinsNet;
			winSubtotal += winningStruct.winSubtotal;
			entryTotal += winningStruct.entryFee;
			}
		}
		
	return {
		
		team: teamTotal,
		lowNet: lowNetTotal,
		gSkin: grossSkinTotal,
		nSkin: netSkinTotal,
		win: winSubtotal,
		entry: entryTotal,
		}
	}
	
function draw_results_final_buttons(page) {
	
	var screenOffset = (page-results_screen)*room_width;
	var can_click = (close_enough_timer == -1);
	var rec_col = c_green;
	
	// start over
	var xx = (page*room_width);
	var xoff = 30;
	var yy = 510;
	var ww = 150;
	var hh = 80;
	var height = 35;
	var col = pick(c_black,c_red,!clear_all_safty);
	
	draw_text_centered(xx+xoff,yy,"(tap twice)",height*0.66,ww,hh*1.5);
	draw_text_centered(xx+xoff,yy,"Start Over",height,ww,hh,col);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true) {
		
	    if !clear_all_safty
		scr_reset_bracket();
	    else
	    clear_all_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	clear_all_safty = true;
	
	draw_rectangle_color(xx+xoff,yy,xx+xoff+ww,yy+hh,rec_col,rec_col,rec_col,rec_col,true);
	
	// edit scores
	var xoff = 250;
	var yy = 525;
	var ww = 180;
	var hh = 65;
	var height = 35;
	
	if !global.save_loaded {
		
		draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,rec_col,rec_col,rec_col,rec_col,true);
		draw_text_centered(xx+xoff,yy,"Edit Scores",height,ww,hh);
		
		if !global.save_loaded && draw_text_button(xoff+screenOffset,yy,"",height,ww,hh,,,,,can_click)
		screen_change(screenEnum.eventRunning);
	    }
	
	// team results
	var xoff = 870;
	var yy = 510;
	var ww = 150;
	var hh = 80;
	var height = 70;
	
	draw_text_centered(xx+xoff,yy,"Team\nResults",height,ww,hh);
	
	if draw_text_button(xoff+screenOffset,yy,"",height,ww,hh,,,,,can_click)
    results_screen_end++;
	
	draw_rectangle_color(xx+xoff,yy,xx+xoff+ww,yy+hh,rec_col,rec_col,rec_col,rec_col,true);
	}