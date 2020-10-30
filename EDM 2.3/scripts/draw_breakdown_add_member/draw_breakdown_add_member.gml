function draw_breakdown_add_member(argument0) {
	var xx = 400;
	var yy = 0;
	var disp_count = 6;
	var ww = sprite_get_width(spr_member_button);
	var hh = button_sep*disp_count-12;
	var ysep = argument0;

	draw_set_halign(fa_center);
	draw_set_font(fn_name_up);
	draw_set_color(c_white);

	//
	yy += button_sep*2;

	var _col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,_col,_col,_col,_col,false);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_white,c_white,c_white,c_white,true);


	var col = make_color_rgb(98,145,242);
	draw_text_colour(xx+10+spr_center,yy-ysep+fn_off,"Member List:",col,col,col,col,1);

	// draw member list
	var list_size = ds_list_size(season_add_member_list);
	var size = min(list_size,disp_count);

	// funct_draw_scrollbar(xx,yy,disp_count,0,list_size,30,member_scroll_offset,ysep,0);

	// click out
	if android_back || (!scr_mouse_position_room(xx-40,yy-button_sep,ww+50,hh+button_sep+20,noone,false) && !clicked && mouse_check_button_released(mb_left))
	    {
	    season_breakdown_add_member = false;
	    exit;
	    }

	draw_set_color(c_black);
	for(var i=0;i<size;i++) // loop through list
	    {
	    var xx_mouse = 0;
	    var yy_mouse = 0;
    
	    if scr_mouse_position_room_pressed(xx,yy+(i*ysep),ww,button_sep,mb_left,true,false) // get name slot
	    list_slot = i;
    
	    if list_slot = i
	       {
	       xx_mouse = clamp(mouse_xdist,-button_ww,button_ww); // min(0,mouse_xdist);
	       //if abs(xx_mouse) < 7
	       //xx_mouse = 0; 
       
	       if abs(xx_mouse) < 3 && mouse_check_button_released(mb_left)
	           { // add to season grid
	           var ind = season_add_member_list[| i+member_scroll_offset]; // find name
           
	           // add name to grid
	           var grid_ww = ds_grid_width(season_ranking_grid);
	           var grid_hh = ds_grid_height(season_ranking_grid);
           
	           if season_ranking_grid[# 0,0] == undefined
	           grid_hh --;
	           else
				   {
		           ds_grid_resize(season_ranking_grid,grid_ww,grid_hh+1); // add row to the end of breakdown
		           ds_grid_resize(season_ranking_usage_grid,grid_ww,grid_hh+1); // add row to the end of usage
				   }

	           // input player
	           season_ranking_grid[# 0,grid_hh] = ind; // add name
	           season_ranking_usage_grid[# 0,grid_hh] = ind; // add name to usage for sorting
		   		   
			   // clear new row
	           ds_grid_set_region(season_ranking_grid,1,grid_hh,grid_ww-1,grid_hh,0); // set all to breakdown 0
	           ds_grid_set_region(season_ranking_usage_grid,1,grid_hh,grid_ww-1,grid_hh,false); // set all to usage to false
		   
			   // sort list by name
	           ds_grid_sort(season_ranking_grid,0,true); // sort ABC
	           ds_grid_sort(season_ranking_usage_grid,0,true); // sort usage ABC
		   
	           ini_season_ranking_save();
           
	           ds_list_delete(season_add_member_list,i+member_scroll_offset); // delete from member list
          
	           member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
	           list_size --;
          
	           if i+member_scroll_offset < last_entrant_number // if moving last entrant number
	           last_entrant_number = max(last_entrant_number-1,0);
           
	           list_slot = noone;
	           exit;
	           }
	       } 
       
	    // scroll
	    if scr_mouse_position_room_pressed(xx-30,yy,ww+30,hh,mb_left,false,false)
	    member_scroll_offset_start = member_scroll_offset;
    
	    if xx_mouse == 0 && scr_mouse_position_room(xx-30,yy,ww+30,hh,mb_left,false)
	        {
	        var amt = round(mouse_ydist*0.05);
	        member_scroll_offset = member_scroll_offset_start-amt;
	        member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count);
	        if member_scroll_offset < 0 member_scroll_offset = 0;
        
        
	        if amt != 0
	        list_slot = noone;
	        }
            
	    // draw members
	    draw_text(xx+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),season_add_member_list[| i+member_scroll_offset]); // draw member name
	    }



}
