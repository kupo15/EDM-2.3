function screen_entrant_details() {
	
	var xx = room_width*0.5;
	var yy = 25;
	var height = 60;
	
	draw_set_halign(fa_left);
	draw_text_centered(20,yy,"Entrant Details",height,,height);
		
	draw_home_event_type(440,yy,height);
	screen_entrant_details_content();
	screen_entrant_details_buttons();
	}
	
function draw_home_event_type(xx,yy,sep) {
	
	var height = sep*0.6;
	var col = appblue;
	var label = ["Team","Individual"];
	var str = "Event Type:  ";
	
	draw_text_centered(xx,yy,str,height,,sep);
	
	var xoff = string_width_height(str,height);
	var xpos = xx+xoff;
	var label_str = label[1];
	var ww = string_width_height(label_str,height)*1.5;
	
	draw_roundrect_color(xpos,yy,xpos+ww,yy+sep,col,col,false);

	if draw_text_button(xpos,yy,label[eventType],height,ww,sep,c_white)
	eventType = !eventType;
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
	
	var xx = 10;
	var yy = 110;
	var ww = 780;
	var height = 30;
	var sep = 50;
	var yoff = 0;
	
	var list = entrant_list;
	var offset = scrollbar_get_offset(scrollbarIndex.eventDetailsList);
	for(var i=0;i<array_length(list);i++) {

		var ind = (i-offset);
		var ypos = (yoff*sep)-(offset*sep);

		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
				
		// name
		draw_text_centered(xx,yy+ypos,string(i+1)+".",height,,sep);
		draw_member_name(xx+30,yy+ypos,memberStruct,height,,,sep,false);

		// index
		var index = memberDetails.handicapIndex;
		var str = pick("None",string(index),index!=undefined);
		var col = pick(c_black,appblue,!memberDetails.handicapSet);
				
		draw_text_centered(xx+440,yy+ypos,"HCP: "+str,height,,sep,col);
		
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
		
		yoff++;
		}
		
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarIndex.eventDetailsList,,can_click);
	}