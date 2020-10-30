function draw_season_ranking_breakdown() {
	var not_in_menu = (season_breakdown_add_member == false && season_breakdown_date_x == noone && season_breakdown_edit_x == noone);

	// draw add event
	var xx = 200;
	var yy = 10;
	var ww = 150;
	var hh = 80;
	var ranking_hh = ds_grid_height(season_ranking_grid); // height of ranking

	draw_set_color(c_black);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	draw_set_halign(fa_left);
	var str = "Add Event";
	var _col = c_black;

	draw_text_colour(xx+10,yy+15+fn_off+5,str,_col,_col,_col,_col,0.3+(0.7*(season_ranking_grid[# 0,0] != undefined)));

	// add event
	if not_in_menu && season_ranking_grid[# 0,0] != undefined && scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
		var ranking_ww = ds_grid_width(season_ranking_grid); // width of ranking

		// resize grids
	    ds_grid_resize(season_ranking_grid,ranking_ww+1,ranking_hh); // add column to season
	    ds_grid_resize(season_ranking_usage_grid,ranking_ww+1,ranking_hh); // add column to usage
	
		// set values
		ds_grid_set_region(season_ranking_grid,ranking_ww,0,ranking_ww,ranking_hh-1,0); // set all pesos to 0
		ds_grid_set_region(season_ranking_usage_grid,ranking_ww,0,ranking_ww,ranking_hh-1,false); // set all usage to false
    
		// resize header
	    var header_hh = ds_grid_height(season_ranking_header_grid); // height of header
	    ds_grid_resize(season_ranking_header_grid,ranking_ww+1,header_hh); // add column to header
	
		var _day = "0";
		if current_day < 10
		_day += string(current_day);
		else
		_day = current_day;
	
		season_ranking_header_grid[# ranking_ww,0] = string(current_month)+"/"+string(_day); // current date
		season_ranking_header_grid[# ranking_ww,1] = "8:00"; // current time
		season_ranking_header_grid[# ranking_ww,2] = real(string(current_month)+string(_day)); // sortable date format
	
		ini_season_ranking_save();
		}

	///

	var xx = 100;
	var yy = 100;
	var cols = 8;
	var rows = 10;
	var hsep = 45;
	var xsep = 80;
	var ww = 250+(cols*xsep);
	var hh = (rows+1)*hsep;

	draw_set_halign(fa_center);
	draw_rectangle(xx,yy,xx+ww,yy+hh+90,true);

	// draw lines
	draw_set_alpha(0.5);
	for(var w=1;w<cols;w++) // loop through width
	draw_line(xx+250+(w*xsep),yy,xx+250+(w*xsep),yy+hh); // vertical line

	for(var i=0;i<rows;i++)
	draw_line(xx,yy+50+(i*hsep),xx+ww,yy+50+(i*hsep)); // horizontal line
	draw_set_alpha(1);


	var rank_hh = ds_grid_height(season_ranking_grid);
	var rank_ww = ds_grid_width(season_ranking_grid);

	var limit = min(rows,rank_hh)
	for(var i=0;i<limit;i++)
	    {
	    var col = c_black;
	    var value = season_offset+i;
	    draw_set_halign(fa_left);
    
	    if season_ranking_grid[# 0,0] != undefined
		if keyboard_check(vk_down)//*
	    draw_text_color(xx+15,yy-10+hsep+(i*hsep),season_ranking_usage_grid[# 0,value],c_red,c_red,c_red,c_red,1); // name usage//*
		else//*
	    draw_text(xx+15,yy-10+hsep+(i*hsep),season_ranking_grid[# 0,value]); // name
    
	    if season_ranking_grid[# 1,value] < 0
	    col = c_red;
    
	    var col_limit = min(cols,rank_ww);
	    for(var w=1;w<col_limit;w++) // loop through width
	        {
	        if i == 0
	        draw_text_transformed(xx+262+(w*xsep),yy-10,season_ranking_header_grid[# w+season_breakdown_offset,0],1,1,0); // header date
        
	        if season_ranking_grid[# 0,0] != undefined // if there is data
	            {
				var str = season_ranking_grid[# w+season_breakdown_offset,value]; // pesos amount
				if season_ranking_usage_grid[# w+season_breakdown_offset,value] == false // if not used
				str = "-";
			
				if keyboard_check(vk_down)//*
				str = season_ranking_usage_grid[# w+season_breakdown_offset,value]; // pesos amount//*
			
	            draw_text(xx+270+(w*xsep),yy-10+hsep+(i*hsep),str); // draw pesos
            
	            // if clicked on date
	            if i == 0 && w > 1 && not_in_menu && scr_mouse_position_room_released(xx+250+(w*xsep),yy,xsep,hsep+5,mb_left,true)
	                {
	                season_breakdown_date_x = w+season_breakdown_offset;
	                mouse_clear(mb_left);
	                }
            
	            // if clicked on pesos amount
	            if not_in_menu && scr_mouse_position_room_released(xx+250+(w*xsep),yy+50+(i*hsep),xsep,hsep,mb_left,true)
	                {
	                season_breakdown_edit_x = w+season_breakdown_offset; // assign day
	                season_breakdown_edit_y = i+season_offset; // assign name
	                mouse_clear(mb_left);
	                }
	            }
	        }
	    }
    
	// Event date
	if season_breakdown_date_x != noone
	   {
	   draw_breakdown_event_date();
	   exit;
	   }

	// Add member
	draw_set_halign(fa_left);
	var _col = make_color_rgb(98,145,242);
	draw_text_colour(xx+45,yy-10,"Add Member",_col,_col,_col,_col,1);

	if not_in_menu && scr_mouse_position_room_released(xx,yy,250+80,50,mb_left,true)
	   {
	   season_breakdown_add_member = true;
	   season_add_member_list = ds_list_create();
	   ds_list_copy(season_add_member_list,member_list); // copy entire member list
	   ds_list_sort(season_add_member_list,true);
   
	   // cull out members that are already on season grid
	   var member_list_size = ds_list_size(season_add_member_list); // get size of member list
	   for(var i=0;i<member_list_size;i++) // loop through member list copy
	   for(var ii=0;ii<rank_hh;ii++) // compare with looping through season grid
	       {
	       if season_add_member_list[| i] == season_ranking_grid[# 0,ii] // if member is already on season grid
	          {
	          season_add_member_list[| i] = "delete";
	          break;
	          }
	       }
       
	   i = 0; // reset
	   repeat member_list_size // loop through member list copy
	       {
	       if season_add_member_list[| i] == "delete"
	       ds_list_delete(season_add_member_list,i); // delete member from temp list
	       else
	       i ++;
	       }
	   }
   
	if season_breakdown_add_member
	    {
	    draw_breakdown_add_member(sprite_get_height(spr_member_button)+2);
	    exit;
	    }
    
	if season_ranking_grid[# 0,0] == undefined
	exit;
    
	if season_breakdown_edit_x != noone
	    {
	    draw_breakdown_change();
	    exit;    
	    }
    
	// scroll vertical
	if rank_hh >= rows
	    {    
	    if scr_mouse_position_room_pressed(xx,yy+10,ww,hh+80,mb_left,false,false)
	    season_offset_start = season_offset;
    
	    if scr_mouse_position_room(xx,yy+10,ww,hh+80,mb_left,false)
	        {
	        var num = 0.1;
	        var amt = (mouse_ydist*num);
	        season_offset = season_offset_start-amt;
	        season_offset = clamp(season_offset,0,rank_hh-rows);
        
	        if abs(season_offset-season_offset_start) > 0.01
	        scrollbar_disp_end = 1;
	        }
		
		draw_set_color(c_gray);
		funct_draw_scrollbar(xx,yy+50,rows,0,rank_hh,20,season_offset,hsep,0);
		draw_set_color(c_black);
	    }

	// scroll hortizontal
	if rank_ww >= cols
	    {    
	    if scr_mouse_position_room_pressed(xx,yy+10,ww,hh+80,mb_left,false,false)
	    season_breakdown_offset_start = season_breakdown_offset;
    
	    if scr_mouse_position_room(xx,yy+10,ww,hh+80,mb_left,false)
	        {
	        var num = 0.05;
	        var amt = (mouse_xdist*num);
	        season_breakdown_offset = season_breakdown_offset_start-amt;
	        season_breakdown_offset = clamp(season_breakdown_offset,0,rank_ww-cols);
        
	        if abs(season_breakdown_offset-season_breakdown_offset_start) > 0.01
	        scrollbar_disp_end = 1;
	        }
		
		draw_set_color(c_gray);
		funct_draw_scrollbar_hor(xx+330,yy+hh,cols-0.5,0,rank_ww,10,season_breakdown_offset,xsep,0);
		draw_set_color(c_black);
	    }



}
