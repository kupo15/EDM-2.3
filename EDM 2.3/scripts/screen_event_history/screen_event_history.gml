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
		
		if draw_text_button(xx+xoff,yy+yoff,date_str,height,ww,hh)
		{}
		
		}
	}