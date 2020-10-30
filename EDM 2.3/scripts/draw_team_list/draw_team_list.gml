function draw_team_list(argument0) {
	// draw team groups
	var ysep = argument0;
	var xx = 450;
	var yy = 20;
	var ww = button_ww;
	var hh = button_sep*5-7;
	var sep = hh+40;
	var hsep = 80;

	draw_set_font(fn_name_up);
	draw_set_color(c_black);


	// highlight team to add to
	draw_set_alpha(0.3);
	if team_index != -1
	draw_rectangle_colour(xx+20+(team_index*hsep),yy,xx+20-1+hsep+(team_index*hsep),yy+60,c_yellow,c_yellow,c_yellow,c_yellow,false);
	else if list_type == 0 // favorites box highight
	draw_rectangle_colour(xx+100,yy-60,xx+100+ww-30,yy-60+60,c_yellow,c_yellow,c_yellow,c_yellow,false);
	draw_set_alpha(1);
	/*
	if list_type == 0
	    {
	    draw_rectangle_colour(xx+100,yy-60,xx+70+ww,yy-60+30,c_black,c_black,c_black,c_black,true);
	    draw_text(xx+200,yy-60+fn_off-8,"*Favorites");
    
	    if scr_mouse_position_room_pressed(xx+100,yy-60,ww-30,30,mb_left,true,true)
	    team_index = -1;
	    }*/

	// draw team boxes to select
	for(var i=0;i<teams_max;i++)
	    {
	    var size = ds_list_size(team_list[i]);
	    var col = c_black;
	    if i=team_index
	    col = c_black;
    
	    for(var n=0;n<size;n++)
	    draw_circle(xx+30+(n*10)+(i*hsep),yy+55,4,false); // number of entrants
    
	    draw_rectangle_colour(xx+20+(i*hsep),yy,xx-1+20+hsep+(i*hsep),yy+60,col,col,col,col,true); 
	    draw_text_transformed(xx+60+(i*hsep),yy-10+fn_off,string(i+1),0.85,0.85,0);    
	    if scr_mouse_position_room_pressed(xx+20+(i*hsep),yy,hsep,60,mb_left,true,true) // select team
	    team_index = i;
	    }
    

	xx += 80;
	yy += 100;

	// draw team list
	if team_index != -1
	for(var i=0;i<1;i++)
	    {    
	    draw_rectangle(xx,yy+(i*sep),xx+ww,yy+hh+(i*sep),true);
	    draw_set_font(fn_name);
	    draw_text_transformed(xx+spr_center,yy+fn_off-(ysep*0.55)+(i*sep),"Team "+string(team_index+1),1,1,0);
	    draw_set_font(fn_name_up);
    
	    // draw team list
	    var size = ds_list_size(team_list[team_index]);
	    for(var a=0;a<size;a++)
	        {
	        button_index = scr_mouse_position_room(xx,yy+(a*ysep)+(i*sep),ww,button_sep,mb_left,true);
        
	        // draw team member names
	        draw_sprite(spr_member_button,button_index,xx,yy+(a*ysep)+(i*sep)); // draw button
	        draw_text(xx+spr_center,yy+fn_off+(a*ysep)+(i*sep),ds_list_find_value(team_list[team_index],a)); // draw player's name
                 
	        // delete from team
	        if scr_mouse_position_room_released(xx,yy+(a*ysep)+(i*sep),ww,button_sep,mb_left,false)
	           {
	           var ind = ds_list_find_value(team_list[team_index],a); // find name
           
	           var fav = false;
	           for(var ff=0;ff<ds_list_size(recent_list);ff++) // loop through favorites list
	           if recent_list[| ff] == ind
	               {
	               fav = true; // found on favorites list
	               break;
	               }
           
	           if fav // put back on favorites list
	               {
	               ds_list_insert(member_list,last_entrant_number,ind);
	               last_entrant_number ++;
	               }
	           else // add to members list
	               {
	               var _slot = max(member_scroll_offset,last_entrant_number);
	               ds_list_insert(member_list,_slot,ind); // insert to top of member list below recent
	               }
               
	           ds_list_delete(team_list[team_index],a); // delete from team list
	           ds_list_delete(entrant_list,a); // delete from entrant list
	           //ds_list_delete(recent_list,a); // delete from recent list
	           }
	        }
	    }
	else // draw favorites list
	    {    
	    var i=0;
	    draw_rectangle(xx,yy+(i*sep),xx+ww,yy+hh+(3*ysep)+(i*sep),true);
	    draw_text_transformed(xx+spr_center,yy+fn_off-20-(ysep*0.55)+(i*sep),"*Favorites",1,1,0);
    
	    // draw team list
	    var size = ds_list_size(favorites_list);
	    size = min(size,8);
	    for(var a=0;a<size;a++)
	        {
	        button_index = scr_mouse_position_room(xx,yy+(a*ysep)+(i*sep),ww,button_sep,mb_left,true);
        
	        // draw team member names
	        draw_sprite(spr_member_button,button_index,xx,yy+(a*ysep)+(i*sep)); // draw button
	        draw_text(xx+spr_center,yy+fn_off+(a*ysep)+(i*sep),favorites_list[| a]); // draw player's name
                 
	        // delete from favorites list
	        if scr_mouse_position_room_released(xx,yy+(a*ysep)+(i*sep),ww,button_sep,mb_left,false)
	           {
	           var ind = favorites_list[| a]; // find name
	           last_entrant_number ++;
           
	           ds_list_insert(member_list,last_entrant_number-1,ind); // insert to top of member list below recent
	           ds_list_delete(favorites_list,a); // delete from favorites list
	           ds_list_delete(favorites_members_list,a); // delete from favorites list
	           }   
	        }
        
	            // scrolling
	       /* if scr_mouse_position_room_pressed(xx,yy,ww,hh+(3*ysep),mb_left,true,false)
	        favorites_team_scroll_offset_start = favorites_team_scroll_offset;
        
	        if scr_mouse_position_room(xx,yy,ww,hh+(3*ysep),mb_left,false)
	            {
	            var amt = round(mouse_ydist*0.05);
	            favorites_team_scroll_offset = favorites_team_scroll_offset_start-amt;
	            favorites_team_scroll_offset = clamp(favorites_team_scroll_offset,0,size-8);
	            if favorites_team_scroll_offset < 0 favorites_team_scroll_offset = 0;
            
            
	            if amt != 0
	            list_slot = noone;
	            }*/
	    }





}
