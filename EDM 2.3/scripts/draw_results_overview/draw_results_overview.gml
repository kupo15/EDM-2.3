function draw_results_overview(page) {

	var can_click = (close_enough_timer == -1) && (page == results_screen_end);

	var xx = 30+(page*room_width);
	var yy = 60;
	var ysep = 33;
	var row = 12;
	var ww = 970;
	var hh = (ysep*row)+10;
	
	draw_results_final_content(xx,yy,can_click);
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
	}
	
function draw_close_enough_animation() {

	if (close_enough_timer == -1)
	exit;

	// picture
	var time = (GAME_TIME-picture_timer_start);
	var ind = clamp(time/100,0,1);
	var alpha = sin(ind-50.09)+0.08;

	picture_timer_skip = clamp(picture_timer_skip+(close_enough_skip/70),0,1);

	var curve = animcurve_get_channel(AnimationCurve1,"curve2");
	var val = animcurve_channel_evaluate(curve,picture_timer_skip);
	var alpha_out = val;

	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,alpha_out);

	draw_set_alpha(alpha*alpha_out);
	draw_sprite(spr_close_enough,0,150,0);

	// quote	
	var curve = animcurve_get_channel(AnimationCurve1,"curve1");
	var stop_point = pick(curve.points[1].posx+0.05,1,close_enough_skip);
	var ind = clamp(time/200,0,stop_point);
	var val = animcurve_channel_evaluate(curve,ind);
	var alpha = clamp((1.02+val)*2,0,1);
	
	var xx = 630;
	var dist = (room_width-xx)*0.7;
	var text_off = val*dist;

	draw_set_halign(fa_left);
	draw_text_ext(xx+text_off,510,("\"-It's close\n      enough...\""),60,-1);
	
	// details button
	var xx = 820;
	var yy = 200;
	var ww = 180;
	var hh = 100;
	
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	if draw_text_button(xx,yy,"Details",40,ww,hh) {
		
	    if (ind == stop_point)
	    picture_timer_start = GAME_TIME-111;
				
	    close_enough_skip = true;
	    }

	if (alpha_out <= 0)
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
	
	if no_net_skins || no_gross_skins {

	   var str_s = "No ";
	   
	   if no_net_skins
	   str_s += "Net";
	   else
	   str_s += "Gross";
	   
       str_s += "\nSkins";
	   
	   if no_net_skins && no_gross_skins
	   str_s = "No\nSkins";
   
	   var entr_col = appblue;
	   draw_text_centered(xx+xoff,yy-height,str_s,height,70,,entr_col);
	   }
      
	draw_text_centered(890,yy-height,"Net\nWinnings",height,70);
	}

function draw_results_final_content(xx,yy,can_click) {
	
	var height = 35;
	var sep = 40;
	var prevTeamInd = 0;
	var arr = scrollbar(xx,yy,970,470,sep,FINAL_EVENT_RESULTS.entrantResults,scrollbarIndex.resultsOverview,,close_enough_timer == -1);

	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var eventDetails = memberStruct.activeEvent.eventDetails;
		var eventResults = memberStruct.activeEvent.eventResults;
		var payoutBreakdown = eventResults.payoutBreakdown;

		var teamInd = eventDetails.teamAssigned;
		var newTeam = (teamInd != prevTeamInd);
		
		var ind = (i-scrollbar_get_offset(scrollbarIndex.resultsOverview));
		var yoff = (ind*sep);
		var entryAlpha = pick(1,0.8,no_net_skins || no_gross_skins);

		// highlight row
		if !results_scrolling && !scrolling
		scr_mouse_position_room(xx,yy+yoff,970,sep,noone,true);
				
		draw_set_halign(fa_left);
		draw_member_name(xx+5,yy+yoff,memberStruct,height,,,sep); // member name
			
		var xoff = 315;
		xoff += draw_text_centered(xx+xoff,yy+yoff,payoutBreakdown.teamWinning,height,100,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,payoutBreakdown.lowNetWinning,height,100,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,payoutBreakdown.skinsGross,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,payoutBreakdown.skinsNet,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,payoutBreakdown.winSubtotal,height,60,sep);
		xoff += draw_text_centered(xx+xoff,yy+yoff,-payoutBreakdown.entryFee,height,60,sep,,entryAlpha);
			
		if no_net_skins || no_gross_skins {

			var refund = payoutBreakdown.entryFee-(no_net_skins+no_gross_skins)*real(ENTRY_FEES.skinsEntry)*0.5;
			
			draw_line_pixel(xx+xoff-50,yy+(sep*0.5)+yoff,45,2,c_red,entryAlpha); // cross out entry fee
			draw_text_centered(xx+xoff-10,yy+yoff,-refund,height,70,sep); // modified entry fee
			}
			
		// grand total winning
		var col = pick(c_red,c_black,payoutBreakdown.winningGrandTotal >= 0);
			
		draw_set_halign(fa_right)
		draw_text_centered(985,yy+yoff,string(payoutBreakdown.winningGrandTotal)+CURRENCY_SYMBOL,height,,sep,col);
			
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
	
	var arr = FINAL_EVENT_RESULTS.entrantResults;
	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var payoutBreakdown = memberStruct.activeEvent.eventResults.payoutBreakdown;
			
		teamTotal += payoutBreakdown.teamWinning;
		lowNetTotal += payoutBreakdown.lowNetWinning;
		grossSkinTotal += payoutBreakdown.skinsGross;
		netSkinTotal += payoutBreakdown.skinsNet;
		winSubtotal += payoutBreakdown.winSubtotal;
		entryTotal += payoutBreakdown.entryFee;
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
	var can_click = (close_enough_timer == -1) && (page == results_screen_end);
	var rec_col = c_green;
	
	// new event
	var xx = (page*room_width);
	var xoff = 30;
	var yy = 510;
	var ww = 150;
	var hh = 80;
	var height = 35;
	var col = pick(c_black,c_red,!clear_all_safty);
	
	draw_text_centered(xx+xoff,yy,"(tap twice)",height*0.66,ww,hh*1.5);
	draw_text_centered(xx+xoff,yy,"New Event",height,ww,hh,col);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true) {
		
	    if !clear_all_safty
		event_create_new();
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
		
		if !global.save_loaded && draw_text_button(xoff+screenOffset,yy,"",height,ww,hh,,,,,can_click) {
			
			resultsEdited = true;
			screen_change(screenEnum.eventRunning);
			}
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