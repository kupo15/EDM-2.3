function draw_edit_team_list() {
	var xx = 620;
	var yy = 20;
	var ww = sprite_get_width(spr_member_button);
	var hh = button_sep*10-12;
	var ysep = sprite_get_height(spr_member_button)+2;

	if !clicked && !scr_mouse_position_room_released(xx,yy,ww,hh+button_sep*2,noone,false) && mouse_check_button_released(mb_left)
	   {
	   edit_team_add_member = false;
	   exit;
	   }

	// draw add member
	if scr_mouse_position_room_released(xx,yy,ww,button_sep,mb_left,true)
	    {
	    edit_member = false;
	    add_member = get_string_async("Enter Member Name","");
	    }

	button_index = scr_mouse_position_room(xx,yy,ww,button_sep,mb_left,true);

	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_sprite_ext(spr_member_button,button_index,xx,yy,1,1,0,c_blue,1);
	draw_text(xx+spr_center,yy+fn_off,"Add Member");

	//
	yy += button_sep*2;

	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_gray,c_gray,c_gray,c_gray,false);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_white,c_white,c_white,c_white,true);


	var col = make_colour_rgb(255,227,215); // make_colour_rgb(69,117,228);
	draw_text_colour(xx+10+spr_center,yy-ysep+fn_off,"Member List:",col,col,col,col,1);

	// draw member list
	var list_size = ds_list_size(member_list);
	var disp_count = 6;
	var size = min(list_size,disp_count);

	funct_draw_scrollbar(xx,yy,disp_count,0,list_size,20,member_scroll_offset,ysep,0);
	for(var i=0;i<size;i++) // loop through list
	    {
	    var xx_mouse = 0;
	    var yy_mouse = 0;

	    button_index = scr_mouse_position_room(xx,yy+(i*ysep),ww,button_sep,mb_left,!deleting_member);
    
	    if scr_mouse_position_room_pressed(xx,yy+(i*ysep),ww,button_sep,mb_left,false,false) // get name slot
	        {
	        list_slot = i;
	        timer = round(room_speed*0.65);
	        }
	    else if mouse_check_button_released(mb_left) || abs(mouse_ydist) > 5
	    timer = -1;
    
	    if list_slot = i
	       {
	       button_index = 1;
	       xx_mouse = clamp(mouse_xdist,-button_ww,button_ww); // min(0,mouse_xdist);
       
	       if mouse_check_button_released(mb_left)
	           {// add to team list
	           if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,button_sep,mb_left,false)
	               {
	               if ds_list_size(team_list[edit_team_score]) < 5 // limit team size
	                  {// click name
	                  var ind = member_list[| i+member_scroll_offset]; // find name
	                  ds_list_add(entrant_list,ind); // add to entrant list
	                  ds_list_add(team_list[edit_team_score],ind); // add to team list
	                  ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
                  
	                  member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
	                  list_size --;
                  
	                  if i+member_scroll_offset < last_entrant_number // if moving last entrant number
	                  last_entrant_number = max(last_entrant_number-1,0);
                  
	                  scores_grid_add_member(ind,edit_team_score,scores_grid[# 18,edit_team_offset]);
	                  edit_team_add_member = false;
	                  }
	               }    
               
	           list_slot = noone;
	           exit;
	           }
	       } 
       
	    // scroll
	    if !deleting_member
	        {
	        if scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	        member_scroll_offset_start = member_scroll_offset;
        
	        if xx_mouse == 0 && scr_mouse_position_room(xx,yy,ww,hh,mb_left,false)
	            {
	            var amt = round(mouse_ydist*0.05);
	            member_scroll_offset = member_scroll_offset_start-amt;
	            member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count);
	            if member_scroll_offset < 0 member_scroll_offset = 0;
            
            
	            if amt != 0
	            list_slot = noone;
	            }
	        }
            
	    // draw button and members
	    var col = c_white;
	    if i+member_scroll_offset<last_entrant_number // set recent entrant button to green
	    col = c_orange;
    
	    var alph = clamp((xx_mouse)/100,0,1);
        
	    draw_set_alpha(alph)
	    if (list_slot+member_scroll_offset < last_entrant_number) // if favorites name
	        {
	        draw_sprite_ext(spr_favorites,2,xx,yy+yy_mouse+(i*ysep),1,1,0,c_white,alph); // favorites button
	        draw_text_colour(xx+100,yy-5+yy_mouse+fn_off+(i*ysep),"Remove",c_red,c_red,c_red,c_red,alph);
	        }
	    else
	        {
	        draw_sprite_ext(spr_favorites,2,xx,yy+yy_mouse+(i*ysep),1,1,0,c_white,alph); // favorites button
	        draw_text(xx-20+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),"Favorites");
	        }
	    draw_set_alpha(1);
        
	    var alph = clamp((100+xx_mouse)/100,0,1);
    
	    draw_text_colour(xx+70+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),"Delete",c_red,c_red,c_red,c_red,1-alph);
    
	    draw_set_alpha(alph);
	    draw_sprite_ext(spr_member_button,button_index,xx+xx_mouse,yy+yy_mouse+(i*ysep),1,1,0,col,alph); // draw button
	    draw_text(xx+xx_mouse+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),member_list[| i+member_scroll_offset]); // draw member name
	    draw_set_alpha(1);
	    }
    
	// sort list
	var col = make_colour_rgb(255,227,215);
	draw_text_colour(xx+35,yy-55-35,"Sort -",col,col,col,col,1);    
	if scr_mouse_position_room_released(xx-30,yy-ysep+5,ww+30,ysep-10,mb_left,true)
	scr_sort_members();
    
	// going to delete
	if list_slot != noone && abs(mouse_xdist) > 5 
	    {
	    deleting_member = true;
	    timer = -1;
	    }
    
	if timer = 0
	    {
	    edit_member_slot = list_slot+member_scroll_offset;
	    list_slot = noone;
	    edit_member = true;
	    add_member = get_string_async("Edit Member Name",member_list[| edit_member_slot]);
	    }



}
