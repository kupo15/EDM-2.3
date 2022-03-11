function screen_entrant_details() {
	
	var can_click = !TEELIST_ACTIVE && !KEYPAD_ACTIVE;
	
	var xx = 20;
	var yy = 25;
	var height = 60;
	
	draw_set_halign(fa_left);
	draw_text_centered(xx,yy,"Entrant Details",height,,height);
		
	draw_event_type(440,yy,height);
	screen_entrant_details_content(can_click);
	screen_entrant_details_buttons(can_click);
	}
	
function draw_event_type(xx,yy,sep) {
	
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
	
function draw_button_start_event(can_click) {
	
	var xx = 820;
	var yy = 500;
	var ww = 190;
	var hh = 90;
	var height = 33;
	
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,false); // draw outline
	
	if (draw_text_button(xx,yy,"Start Event",height,ww,hh,c_white,,,,can_click) || keyboard_check_pressed(vk_enter)) {
		
		skins_input = true;
		screen_change(screenEnum.eventRunning);
		scr_sort_members(MEMBERS_LIST.list);
		}
	}
	
function screen_entrant_details_buttons(can_click) {

	draw_button_start_event(can_click);
	
	// back
	var xx = 820;
	var yy = 380;
	var ww = 190;
	var hh = 90;
	var height = 33;

	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true); // draw outline
	
	if draw_text_button(xx,yy,"Back",height,ww,hh,,,,,can_click)
	screen_back();
	}
	
function screen_entrant_details_content(can_click) {
	
	var xx = 10;
	var yy = 110;
	var ww = 780;
	var sep = 55;
	var height = sep*0.6;
	var yoff = 0;
	
	var scroll_xx = 0;
	var scroll_yy = 0;
	var scrollEnum = scrollbarIndex.eventDetailsList;
	scrollbar_set_surface(scrollEnum,ww,room_height-yy);
	
	var offset = scrollbar_get_offset(scrollEnum);
	var list = entrant_list;
	for(var i=0;i<array_length(list);i++) {

		var ind = (i-offset);
		var ypos = (yoff*sep)-(offset*sep);

		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
				
		// name
		draw_text_centered(scroll_xx,scroll_yy+ypos,string(i+1)+".",height,,sep);
		draw_member_name(scroll_xx+30,scroll_yy+ypos,memberStruct,height,,,sep,false);

		// index
		var index = memberDetails.handicapIndex;
		var str = pick("None",string(index),index!=undefined);
		var col = pick(c_black,appblue,!memberDetails.handicapSet);
				
		draw_text_centered(scroll_xx+420,scroll_yy+ypos,"Index: "+str,height,,sep,col);
		
		if draw_icon_click(,,xx+410,yy+ypos,170,sep,,,,can_click,true,,xx,yy)
		//if draw_text_button(xx+430,yy+ypos,"",sep,150,sep,,,,true,can_click)
		init_keypad(entryType.handicapOverride,index,,,,,,,,,i);
		
		// draw tee
		var struct = TEE_DATA[$ memberDetails.teeColor];
		var teeStr = memberDetails.teeColor+" tees";
		
		draw_sprite_ext(ico_tee_marker,0,scroll_xx+ww-175,scroll_yy+ypos+(sep*0.5),1,1,0,struct.color,1);
		draw_text_centered(scroll_xx+ww-155,scroll_yy+ypos,teeStr,sep*0.7,,sep);
		
		if draw_icon_click(,,xx+ww-205,yy+ypos,220,sep,,,,can_click,,,xx,yy)
		//if draw_text_button(xx+ww-205,yy+ypos,"",sep*0.7,220,sep,,,,,can_click)
		tee_popover_init(memberStruct,380,room_height,,memberDetails.teeColor);
		
		// separator
		draw_line_pixel(scroll_xx,scroll_yy+ypos+sep,ww,1,,0.3);
		
		yoff++;
		}
		
	scrollbar_draw_surface(scrollEnum,xx,yy);
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarIndex.eventDetailsList,,can_click);
	}