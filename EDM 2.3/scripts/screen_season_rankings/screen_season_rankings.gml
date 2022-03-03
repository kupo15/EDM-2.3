function screen_season_rankings() {

	draw_season_ranking_content();
	}

function draw_season_ranking_content() {
	
	var ww = 600;
	var xx = (room_width-ww)*0.5;
	var yy = 100;
	var hh = room_height-yy;
	var height = 35;
	var sep = 40;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	draw_text_centered(xx,yy-sep,"Season Ranking",height,ww,sep,appblue);
	
	var yoff = 0;
	var offset = scrollbar_get_offset(scrollbarIndex.seasonRanking);
	var list = MEMBERS_LIST.list;
	var size = array_length(list);
	for(var i=0;i<size;i++) {
		
		var ypos = (yoff*sep)-(offset*sep);
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		var memberStats = memberStruct.memberStats;
		var seasonTotals = memberStats.seasonEarnings;
		
		if (memberStats.seasonEarningsPrev == undefined)
		continue;
		
		draw_text_centered(xx+15,yy+ypos,memberDetails.fullName,height,,sep); // name
		
		var col = pick(c_black,c_red,seasonTotals < 0);
		
		draw_set_halign(fa_right);
		draw_text_centered(xx+ww-15,yy+ypos,string(seasonTotals)+" "+CURRENCY_SYMBOL,height,,sep,col); // amount
		
		draw_line_pixel(xx+15,yy+ypos+sep,ww-15,1,,0.3);
		
		if draw_icon_click(,,xx,yy+ypos,ww,sep)
		{}
		
		draw_set_halign(fa_left);
		
		yoff++;
		}
		
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarIndex.seasonRanking,,,yoff);
	}
