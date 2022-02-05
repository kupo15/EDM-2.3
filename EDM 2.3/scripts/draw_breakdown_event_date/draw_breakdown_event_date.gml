function draw_breakdown_event_date() {
	var xx = 100;
	var yy = 100;
	var ww = 800;
	var hh = 400;
	var ysep = 35;

	draw_set_color(c_black);

	// click out / cancel
	if !edit_event && (android_back || (!scr_mouse_position_room(xx,yy,ww,hh,noone,true) && mouse_check_button_released(mb_left)))
	    {
	    season_breakdown_date_x = noone;
	    exit;
	    }

	// draw background rectangle
	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);
	
	draw_set_halign(fa_left);
	draw_text(xx+100,yy+20+fn_off,"EVENT DATE:");
	
	draw_set_font(fn_keyboard);
	draw_text(xx+120,yy+30+30,season_ranking_header_grid[# season_breakdown_date_x,0] + " - "+ string(season_ranking_header_grid[# season_breakdown_date_x,1])); // Draw event date

	if edit_event
		{	
		// click out / cancel
		if (android_back || ((abs(global.mouse_xdist) < 2) && abs(global.mouse_ydist) < 2 && !scr_mouse_position_room(xx,yy,ww,hh,noone,false) && mouse_check_button_released(mb_left)))
		    {
		    edit_event = false;
		    exit;
		    }
	
		// edit event
		var xx = 180;
		var yy = 250;
		var ww = 180;
		var hh = 500;
		var ysep = 50;
	
		draw_text(xx,yy,"Month");
		for(var i=0;i<3;i++)
		if (i+edit_event_month_offset > 0) && (i+edit_event_month_offset < 13)
			{
			var date_ = edit_event_month_offset+i;
			var str_date = funct_convert_date(date_-1);
		
			draw_set_alpha(0.1+((i==1)*0.9));
			draw_text(xx+30,yy+50+(i*ysep),str_date);
			}
	
		draw_set_alpha(1);
		// scroll vertical
	    if edit_event_scrolling = noone && scr_mouse_position_room_pressed(xx-30,yy+10,ww,hh+80,mb_left,false,true)
			{
			edit_event_scrolling = 0;
		    edit_event_month_offset_start = edit_event_month_offset;
			}
		else if mouse_check_button_released(mb_left)
		edit_event_scrolling = noone;
    
	    if edit_event_scrolling = 0 && scr_mouse_position_room(xx-30,yy-250,ww,hh+180,mb_left,false)
	        {
	        var num = 0.1;
	        var amt = (global.mouse_ydist*num);
	        edit_event_month_offset = edit_event_month_offset_start-amt;
	        edit_event_month_offset = floor(clamp(edit_event_month_offset,0,11));
        
	      //  if abs(season_offset-season_offset_start) > 0.01
	      //  scrolling = true;
	        }
		
		// draw day
		xx += 100;
	
		draw_text(xx+80,yy,"Day");
		for(var i=0;i<3;i++)
		if (i+edit_event_day_offset > 0) && (i+edit_event_day_offset < 32)
			{
			draw_set_alpha(0.1+((i==1)*0.9));
			draw_text(xx+120,yy+50+(i*ysep),edit_event_day_offset+i);
			}
	
		draw_set_alpha(1);
		// scroll vertical
	    if edit_event_scrolling = noone && scr_mouse_position_room_pressed(xx+50,yy+50,ww-20,hh+80,mb_left,false,true)
			{
			edit_event_scrolling = 1;
		    edit_event_day_offset_start = edit_event_day_offset;
			}
		else if mouse_check_button_released(mb_left)
		edit_event_scrolling = noone;
    
	    if edit_event_scrolling = 1 && scr_mouse_position_room(xx+50,yy-250,ww+10,hh+180,mb_left,false)
	        {
	        var num = 0.1;
	        var amt = (global.mouse_ydist*num);
	        edit_event_day_offset = edit_event_day_offset_start-amt;
	        edit_event_day_offset = floor(clamp(edit_event_day_offset,0,30));
        
	      //  if abs(season_offset-season_offset_start) > 0.01
	      //  scrolling = true;
	        }
	
		// draw time
		xx += 350;
		draw_text(xx,yy,"Time");
		for(var i=0;i<3;i++)
		if (i+edit_event_time_offset > 0) && (i+edit_event_time_offset < 25)
			{
			draw_set_alpha(0.1+((i==1)*0.9));
			draw_text(xx,yy+50+(i*ysep),string(edit_event_time_offset+i-1)+":00");
			}
	
		draw_set_alpha(1);
		// scroll vertical
	    if edit_event_scrolling = noone && scr_mouse_position_room_pressed(xx-30,yy+50,ww,hh+80,mb_left,false,true)
			{
			edit_event_scrolling = 2;
		    edit_event_time_offset_start = edit_event_time_offset;
			}
		else if mouse_check_button_released(mb_left)
		edit_event_scrolling = noone;
    
	    if edit_event_scrolling = 2 && scr_mouse_position_room(xx-30,yy-250,ww+30,hh+180,mb_left,false)
	        {
	        var num = 0.1;
	        var amt = (global.mouse_ydist*num);
	        edit_event_time_offset = edit_event_time_offset_start-amt;
	        edit_event_time_offset = floor(clamp(edit_event_time_offset,0,23));
        
	      //  if abs(season_offset-season_offset_start) > 0.01
	      //  scrolling = true;
	        }
		
		// Confirm
		var xx = 600;
		var yy = 130; 
		var ww = 800;
		var hh = 400;
		var confirm = edit_event_scrolling = noone && scr_mouse_position_room_released(xx,yy,220,100,mb_left,true);    

		draw_rectangle(xx,yy,xx+220,yy+100,true);

		var col = make_colour_rgb(69,117,228);
		draw_text_colour(xx+20,yy+20,"Confirm",col,col,col,col,1);
	
		// save date/time
		if confirm
			{
			var _day = "0";
			if edit_event_day_offset+1 < 10
			_day += string(edit_event_day_offset+1);
			else
			_day = edit_event_day_offset+1;
		
			season_ranking_header_grid[# season_breakdown_date_x,0] = string(edit_event_month_offset+1)+"/"+string(_day); // save date
			season_ranking_header_grid[# season_breakdown_date_x,1] = string(edit_event_time_offset)+":00"; // save time
			season_ranking_header_grid[# season_breakdown_date_x,2] = string(edit_event_month_offset+1)+string(_day); // save date/time sortable format
			season_ranking_header_grid[# season_breakdown_date_x,2] = real(season_ranking_header_grid[# season_breakdown_date_x,2]); // convert to number
		
			scr_sort_season_breakdown();
			ini_season_ranking_save();
			season_breakdown_date_x = noone;
			edit_event = false;
			}
		}
	else
		{
		yy -= 50;
		var cancel = scr_mouse_position_room_released(xx+150,yy+hh-110,220,100,mb_left,true);    

		draw_rectangle(xx+150,yy+hh-110,xx+150+220,yy+hh-10,true);

		var col = make_colour_rgb(69,117,228);
		draw_text_colour(xx+155,yy+hh-90,"CANCEL",col,col,col,col,1);

		xx += 300;

		var delete_ = scr_mouse_position_room_released(xx+150,yy+hh-110,220,100,mb_left,true);    

		draw_rectangle(xx+150,yy+hh-110,xx+150+220,yy+hh-10,true);

		var col = make_colour_rgb(69,117,228);
		draw_text_colour(xx+160,yy+hh-90,"DELETE",col,col,col,col,1);

		// edit date/time
		var xx = 600;
		var yy = 130;
		var edit_dt = scr_mouse_position_room_released(xx,yy,220,100,mb_left,true);    

		var col = make_colour_rgb(69,117,228);
		draw_text_ext_transformed_colour(xx+20,yy+5,"EDIT\nEVENT",50,-1,0.9,0.9,0,col,col,col,col,1);
		draw_rectangle(xx,yy,xx+220,yy+100,true);

		if edit_dt
			{
			edit_event_month_offset = current_month-1;
			edit_event_day_offset = current_day-1;
			edit_event_time_offset = 8;
			edit_event = true;
			}
		else if cancel
		season_breakdown_date_x = noone;
		else
		if delete_
		   {
		   // adjust header	
		   var grid_ww = ds_grid_width(season_ranking_header_grid);
		   var grid_hh = ds_grid_height(season_ranking_header_grid);
   
		   ds_grid_set_grid_region(season_ranking_header_grid,season_ranking_header_grid,season_breakdown_date_x+1,0,grid_ww-1,grid_hh-1,season_breakdown_date_x,0); // shift left
		   ds_grid_resize(season_ranking_header_grid,grid_ww-1,grid_hh);   
   
		   // adjust breakdown	
		   var grid_ww = ds_grid_width(season_ranking_grid);
		   var grid_hh = ds_grid_height(season_ranking_grid);
   
		   // shift left
		   ds_grid_set_grid_region(season_ranking_grid,season_ranking_grid,season_breakdown_date_x+1,0,grid_ww-1,grid_hh-1,season_breakdown_date_x,0); // shift breakdown left
		   ds_grid_set_grid_region(season_ranking_usage_grid,season_ranking_usage_grid,season_breakdown_date_x+1,0,grid_ww-1,grid_hh-1,season_breakdown_date_x,0); // shift usage left
	   
		   // delete last column
		   ds_grid_resize(season_ranking_grid,grid_ww-1,grid_hh); // from breakdown
		   ds_grid_resize(season_ranking_usage_grid,grid_ww-1,grid_hh); // from usage
   
		   ini_season_ranking_save();
   
		   season_breakdown_date_x = noone; // reset
		   }
		}




}
