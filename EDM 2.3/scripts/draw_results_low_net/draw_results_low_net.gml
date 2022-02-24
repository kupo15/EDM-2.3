function low_net_rank_sort_results() {
	
	var sortKey = ["netFront","netBack","netTotal"];
	array_sort_struct(EVENT_RESULTS.entrantResults,sortKey[net_score_tab],true,["roundStats","resultRanking"]);
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
	
	draw_payout_table(xx+730,70,PAYOUT_TABLES.lowNetPayout[ENTRANT_COUNT-1]);
	draw_low_net_result_tables(xx,sep,page);
	
	draw_results_low_net_buttons(page,xx);

	exit;

	var ww = 665;
	var hh = (18*ysep)+10; 
	var scale = 0.85;



	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
           
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(0,0,room_width,yy+ysep,false);
	draw_rectangle(0,yy-(2*ysep)+hh,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);
   
	surface_reset_target();
	draw_surface(surface,0,0);
	}
	
function draw_low_net_results_content(xx,sep,sortKey,scoreKey,payoutKey) {
	
	xx += 20;
	var yy = 40;
	var height = sep*0.875;

	var prevRank = 0;
	var arr = EVENT_RESULTS.entrantResults;
	for(var i=0;i<array_length(arr);i++) {
		
		var ind = (i-results_low_net_offset);
		var yoff = (ind*sep);

		var memberStruct = arr[i];
		var winningStruct = memberStruct.eventWinnings;
		var roundStats = memberStruct.roundStats;
		var rank = roundStats.resultRanking[$ sortKey];
				
		draw_set_halign(fa_left);
		draw_text_centered(xx+10,yy+yoff,rank,height,,sep); // rank
		draw_text_centered(xx+80,yy+yoff,memberStruct.name,height,,sep); // member name
		draw_text_centered(xx+330,yy+yoff,roundStats[$ scoreKey],height,155,sep); // score
		
		draw_set_halign(fa_right);
		draw_text_centered(xx+630,yy+yoff,string(winningStruct[$ payoutKey])+" pesos",height,,sep); // payout
		
		draw_set_halign(fa_left);
		}
		
	// subtract top border
	gpu_set_blendmode(bm_subtract);
	draw_line_pixel(xx-20,0,xx-20+room_width,yy-1,c_black);
	gpu_set_blendmode(bm_normal);
	}
	
function draw_low_net_result_tables(xx,sep,page) {
	
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
	
	// scrolling
	var screenOffset = (page-results_screen)*room_width;

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
	if scr_mouse_position_room_released(0,0,700+screenOffset,room_height,mb_left,false,,can_click) {
		
		net_score_tab = (net_score_tab+1) mod 3;
		low_net_rank_sort_results();
		}
	}