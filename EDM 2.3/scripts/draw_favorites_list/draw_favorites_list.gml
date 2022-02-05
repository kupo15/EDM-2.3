function draw_favorites_list(argument0) {
	
	var xx = 100;
	var yy = 40;
	var ww = sprite_get_width(spr_member_button);
	var hh = button_sep*10-12;
	var ysep = argument0;

	if keyboard_check_pressed(vk_tab)
	debug = !debug;
	if debug draw_circle(15,580,5,false);

	// draw add member
	if scr_mouse_position_room_released(xx,yy,ww,button_sep,mb_left,true)
	    {
	    edit_member = false;
	    add_member = get_string_async("Enter Member Name","");
	    }

	button_index = scr_mouse_position_room(xx,yy,ww,button_sep,mb_left,true);

	draw_set_color(c_white);
	draw_sprite_ext(spr_member_button,button_index,xx,yy,1,1,0,c_blue,1);
	draw_text(xx+spr_center,yy+fn_off,"Add Member");

	//
	yy += button_sep*2;

	draw_set_alpha(0.7);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_gray,c_gray,c_gray,c_gray,false);
	draw_set_alpha(1);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_white,c_white,c_white,c_white,true);

	if scr_mouse_position_room_released(xx-30,yy-ysep,40,40,mb_left,true)
	list_type = !list_type;

	var held = scr_mouse_position_room(xx-30,yy-ysep,40,40,mb_left,true);
	draw_sprite(spr_favorites,held,xx-30,yy-ysep+5);
	draw_text_colour(xx+spr_center,yy-ysep+fn_off,"Favorites List:",c_yellow,c_yellow,c_yellow,c_yellow,1);

	// draw member list
	var list_size = ds_list_size(favorites_members_list);
	var disp_count = 10;
	var size = min(list_size,disp_count);

	funct_draw_scrollbar(xx,yy,disp_count,0,list_size,30,favorites_scroll_offset,ysep,0);
	for(var i=0;i<size;i++)
	    {
	    var xx_mouse = 0;
	    var yy_mouse = 0;

	    button_index = scr_mouse_position_room(xx,yy+(i*ysep),ww,button_sep,mb_left,!deleting_member);
    
	    if scr_mouse_position_room_pressed(xx,yy+(i*ysep),ww,button_sep,mb_left,false,false) // get name slot
	        {
	        list_slot = i;
	        timer = round(room_speed*0.65); // start countdown to edit name
	        }
	    else if mouse_check_button_released(mb_left) || abs(global.mouse_ydist) > 5
	    timer = -1;
    
	    // if clicked on a name
	    if list_slot = i
	       {
	       button_index = 1;
	       xx_mouse = min(0,global.mouse_xdist);
       
	       if mouse_check_button_released(mb_left)
	           {
	           if xx_mouse < -60
	               {
	               var ind = favorites_list[| list_slot]; // find name
	               last_entrant_number ++;
               
	               ds_list_insert(member_list,last_entrant_number-1,ind); // insert to top of member list below recent
	               ds_list_delete(favorites_list,list_slot); // delete from favorites list
	               ds_list_delete(favorites_members_list,list_slot); // delete from favorites list
               
	               audio_play_sound(snd_tap0,0,false);
	               }
	           else if !deleting_member
	               {
	                // add to team list
	               if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,button_sep,mb_left,false)
	               if team_index != -1
	                   {
	                   if ds_list_size(team_list[team_index]) < 5 // limit team size
	                      {// click name
	                      var ind = favorites_members_list[| i+favorites_scroll_offset]; // find name
	                      ENTRANT_COUNT++; // add to entrant count
	                      ds_list_add(team_list[team_index],ind); // add to team list
	                      ds_list_delete(favorites_members_list,i+favorites_scroll_offset); // delete from member list
                      
	                      favorites_scroll_offset = clamp(favorites_scroll_offset,0,list_size-disp_count-1);
	                      if favorites_scroll_offset < 0 favorites_scroll_offset = 0;
	                      list_size --;
                      
	                     // if i+favorites_scroll_offset < last_entrant_number // if moving last entrant number
	                     // last_entrant_number = max(last_entrant_number-1,0);
	                      }
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
	        favorites_scroll_offset_start = favorites_scroll_offset;
        
	        if xx_mouse == 0 && scr_mouse_position_room(xx,yy,ww,hh,mb_left,false)
	            {            
	            var amt = round(global.mouse_ydist*0.05);
	            favorites_scroll_offset = favorites_scroll_offset_start-amt;
	            favorites_scroll_offset = clamp(favorites_scroll_offset,0,list_size-disp_count);
	            if favorites_scroll_offset < 0 favorites_scroll_offset = 0;
 
	            if amt != 0
	            list_slot = noone;
	            }
	        }
            
	    // draw button and members
	    var col = c_red;    
	    var alph = (100+xx_mouse)/100;
    
	    draw_text_colour(xx+70+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),"Remove",c_red,c_red,c_red,c_red,1-alph);
    
	    draw_set_alpha(alph);
	    draw_sprite_ext(spr_member_button,button_index,xx+xx_mouse,yy+yy_mouse+(i*ysep),1,1,0,col,alph); // draw button
	    draw_text(xx+xx_mouse+spr_center,yy-5+yy_mouse+fn_off+(i*ysep),favorites_members_list[| i+favorites_scroll_offset]); // draw member name
	    draw_set_alpha(1);
	    }
    
	// going to delete
	if list_slot != noone && global.mouse_xdist < 0 
	    {
	    deleting_member = true;
	    timer = -1;
	    }
    

	if timer = 0
	    {
	    edit_member_slot = list_slot+favorites_scroll_offset;
	    list_slot = noone;
	    edit_member = true;
	    add_member = get_string_async("Edit Member Name",favorites_members_list[| edit_member_slot]);
	    }
	}
