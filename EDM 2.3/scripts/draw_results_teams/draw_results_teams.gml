function draw_results_teams(page) {
		
	var xx = (page*room_width);
	var yy = 285;
	var height = 150;

	draw_text_centered(xx+750,yy,"Team\nResults",height,,,appblue);

	draw_payout_table(xx+730,70,PAYOUT_TABLES.teamPayout[team_number]);
    draw_team_result_tables(xx);
	draw_results_team_buttons(page,xx);
	}
	
function draw_payout_table(xx,yy,arr) {

	var size = array_length(arr);
	var ysep = 40;
	var ww = 280;
	var hh = (2+size)*ysep;
	var height = ysep*0.7;
	var header_col = appblue;

	draw_rectangle(xx,yy,xx+ww,yy-ysep+hh,true);
	draw_text_centered(xx,yy,"Payout Chart",height,ww,ysep,header_col);

	yy += ysep;
	draw_line(xx,yy,xx+ww,yy); // header line

	for(var i=0;i<size;i++) {
		
		var str = arr[i];	
			
	    // draw payout slot
		draw_set_halign(fa_left);
	    draw_text_centered(xx+15,yy+(i*ysep),string(i+1)+")",height,,ysep);
    
	    draw_set_halign(fa_right);
	    draw_text_centered(xx+130,yy+(i*ysep),string(str)+CURRENCY_SYMBOL,height,,ysep);
		
		// horizontal line
		draw_line_pixel(xx+20,yy+((i+1)*ysep),ww-40,1,,0.3);
		}
	}

function draw_team_result_tables(xx) {
	
	xx += 20;
	var sep = 28;
	var yy = 30;
	var ww = 680;
	var hh = 6*sep;

	var labels = ["Front","Back","18 Hole"];
	var sortKey = ["frontRank","backRank","totalRank"];
	var scoreKey = ["teamNetFront","teamNetBack","teamNetTotal"];
	var payoutKey = ["frontWinnings","backWinnings","allHolesWinnings"];
	for(var i=0;i<3;i++) {
		
		var yoff = (hh*i)+(sep*i);
		draw_rectangle(xx,yy+yoff,xx+ww,yy+yoff+hh,true);
		
		draw_set_halign(fa_left);
		draw_text_centered(xx+10,yy+yoff-sep,"Place",sep,,sep*1.3);
		draw_text_centered(xx+330,yy+yoff-sep,labels[i]+" Score",sep,155,sep*1.3);
		draw_text_centered(xx+500,yy+yoff-sep,labels[i]+" Payout",sep,,sep*1.3);
		
		draw_team_results_content(xx,yy+yoff,sep,sortKey[i],scoreKey[i],payoutKey[i]);
		}
	}
	
function draw_team_results_content(xx,yy,sep,sortKey,scoreKey,payoutKey) {
	
	if (eventType == eventEnum.individual) {
		
		//draw_line_pixel(0,0,room_width,room_height,c_black,0.5);
		//draw_text_centered(300,200,"NOT A TEAM EVENT",60,,,appblue);
		exit;
		}
	
	var list = FINAL_EVENT_RESULTS.teamResults;	
	array_sort_struct(list,sortKey,true,["teamWinnings"]);

	var payoutCutoffInd = array_length(PAYOUT_TABLES.teamPayout[team_number])+1;
	var cutoffDrawn = false;
	var rankCount = 0;
	var prevRank = 0;
	var size = array_length(list);
	for(var i=0;i<size;i++) {
		
		var teamStruct = list[i];
		var teamRank = teamStruct.teamWinnings[$ sortKey];
		
		if (teamRank != prevRank) {
			
			draw_text_centered(xx+10,yy+(i*sep),teamRank,sep*0.9,,sep*1.3); // rank
							
			if (rankCount > 0)
			draw_line_pixel(xx+70,yy-(sep*0.6)+((i-rankCount)*sep),2,(rankCount+0.5)*sep,appblue); // line
			
			prevRank++;
			rankCount = 0;
			}
		else
		rankCount++;
		
		// cutoff win line
		if (teamRank == payoutCutoffInd) && !cutoffDrawn {
			
			draw_line_pixel(xx+80,yy+(i*sep),600,1,,0.5);
			cutoffDrawn = true;
			}
		
		var alpha = pick(1,0.9,cutoffDrawn);

		draw_text_centered(xx+80,yy+(i*sep),"Team "+string(teamStruct.teamNumber+1),sep,,sep*1.3,,alpha); // team name
		draw_text_centered(xx+330,yy+(i*sep),teamStruct[$ scoreKey],sep,155,sep*1.3,,alpha); // score
		
		draw_set_halign(fa_right);
		draw_text_centered(xx+630,yy+(i*sep),string(teamStruct.teamWinnings[$ payoutKey])+CURRENCY_SYMBOL,sep,,sep*1.3,,alpha); // payout
		
		draw_set_halign(fa_left);
		
		if (i+1 == size) && (rankCount > 0)
		draw_line_pixel(xx+70,yy-(sep*0.6)+((i-rankCount+1)*sep),2,(rankCount+0.5)*sep,appblue); // line
		}
	}
	
function draw_results_team_buttons(page,xx) {
	
	var screenOffset = (page-results_screen)*room_width;
	var can_click = (results_screen_end == page);
	
	// draw Results
	var xoff = 708;
	var yy = 500;
	var ww = 150;
	var hh = 80;
	var height = 35;

	draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	
	draw_text_centered(xx+xoff,yy,"Results",height,ww,hh);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true) {
		
		android_back = false;
		results_screen_end--;

		if (results_screen_end < 0)
		results_screen_end = 0;
		}
		
	// draw low net button	
	xoff += ww+10;

	draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	
	draw_text_centered(xx+xoff,yy,"Low Net",height,ww,hh);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true)
	results_screen_end++;
	}