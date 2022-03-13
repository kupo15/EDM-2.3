function screen_season_rankings() {

	var deleteSeason = draw_season_ranking_delete_season();
	draw_season_ranking_content(deleteSeason);
	draw_season_rank_buttons();
	}
	
function draw_season_rank_buttons() {
	
	// hide inactive
	var xx = 30;
	var yy = 310;
	var ww = 300;
	var hh = 50;
	var height = 35;
	
	var hideMembers = SETTINGS.seasonRankHideInactive;	
	draw_icon(ico_checkbox,hideMembers,xx,yy,36,hh);
	
	draw_text_centered(xx+50,yy,"Hide Inactive",height,,hh);
	
	if draw_icon_click(,,xx-20,yy,ww,hh)
	SETTINGS.seasonRankHideInactive = !hideMembers;
	
	// sort list
	var xx = 20;
	var yy = 100;
	var ww = 250;
	var hh = 80;
	var height = 35;
	var col = c_green;
	
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,true);
	
	if draw_text_button(xx,yy,"Sort List",height,ww,hh)
	array_sort_struct(MEMBERS_LIST.list,"seasonEarnings",false,["memberStats"]);
	
	// print season
	var xx = 20;
	var yy = 200;
	var ww = 250;
	var hh = 80;
	var height = 35;
	var col = c_green;
	
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,true);
	
	if draw_text_button(xx,yy,"Print Season",height,ww,hh)
	{}
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
	var sep = 50;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	draw_text_centered(xx,yy-50,"Season Ranking",50,ww,sep,appblue);
	
	var yoff = 0;
	var scroll_xx = 0;
	var scroll_yy = 0;
	var scrollEnum = scrollbarIndex.seasonRanking;
	
	scrollbar_set_surface(scrollEnum,ww,hh);
	
	var offset = scrollbar_get_offset(scrollEnum);
	var list = MEMBERS_LIST.list;
	var size = array_length(list);
	for(var i=0;i<size;i++) {
		
		var ypos = (yoff*sep)-(offset*sep);
		
		var memberStruct = list[i];
		
		if deleteSeason
		memberStruct.memberStats = new MemberStats();
		
		var memberDetails = memberStruct.memberDetails;
		var memberStats = memberStruct.memberStats;
		var seasonTotals = memberStats.seasonEarnings;
		var inactive = (memberStats.seasonEarningsPrev == Undefined);
				
		if inactive && SETTINGS.seasonRankHideInactive
		continue;
		
		var col = pick(c_black,c_gray,inactive);
		var font = pick(fn_normal,fn_italic,inactive);
		
		draw_set_font(font);
		draw_text_centered(scroll_xx+15,scroll_yy+ypos,memberDetails.fullName,height,,sep,col); // name
		
		var col = pick(col,c_red,seasonTotals < 0);
		
		draw_set_halign(fa_right);
		draw_text_centered(scroll_xx+ww-15,scroll_yy+ypos,string(seasonTotals)+" "+CURRENCY_SYMBOL,height,,sep,col); // amount
		
		draw_line_pixel(scroll_xx+15,scroll_yy+ypos+sep,ww-15,1,,0.3);

		// clicked on member
		if draw_icon_click(,,xx,yy+ypos,ww,sep,,,,,,,xx,yy)
		init_keypad(entryType.seasonEarnings,seasonTotals,,,,,,,,,i);
				
		draw_set_halign(fa_left);
		
		yoff++;
		}
		
	draw_set_font(fn_normal);
	
	scrollbar_draw_surface(scrollEnum,xx,yy);
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarIndex.seasonRanking,,,yoff);
	}
