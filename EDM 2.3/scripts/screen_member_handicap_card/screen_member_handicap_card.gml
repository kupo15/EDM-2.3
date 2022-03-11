function screen_member_handicap_card() {

	var memberStruct = MEMBERS_LIST.list[manageMemberIndex];

	draw_handicap_card_header(memberStruct);
	draw_handicap_card_contents(memberStruct);
	}
	
function draw_handicap_card_header(memberStruct) {
	
	var xx = 0;
	var yy = 150;
	
	draw_line_pixel(xx,yy,room_width,1);
		
	// draw date
	var xx = 930;
	var height = 35;
	var month = funct_convert_month(current_month,false);
	var date_str = month+" "+string(current_day)+", "+string(current_year);

	draw_set_font(fn_italic);
	draw_text_centered(xx,yy-height,date_str,height,,,c_gray);
	
	draw_set_font(fn_normal);

	var memberDetails = memberStruct.memberDetails;

	// draw low index
	var xx = 0;
	var height = 40;
	var str = pick(memberDetails.handicapLowIndex,"N/A",memberDetails.handicapLowIndex==undefined);

	draw_set_halign(fa_left);
	draw_text_centered(xx+15,yy-height,"Low Index: "+string(str),height);
	
	// draw index
	var xx = 0;
	var height = 40;
	var str = pick(memberDetails.handicapIndex,"N/A",memberDetails.handicapIndex==undefined);

	draw_set_halign(fa_left);
	draw_text_centered(xx+15,yy-height-height,"Index: "+string(str),height);
	
	// draw name
	var xx = room_width*0.5;
	var yy = 60;
	var height = 70;

	draw_set_halign(fa_center);
	draw_text_height(xx,yy,memberDetails.fullName,height);
	
	draw_set_halign(fa_left);
	
	// draw logo
	var size = 90;
	var xx = 0;
	var yy = 0;
	
	//draw_sprite_stretched(spr_logo,0,xx,yy,size,size);
	}

function draw_handicap_card_contents(memberStruct) {
	
	var scoreHistory = memberStruct.roundHistory;
	
	var xx = 15;
	var yy = 160;
	var height = 27;
	var col = 4;
	var row = 5;
	
	var hsep = room_width/col
	var ysep = (room_height-150)/row;
	
	for(var i=0;i<array_length(scoreHistory);i++) {
		
		var struct = scoreHistory[i];
		var date = struct.roundDate;
		var grossAdj = struct.adjustedGross;
		
		var xoff = (floor(i/row)*hsep);
		var yoff = ((i mod row)*ysep);
	
		// horizontal lines
		if (i < row) && (i mod 2 == 0)
		draw_line_pixel(0,150+yoff,room_width,ysep,appblue,0.3);
	
		// draw date
		var month = date_get_month(date);
		var day = date_get_day(date);
		var year = date_get_year(date);
		var date_str = string(month)+"/"+string(day)+"/"+string(year);
	
		draw_set_halign(fa_left);
		draw_text_centered(xx+xoff,yy+yoff,date_str,height);
		
		// draw adjDiff
		draw_text_centered(xx+xoff,yy+yoff+35,"Adj. Diff: "+handicap_index_format_string(struct.differentialAdjusted),height*0.9);
		
		// draw score
		var str = pick("","*",struct.includedIndex);
		
		draw_set_halign(fa_right);
		draw_text_centered(xx+xoff+hsep-30,yy+yoff+35,str+string(grossAdj),height*1.4);
		
		// vertical lines
		if ((i mod row) == 0)
		draw_line_pixel(hsep+xoff,yy,2,hsep*row,c_gray);
		}
		
	draw_set_halign(fa_left);
	}