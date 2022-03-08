function screen_entrant_details() {
	
	var xx = room_width*0.5;
	var yy = 60;
	var height = 60;
	
	draw_set_halign(fa_center);
	draw_text_height(xx,yy,"Entrant Details",height);
	
	draw_set_halign(fa_left);
	
	screen_entrant_details_content();
	screen_entrant_details_buttons();
	}
	
function screen_entrant_details_buttons() {

	draw_button_start_event();
	
	// back
	var xx = 820;
	var yy = 380;
	var ww = 190;
	var hh = 90;
	var height = 33;

	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // draw outline
	
	if draw_text_button(xx,yy,"Back",height,ww,hh)
    screen_back();
	}
	
function screen_entrant_details_content() {
	
	var can_click = !TEELIST_ACTIVE && !KEYPAD_ACTIVE;
	var can_create = true;
	
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
		
		if memberDetails.handicapSet
		continue;
		
		// name
		draw_member_name(xx,yy+ypos,memberStruct,height,,,sep,false);

		// index
		var index = memberDetails.handicapIndex;
		var str = pick("None",string(index),index!=undefined);
		
		if (str == "None")
		can_create = false;
		
		draw_text_centered(xx+440,yy+ypos,"HCP: "+str,height,,sep);
		
		if draw_text_button(xx+430,yy+ypos,"",sep,150,sep,,,,true,can_click)
		init_keypad(entryType.handicapOverride,index,,,,,,,,,i);
		
		// draw tee
		var struct = TEE_DATA[$ memberDetails.teeColor];
		var teeStr = memberDetails.teeColor+" tees";
		
		draw_sprite_ext(ico_tee_marker,0,xx+ww-175,yy+ypos+(sep*0.5),1,1,0,struct.color,1);
		draw_text_centered(xx+ww-155,yy+ypos,teeStr,sep*0.7,,sep);
		
		if draw_text_button(xx+ww-205,yy+ypos,"",sep*0.7,220,sep,,,,,can_click)
		tee_popover_init(memberStruct,,room_height,,memberDetails.teeColor);
		
		// separator
		draw_line_pixel(xx,yy+ypos+sep,ww,1,,0.3);
		
		yoff += sep;
		}
		
	return !can_create;
	}