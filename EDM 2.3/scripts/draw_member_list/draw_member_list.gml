function draw_member_list(argument0) {
	
	draw_set_halign(fa_left);
	draw_text_transformed(10,573,"Version: "+string(GM_version),0.5,0.5,0);

	draw_set_halign(fa_center);

	var xx = 40;
	var yy = 0;
	var disp_count = 6;
	var ww = sprite_get_width(spr_member_button);
	var hh = button_sep*disp_count-12;
	var ysep = argument0;

	if keyboard_check_pressed(vk_tab)
	debug = !debug;
	if debug draw_circle(15,580,5,false);

	draw_set_font(fn_name_up);

	// draw add member
	if scr_mouse_position_room_released(xx,yy,ww,button_sep,mb_left,true)
	    {
	    edit_member = false;
	    add_member = get_string_async("Enter Member Name","");
	    }

	button_index = scr_mouse_position_room(xx,yy,ww,button_sep,mb_left,true);

	draw_set_color(c_white);
	draw_sprite_ext(spr_member_button,button_index,xx,yy+5,1,1,0,c_blue,1);
	draw_text(xx+spr_center,yy+fn_off-3+5,"Add Member");

	//
	yy += button_sep*2;

	draw_set_alpha(0.7);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_gray,c_gray,c_gray,c_gray,false);
	draw_set_alpha(1);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_white,c_white,c_white,c_white,true);
	/*
	if scr_mouse_position_room_released(xx-30,yy-ysep,40,40,mb_left,true)
	    {
	    list_type = !list_type;
	    if list_type = 1 // favorites
	    team_index = 0; // set to team 1
	    }
    
	var held = scr_mouse_position_room(xx-30,yy-ysep,40,40,mb_left,true);
	draw_sprite(spr_favorites,held,xx-30,yy-ysep+5);*/

	var col = make_colour_rgb(255,227,215); // make_colour_rgb(69,117,228);
	draw_text_colour(xx+10+spr_center,yy-ysep+fn_off,"Member List:",col,col,col,col,1);

	// draw member list
	var list_size = ds_list_size(member_list);
	var size = min(list_size,disp_count);

	funct_draw_scrollbar(xx-5,yy,disp_count,0,list_size,20,member_scroll_offset,ysep,0);
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
	       if abs(xx_mouse) < 7
	       xx_mouse = 0; 
       
	       if mouse_check_button_released(mb_left)
	           {
	           if xx_mouse < -60
	               {
	               ds_list_delete(member_list,list_slot+member_scroll_offset); // delete from member list
               
	               if list_slot >= last_entrant_number // not saved in recent
	               ds_list_delete(member_list_save,list_slot-last_entrant_number+member_scroll_offset); // delete from member list save file
	               else 
	                   {
	                   ds_list_delete(recent_list,list_slot); // delete from recent list
	                   last_entrant_number --;
	                   }
                   
	               member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
	               if member_scroll_offset < 0
	               member_scroll_offset = 0;
	               list_size --;
	               audio_play_sound(snd_tap0,0,false);
	               }
	           else if xx_mouse > 60 // add to favorites list
	                   {
	                   var ind = member_list[| i+member_scroll_offset]; // find name
                   
	                   if list_slot+member_scroll_offset < last_entrant_number // favorites list
	                       {
	                       ds_list_insert(member_list,last_entrant_number,ind); // insert at end of favorites in member list
	                       ds_list_insert(member_list_save,0,ind); // insert at beginning of member list save
	                       ds_list_delete(member_list,list_slot+member_scroll_offset); // delete from member list
	                       ds_list_delete(recent_list,list_slot+member_scroll_offset); // delete from favorites
                       
	                       last_entrant_number --; // 1 less favorite
	                       }
	                   else // in main list
	                       {
	                       ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
	                       ds_list_delete(member_list_save,i+member_scroll_offset-last_entrant_number); // delete from member list save file
	                       ds_list_add(recent_list,ind); // add to recent list
                       
	                       last_entrant_number ++;
	                       ds_list_insert(member_list,last_entrant_number-1,ind); // insert to top of member list below recent
	                       }
                   
	                  // ds_list_insert(favorites_list,0,ind); // add to favorites list
	                  // ds_list_insert(favorites_members_list,0,ind); // add to favorites list
                   
	                  // ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
	                  // member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
	                 //  list_size --;
                  
	                  // if i+member_scroll_offset < last_entrant_number // if moving last entrant number
	                  // last_entrant_number = max(last_entrant_number-1,0);
                   
	                  // team_index = -1;
	                   audio_play_sound(snd_tap0,0,false);
	                   }
	           else if !deleting_member
	               { // add to team list
	               if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,button_sep,mb_left,false)
	               if team_index != -1
	                   {
	                   if ds_list_size(team_list[team_index]) < 5 // limit team size
	                      {// click name
	                      var ind = member_list[| i+member_scroll_offset]; // find name
	                      ds_list_add(entrant_list,ind); // add to entrant list
	                     // ds_list_add(recent_list,ind); // add to recent list
	                      ds_list_add(team_list[team_index],ind); // add to team list
	                      ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
                      
	                      member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
						  if member_scroll_offset < 0
					      member_scroll_offset = 0;
					  
	                      list_size --;
                      
	                      if i+member_scroll_offset < last_entrant_number // if moving last entrant number
	                      last_entrant_number = max(last_entrant_number-1,0);
	                      }
	                   }    
	               }
               
	           list_slot = noone;
	           exit;
	           }
	       } 
       
	    // scrolling
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
			
				if mouse_ydist != 0
				scrollbar_disp_end = 1;
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
	        draw_sprite_ext(spr_favorites,2,xx,yy+10+yy_mouse+(i*ysep),1,1,0,c_white,alph); // favorites button
	        draw_text_colour(xx+110,yy-5+yy_mouse+fn_off+(i*ysep),"Remove",c_red,c_red,c_red,c_red,alph);
	        }
	    else
	        {
	        draw_sprite_ext(spr_favorites,2,xx,yy+10+yy_mouse+(i*ysep),1,1,0,c_white,alph); // favorites button
	        draw_text(xx+140,yy-5+yy_mouse+fn_off+(i*ysep),"Favorites");
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
	if list_slot != noone && abs(mouse_xdist) > 7
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
