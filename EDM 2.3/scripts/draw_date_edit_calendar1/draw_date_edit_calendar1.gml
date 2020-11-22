function draw_date_edit_calendar1() {
	draw_set_halign(fa_center);

	var xx = app_width/2;
	var yy = 20;
	var height = 80;

	draw_text_height(xx,yy,"Round Date",height);
	draw_text_height_ext(xx,yy+80,date_pointer[| score_data.course],0,-1,500,50,false);

	var datetime = date_create_datetime(year_offset_end,floor(month_offset_end),1,0,0,0);
	var day_num = date_days_in_month(datetime);
	var start_day = date_get_weekday(datetime);

	var xx = 20;
	var yy = 225;
	var xsep = 72;
	var ysep = 85;

	draw_set_halign(fa_center);
	var month_disp = funct_convert_date(floor(month_offset_end)-1,true,-1,-1);
	draw_text_height(room_width*0.5,yy-15,string(month_disp)+" "+string(year_offset_end),70); // draw month

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
	//var pos_start = month_offset;
	//var pos_end = month_
	//for(var ii=-1;ii<2;ii++) // draw three months
	for(var i=start_day;i<day_num+start_day;i++)
		{
		var off_pos = month_offset_end-1;
		var yoff = floor(i/7);
		draw_text_height(xx+(xsep*0.5)+((i mod 7)*xsep)+(off_pos*room_width),yy+20+ysep+(yoff*ysep),i-start_day+1,50);
	
		if (i-start_day+1) == day_offset_end
			{
			draw_set_alpha(0.3);
			draw_circle_color(xx+(xsep*0.5)+((i mod 7)*xsep)+(off_pos*room_width),yy+(ysep*0.5)+ysep+(yoff*ysep),xsep*0.5,c_aqua,c_aqua,false);
			draw_set_alpha(1);
			}
	
		if click_region_released(xx+((i mod 7)*xsep)+(off_pos*room_width),yy+ysep+(yoff*ysep),xsep,ysep,true,navbar.hidden)
		day_offset_end = i-start_day+1;
		}

	month_offset_end += funct_mouse_wheel(1);
	year_offset_end += funct_mouse_wheel(1) && keyboard_check(vk_space);

	// scrolling
	var offset_start_pointer = [self,"month_offset_start"];
	var offset_pointer = [self,"month_offset_end"];
	var scrollbar_index = 0;
	var submenu = 0;

	funct_screen_scrolling(xx,yy,7*xsep,6*ysep,7*xsep,300,1,offset_start_pointer,offset_pointer,scrollbar_index,submenu);


	if month_offset_end < 0
	month_offset_end = 0;

	

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


	if androidBack
	    {
		if submit
		date_pointer[| score_data.date] = date_create_datetime(year_offset_end,month_offset_end,day_offset_end,1,1,1); // save date
	
	    screen_goto_prev(navbar.main);
		date_pointer = noone;
		app_save;
	    }
	
	
	exit;
	var rows = 3;
	var sep = 80;

#region Month
	var list_size = 14;
	var xx = 25;
	var yy = 400;
	var ww = 170;
	var hh = rows*sep;
	var target = 70;
	var xoff = ww/2;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	// draw month
	var pos_start = floor(month_offset);
	var pos_end = min(pos_start+4,list_size);
	for(var i=pos_start;i<pos_end;i++)
		{
		var off_pos = i-month_offset;
		var value = funct_convert_date(i-1,false,-1,-1);
	
		draw_text_height(xx+xoff,yy+(off_pos*sep),value,target)
	
		if click_region_released_clamp(xx,yy,off_pos*sep,ww,sep,hh,mb_left,c_yellow,0)
		month_offset_end = clamp(i-1,0,list_size-3);
		}
	
	// scrolling
	var offset_start_pointer = [self,"month_offset_start"];
	var offset_pointer = [self,"month_offset"];
	var scrollbar_index = 0;
	var submenu = 0;

	funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,submenu);

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
		&& month_offset != month_offset_end
		month_offset = lerp(month_offset,month_offset_end,0.1);
		}
	else
	month_offset_end = month_offset;


	//draw_text_height(xx+20,430,month_offset_end,0,target,false);
	//draw_text_height(xx+20,480,month_offset,0,target,false);
	//draw_text_height(xx+20,530,month_offset_start,0,target,false);
