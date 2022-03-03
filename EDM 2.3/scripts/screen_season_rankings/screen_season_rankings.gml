function screen_season_rankings() {

	var deleteSeason = draw_season_ranking_delete_season();
	draw_season_ranking_content(deleteSeason);
	draw_season_rank_buttons();
	}
	
function draw_season_rank_buttons() {
	
	
	}
	
function draw_season_ranking_delete_season() {
	
	var xx = 20;
	var yy = 500;
	var ww = 200;
	var hh = 80;

	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	var height = 35;
	var _col = pick(c_black,c_red,!season_delete_safty);

	draw_set_halign(fa_left);
	draw_text_centered(xx,yy,"Delete Season",height,ww,hh,_col);
	draw_text_centered(xx,yy,"(tap twice)",height*0.6,ww,hh*1.65);

	// delete season data
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true) {
		
	    if !season_delete_safty {
			
			scr_season_ranking_delete_data();
			return true;
			}
	    else
	    season_delete_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	season_delete_safty = true;  
	
	return false;
	}

function draw_season_ranking_content(deleteSeason) {
	
	var ww = 600;
	var xx = (room_width-ww+250)*0.5;
	var yy = 100;
	var hh = room_height-yy;
	var height = 35;
	var sep = 40;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	draw_text_centered(xx,yy-50,"Season Ranking",50,ww,sep,appblue);
	
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
		
		if deleteSeason {
			
			memberStruct.memberStats = new MemberStats();
			continue;
			}
		
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
