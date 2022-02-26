function low_net_rank_sort_results() {
	
	var sortKey = ["netFront","netBack","netTotal"];
	array_sort_struct(lowNetResults,sortKey[net_score_tab],true,["roundStats","resultRanking"]);
	}

function draw_results_low_net(page) {
	
	var xx = (page*room_width);
	var yy = 400;
	var height = 60;
	var sep = 35;
	
	var sortKey = ["netFront","netBack","netTotal"];
	var payoutKey = ["frontWinnings","backWinnings","allHolesWinnings"];
	
	draw_low_net_results_content(xx,sep,sortKey[net_score_tab],sortKey[net_score_tab],payoutKey[net_score_tab]);

	var ww = draw_text_centered(xx+750,yy,"Low Net",height,220,,appblue);
	draw_text_centered(xx+750,yy,"Results",height,ww,height*2.5,appblue);
	
	var entrantMax = min(PAYOUT_TABLES.lowNetPayoutMax,ENTRANT_COUNT)-1;
	draw_payout_table(xx+730,70,PAYOUT_TABLES.lowNetPayout[entrantMax]);
	draw_low_net_result_tables(xx,sep,page);
	
	draw_results_low_net_buttons(page,xx);
	}
	
function draw_low_net_results_content(xx,sep,sortKey,scoreKey,payoutKey) {
	
	xx += 20;
	var yy = 40;
	var height = sep*0.875;

	var entrantMax = min(PAYOUT_TABLES.lowNetPayoutMax,ENTRANT_COUNT)-1;
	var payoutCutoffInd = array_length(PAYOUT_TABLES.lowNetPayout[entrantMax])+1;
	var cutoffDrawn = false;
	var prevRank = 0;
	var rankCount = 0;
	var arr = lowNetResults;
	var size = array_length(arr);
	for(var i=0;i<size;i++) {
		
		var ind = (i-results_low_net_offset);
		var yoff = (ind*sep);

		var memberStruct = arr[i];
		var memberDetails = memberStruct.memberDetails;
		var winningStruct = memberStruct.eventWinnings;
		var roundStats = memberStruct.roundStats;
		
		var rank = roundStats.resultRanking[$ sortKey];
				
		if (rank != prevRank) {
			
			draw_text_centered(xx+10,yy+yoff,rank,height,,sep); // rank
			
			if (rankCount > 0)
			draw_line_pixel(xx+70,yy-(sep*0.6)+((ind-rankCount)*sep),2,(rankCount+0.5)*sep,appblue); // line
			
			prevRank++;
			rankCount = 0;
			}
		else
		rankCount++;
		
		// cutoff win line
		if (rank == payoutCutoffInd) && !cutoffDrawn {
			
			draw_line_pixel(xx+80,yy+yoff,600,1,,0.5);
			cutoffDrawn = true;
			}
			
		var alpha = pick(1,0.9,cutoffDrawn);
		
		draw_text_centered(xx+80,yy+yoff,memberDetails.fullName,height,,sep,,alpha); // member name
		draw_text_centered(xx+330,yy+yoff,roundStats[$ scoreKey],height,155,sep,,alpha); // score
		
		draw_set_halign(fa_right);
		draw_text_centered(xx+630,yy+yoff,string(winningStruct[$ payoutKey])+" pesos",height,,sep,,alpha); // payout
		
		draw_set_halign(fa_left);
		
		if (i+1 == size) && (rankCount > 0)
		draw_line_pixel(xx+70,yy-(sep*0.6)+((ind-rankCount+1)*sep),2,(rankCount+0.5)*sep,appblue); // line
		}
		
	// subtract top border
	gpu_set_blendmode(bm_subtract);
	draw_line_pixel(xx-20,0,xx-20+room_width,yy-1,c_black);
	gpu_set_blendmode(bm_normal);
	}
	
function draw_low_net_result_tables(xx,sep,page) {
	
	var screenOffset = (page-results_screen)*room_width;
	var xoff = 20;
	
	xx += xoff;
	var yy = 40;
	var ww = 680;
	var hh = room_height-yy;
	var rows = hh/sep;
	
	// draw outline
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	var labels = ["Front","Back","18 Hole"];
	var height = 30;
	
	draw_set_halign(fa_left);
	draw_text_centered(xx+10,yy-height,"Place",height,,height*1.3);
	draw_text_centered(xx+330,yy-height,labels[net_score_tab]+" Score",height,155,height*1.3);
	draw_text_centered(xx+500,yy-height,labels[net_score_tab]+" Payout",height,,height*1.3);
	
	// cycle helper
	var can_click = (results_screen_end == page);
	var label = ["Front","Back","18Hole"];
	for(var i=0;i<3;i++) {
		
		var selected = (net_score_tab == i);
		var height = pick(25*0.8,27,selected);
		var alpha = pick(0.8,1,selected);
		
		draw_text_centered(xx+125+(i*60),yy-40,label[i],height,60,30*1.3,appblue,alpha);
		
		if scr_mouse_position_room_released(xoff+125+(i*60),yy-40,60+screenOffset,30*1.3,mb_left,,,can_click) {
			
			net_score_tab = i;
			low_net_rank_sort_results();
			}
		
		var rr = pick(2,3,selected);
		
		draw_set_alpha(alpha);
		draw_circle_color(xx+125+(i*60)+30,yy-10,rr,appblue,appblue,false);

		draw_set_alpha(1);
		}
	
	// scrolling
	scr_results_low_net_scrolling(xoff+screenOffset,yy,ww,hh,sep,rows,scrollbarIndex.resultsLowNet);
	}

function draw_results_low_net_buttons(page,xx) {
	
	var can_click = (results_screen_end == page);
	var screenOffset = (page-results_screen)*room_width;
	
	var xoff = 820;
	var yy = 500;
	var ww = 190;
	var hh = 80;
	var height = 35;
	
	// draw low net button
	draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	
	draw_text_centered(xx+xoff,yy,"Team Results",height,ww,hh);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true,,can_click) {
		
		android_back = false;
		results_screen_end--;
		}
		
	// tap anywhere to cycle
	if scr_mouse_position_room_released(0,40,700+screenOffset,room_height,mb_left,false,,can_click) {
		
		net_score_tab = (net_score_tab+1) mod 3;
		low_net_rank_sort_results();
		}
	}