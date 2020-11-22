function draw_date_edit_calendar() {
	draw_set_halign(fa_center);

	var xx = app_width/2;
	var yy = 20;
	var height = 80;

	draw_text_height(xx,yy,"Round Date",height);
	draw_text_height_ext(xx,yy+80,date_pointer[| score_data.course],0,-1,500,50,false);

	var xx = 20;
	var yy = 225;
	var xsep = 72;
	var ysep = 85;

	if click_region_released(0,yy-20,room_width,ysep,true,navbar.hidden)
		{
		submenu = navbar.year_select;
		alpha_lerp_end = 1;
		year_select_offset = month_offset_end;
		mouse_clear(mb_left);
		}

	// draw weekdays
	for(var i=0;i<7;i++)
		{
		switch i
			{
			case 0: var str = "S"; break;
			case 1: var str = "M"; break;
			case 2: var str = "T"; break;
			case 3: var str = "W"; break;
			case 4: var str = "T"; break;
			case 5: var str = "F"; break;
			case 6: var str = "S"; break;
			}
		
		draw_text_height(xx+(xsep*0.5)+((i mod 7)*xsep),yy+65,str,35);
		}
	
	// draw month
	var pos_start = floor(month_offset);
	var pos_end = month_offset+1;
	for(var ii=pos_start;ii<pos_end;ii++) // draw three months
		{
		var off_pos = (ii-month_offset)*room_width;
	
		// update month when not holding down
		if !mouse_check_button(mb_left) 
			{
			month_parse = (floor(month_offset_end) mod 12)+1;
			year_parse = 1970+floor(month_offset_end/12);
			}

		var datetime = date_create_datetime(year_parse,month_parse,1,0,0,0);
		var day_num = date_days_in_month(datetime);
		var start_day = date_get_weekday(datetime);
	
		// draw calendar month
		var month_disp = funct_convert_date(month_parse-1,true,-1,-1);
		var year_disp = year_parse;

		if ii = pos_start
		draw_text_height(room_width*0.5,yy-15,string(month_disp)+" "+string(year_disp),70); // draw month AND year
		
		// draw calendar days
		for(var i=start_day;i<day_num+start_day;i++)
			{
			var yoff = floor(i/7);
			draw_text_height(xx+(xsep*0.5)+((i mod 7)*xsep)+off_pos,yy+20+ysep+(yoff*ysep),i-start_day+1,50);
	
			var curr_date = date_create_datetime(year_parse,month_parse,1,1,1,1); // without days
			var day_span = round(date_day_span(start_date,curr_date))+(i-start_day+1);
		
			if day_span_select == day_span //(i-start_day+1) == day_offset_end
			// if (i-start_day+1) == day_offset_end
				{
				draw_set_alpha(0.3);
				draw_circle_color(xx+(xsep*0.5)+((i mod 7)*xsep)+off_pos,yy+(ysep*0.5)+ysep+(yoff*ysep),xsep*0.5,c_aqua,c_aqua,false);
				draw_set_alpha(1);
				}
	
			if click_region_released(xx+((i mod 7)*xsep)+off_pos,yy+ysep+(yoff*ysep),xsep,ysep,true,navbar.hidden)
				{
				day_offset_end = i-start_day+1; // set day
				day_span_select = round(date_day_span(start_date,curr_date))+day_offset_end; // update day span
				}
			}
		}

	month_offset_end += funct_mouse_wheel(1);

	// scrolling
	var offset_start_pointer = [self,"month_offset_start"];
	var offset_pointer = [self,"month_offset_end"];
	var scrollbar_index = 0;
	var list_size = 3600;

	if submenu == navbar.hidden
	funct_screen_scrolling_hor(xx,yy+ysep,7*xsep,6*ysep,7*xsep,list_size,1,offset_start_pointer,offset_pointer,scrollbar_index,navbar.hidden);

	if month_offset_end < 0
	month_offset_end = 0;

	scrollbar_speed[scrollbar_index] = 0;

	if mouse_check_button_released(mb_left) && scrollbar_speed[scrollbar_index] == 0
		{
		var dir = sign(month_offset-month_offset_start);
	
		if dir == 1
		month_offset_end = ceil(month_offset);
		else if dir == -1
		month_offset_end = floor(month_offset);
		}

	if !mouse_check_button(mb_left)
		{
		if sign(scrollbar_speed[scrollbar_index]) == -1
		month_offset_end = ceil(month_offset);
		else if sign(scrollbar_speed[scrollbar_index]) == 1
		month_offset_end = floor(month_offset);
	
		month_offset_end = clamp(month_offset_end,0,list_size-3);
	
		// align
		if abs(scrollbar_speed[scrollbar_index]) == 0
			{
			if month_offset != month_offset_end
			month_offset = lerp(month_offset,month_offset_end,0.2);
			}
		}
	else
	month_offset = month_offset_end;

#region SUBMIT button
	var ww = 300;
	var hh = 130;
	var xx = room_width*0.5-(ww*0.5);
	var yy = room_height-hh;
	var xoff = ww*0.5;
	var yoff = 7;
	var col = c_white;

	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false); // draw button

	// draw Submit button
	draw_set_halign(fa_center);

	var str = "Submit";
	draw_text_height(xx+xoff,yy+yoff,str,90);

	var submit = false;
	if click_region_released(0,yy,room_width,hh,true,navbar.hidden)
		{
		submit = true;
		androidBack = true;
		}

#endregion

	draw_year_select();

	if androidBack
	    {
		if submit
			{
			var year = 1970+floor(month_offset_end/12);
			var month = (month_offset_end mod 12)+1;		
			var day = day_offset_end;
		
			date_pointer[| score_data.date] = date_create_datetime(year,month,day,1,1,1); // save date
			app_save;
			}
	
		// year select
		if submenu == navbar.year_select
			{
			submenu = navbar.hidden;
			alpha_lerp_end = 0;
			}
		else
			{
		    screen_goto_prev();
			date_pointer = noone;
			}
	    }


}