#endregion
#region Day
	var datetime = date_create_datetime(round(year_offset),round(month_offset+1),5,current_hour,current_minute,current_second);
	var list_size = date_days_in_month(datetime)+2;

	xx += ww;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	// draw day
	var pos_start = floor(day_offset);
	var pos_end = min(pos_start+4,list_size);
	for(var i=pos_start;i<pos_end;i++)
		{
		var off_pos = i-day_offset;
		var value = i;
	
	
		draw_text_height(xx+xoff,yy+(off_pos*sep),value,target)
	
		if click_region_released_clamp(xx,yy,off_pos*sep,ww,sep,hh,mb_left,c_yellow,0)
		day_offset_end = clamp(i-1,0,list_size-3);
		}
	
	// scrolling
	var offset_start_pointer = [self,"day_offset_start"];
	var offset_pointer = [self,"day_offset"];
	var scrollbar_index = 1;
	var submenu = 0;

	funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,submenu);

	if mouse_check_button_released(mb_left) && scrollbar_speed[scrollbar_index] == 0
		{
		var dir = sign(day_offset-day_offset_start);
	
		if dir == 1
		day_offset_end = ceil(day_offset);
		else if dir == -1
		day_offset_end = floor(day_offset);
		}

	if !mouse_check_button(mb_left)
		{
		if sign(scrollbar_speed[scrollbar_index]) == -1
		day_offset_end = ceil(day_offset);
		else if sign(scrollbar_speed[scrollbar_index]) == 1
		day_offset_end = floor(day_offset);
	
		day_offset_end = clamp(day_offset_end,0,list_size-3);
	
		// align
		if abs(scrollbar_speed[scrollbar_index]) == 0
		&& day_offset != day_offset_end
		day_offset = lerp(day_offset,day_offset_end,0.1);
		}
	else
	day_offset_end = day_offset;


	// draw_text_height(xx+20,430,day_offset_end,0,target,false);
	// draw_text_height(xx+20,480,day_offset,0,target,false);
	// draw_text_height(xx+20,530,day_offset_start,0,target,false);
#endregion
#region Year
	var list_size = 3000;
	xx += ww;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	// draw year
	var pos_start = floor(year_offset);
	var pos_end = min(pos_start+4,list_size);
	for(var i=pos_start;i<pos_end;i++)
		{
		var off_pos = i-year_offset;
		var value = i-1;
	
		draw_text_height(xx+xoff,yy+(off_pos*sep),value,target);
	
		if click_region_released_clamp(xx,yy,off_pos*sep,ww,sep,hh,mb_left,c_yellow,0)
		year_offset_end = clamp(i-1,0,list_size-3);
		}
	
	// scrolling
	var offset_start_pointer = [self,"year_offset_start"];
	var offset_pointer = [self,"year_offset"];
	var scrollbar_index = 2;
	var submenu = 0;

	funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,offset_start_pointer,offset_pointer,scrollbar_index,submenu);

	if mouse_check_button_released(mb_left) && scrollbar_speed[scrollbar_index] == 0
		{
		var dir = sign(year_offset-year_offset_start);
	
		if dir == 1
		year_offset_end = ceil(year_offset);
		else if dir == -1
		year_offset_end = floor(year_offset);
		}

	if !mouse_check_button(mb_left)
		{
		if sign(scrollbar_speed[scrollbar_index]) == -1
		year_offset_end = ceil(year_offset);
		else if sign(scrollbar_speed[scrollbar_index]) == 1
		year_offset_end = floor(year_offset);
	
		year_offset_end = clamp(year_offset_end,0,list_size-3);
	
		// align
		if abs(scrollbar_speed[scrollbar_index]) == 0
		&& year_offset != year_offset_end
		year_offset = lerp(year_offset,year_offset_end,0.1);
		}
	else
	year_offset_end = year_offset;

	if year_offset_end < 1970
	year_offset_end = 1970;

	if year_offset < 1970
	year_offset = 1970;

	// draw_text_height(xx+20,430,year_offset_end,0,target,false);
	// draw_text_height(xx+20,480,year_offset,0,target,false);
	// draw_text_height(xx+20,530,year_offset_start,0,target,false);
#endregion


	// dull outer indices
	var col = make_color_rgb(240,240,240);

	draw_set_alpha(0.7);
	draw_rectangle_color(25,yy,xx+ww,yy+sep,col,col,col,col,false);
	draw_rectangle_color(25,yy+(2*sep),xx+ww,yy+(3*sep),col,col,col,col,false);
	draw_set_alpha(1);

	// white out overflow
	var col = c_white;
	draw_rectangle_color(25,yy-sep,xx+ww,yy,col,col,col,col,false);
	draw_rectangle_color(25,yy+(3*sep),xx+ww,yy+(4*sep),col,col,col,col,false);


}
