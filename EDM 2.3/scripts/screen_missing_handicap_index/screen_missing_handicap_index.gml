function screen_missing_handicap_index() {
	
	var xx = room_width*0.5;
	var yy = 60;
	var height = 60;
	
	draw_set_halign(fa_center);
	draw_text_height(xx,yy,"Missing Handicap Index",height);
	
	draw_set_halign(fa_left);
	
	screen_missing_handicap_index_content();
	screen_missing_handicap_index_buttons();
	}
	
function screen_missing_handicap_index_buttons() {

	draw_create_teams_button(true);
	}
	
function screen_missing_handicap_index_content() {
	
	var can_click = !TEELIST_ACTIVE;
	
	var xx = 10;
	var yy = 150;
	var ww = 780;
	var height = 30;
	var sep = 50;
	var yoff = 0;
	
	var list = entrant_list;
	for(var i=0;i<array_length(list);i++) {
		
		var ypos = (yoff*sep);

		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		
		if (memberDetails.handicapIndex != undefined)
		continue;
		
		// name
		draw_member_name(xx,yy+ypos,memberStruct,height,,,sep,false);

		// index
		var str = pick("Not Set",memberDetails.handicapIndex,memberDetails.handicapIndex!=undefined);
		draw_text_centered(xx+440,yy+ypos,str,height,,sep);
		
		if draw_text_button(xx+430,yy+ypos,"",sep,130,sep,,,,true,can_click)
{}
		
		// draw tee
		var struct = TEE_DATA[$ memberDetails.teeColor];
		var teeStr = memberDetails.teeColor+" tees";
		
		draw_sprite_ext(ico_tee_marker,0,xx+ww-190,yy+ypos+(sep*0.5),1,1,0,struct.color,1);
		draw_text_centered(xx+ww-170,yy+ypos,teeStr,sep*0.7,,sep);
		
		if draw_text_button(xx+ww-220,yy+ypos,"",sep*0.7,220,sep,,,,true,can_click)
		tee_popover_init(memberStruct,,room_height,,memberDetails.teeColor);
		
		// separator
		draw_line_pixel(xx,yy+ypos+sep,ww,1,,0.3);
		
		yoff += sep;
		}
	}