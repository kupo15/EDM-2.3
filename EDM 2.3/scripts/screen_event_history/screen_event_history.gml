function screen_event_history() {

	var xx = 70;
	var yy = 200;
	var height = 30;
	
	var ww = 220,
	var hh = 130;
	var hsep = ww*1.2;
	var vsep = hh*1.2;
	
	var list = EVENT_HISTORY;
	for(var i=0;i<array_length(list);i++) {
		
		var xoff = (i*hsep);
		var yoff = 0; // (i*vsep);
		var eventStruct = list[i];
		
		// outline
		draw_rectangle(xx+xoff,yy+yoff,xx+ww+xoff,yy+hh+yoff,true);
		
		// draw date
		var date = eventStruct.eventDate;
		var month = funct_convert_month(date_get_month(date),true);
		var day = date_get_day(date);
		var year = date_get_year(date);
		var date_str = month+" "+string(day)+", "+string(year);
		
		if draw_text_button(xx+xoff,yy+yoff,date_str,height,ww,hh) {
		
			screen_change(screenEnum.eventMemberEdit);
			}
		}
		
	// new event
	var ww = room_width*0.7;
	var hh = 80;

	var xx = (room_width-ww)*0.5;
	var yy = room_height-20-hh;
	var height = 45;
	var col = c_green;
	
	// outline
	draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	
	if draw_text_button(xx,yy,"Create New Event",height,ww,hh,c_white) {
	
		screen_change(screenEnum.eventHistoryEdit);
		}
	}