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
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var yoff = (i*sep);
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		var memberStats = memberStruct.memberStats;
		var seasonTotals = memberStats.seasonEarnings;
		
		draw_text_centered(xx+15,yy+yoff,memberDetails.fullName,height,,sep); // name
		
		var col = pick(c_black,c_red,seasonTotals < 0);
		draw_set_halign(fa_right);
		draw_text_centered(xx+ww-15,yy+yoff,string(seasonTotals)+" "+CURRENCY_SYMBOL,height,,sep,col); // amount
		
		draw_set_halign(fa_left);
		}
	}
