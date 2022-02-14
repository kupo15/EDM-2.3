function draw_edit_score() {
	
	if (edit_score == noone) && (edit_team_score == noone)
	exit;

	var xx = 100;
	var yy = 50;
	var ww = 800;
	var hh = 530;
	var ysep = 35;

	draw_set_color(c_black);

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy,ww+10,hh+10,noone,false) && mouse_check_button_released(mb_left) && !edit_score_scrolling)
	    {
	    edit_score = noone;
	    edit_team_score = noone;
	    edit_score_pos = 0;
	    edit_team_add_member = false;
	    ds_list_clear(numpad_list);
	    exit;
	    }
    
	scr_entrant_scrolling(xx,yy,hh);

	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_set_halign(fa_left);
	draw_text(xx+15,yy+20+fn_off,"ENTER SCORE:");

	if edit_score >= 0
	    {
	    var size = ENTRANT_COUNT;
	    draw_text_transformed(xx+370,yy,"entrant "+string(edit_score+1)+"/"+string(size),0.7,0.7,0);
	    }
	else
	    {
		var team_str = "team ";
		if tourney_type 
		team_str = "group ";
	    draw_text_transformed(xx+400,yy,string(team_str)+string(edit_team_score+1)+"/"+string(team_number+1),0.7,0.7,0);
	    }
	draw_set_font(fn_keyboard);

	var submit = scr_mouse_position_room_released(xx+150,yy+hh-110,220,100,mb_left,true);    

	draw_rectangle(xx+150,yy+hh-110,xx+150+220,yy+hh-10,true);

	var col = make_colour_rgb(69,117,228);
	draw_text_colour(xx+160,yy+hh-90,"SUBMIT",col,col,col,col,1);

	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);

	if edit_team_score == noone
	    {// edit player's score
	    var size = ds_grid_height(scores_grid);
	    for(var i=-1;i<2;i++)
	        {
	        var ind = (edit_score+i+edit_score_offset+size) mod size;
	        draw_text(xx+15+(edit_score_scrolling_offset*500)+(i*500),yy+30+30,scores_grid[# 0,ind]); // Draw player's name
	        }
    
	    draw_set_font(fn_name);
	    draw_text(xx+40,yy+30+80+20+fn_off,"Front 9"); // Front
	    draw_text(xx+40+180,yy+30+80+20+fn_off,"Back 9"); // Back
	    draw_line(xx,yy+30+30+80+30,xx+ww,yy+30+30+80+30);
    
	    var scr = if_undef(scores_grid[# 1,edit_score]);
	    draw_text(xx+40+30,yy+30+30+80+30+fn_off,scr); // Front Score
		
	    var scr = if_undef(scores_grid[# 2,edit_score]);
	    draw_text(xx+40+30+180,yy+30+30+80+30+fn_off,scr); // Back Score
    
	    // Blind and No Team
	    draw_text_transformed(xx+120,yy+245,"Blind",0.9,0.9,0);
	    draw_text_ext_transformed(xx+250,yy+235,"  No\nTeam",30,-1,0.7,0.7,0);
   
	    var _bl = scores_grid[# 5,edit_score];
    
	    if _bl == noone
	    draw_sprite(spr_blind_draw,0,xx+130,yy+310); // blind draw
	    else
	    draw_text(xx+130,yy+310-30,"T"+string(_bl+1)); // team number the blind is on
	    draw_sprite(spr_blind_draw,scores_grid[# 19,edit_score],xx+250,yy+310); // No Team
    
	    draw_set_font(fn_name);
     
	    if scr_mouse_position_room_released(xx+130,yy+310,50,50,mb_left,true) // blind draw
	       {
	       if scores_grid[# 5,edit_score] == noone
	       select_blind_team = edit_score;
	       else
	           {
	           var ind_ = ds_list_find_index(blind_list[scores_grid[# 5,edit_score]],scores_grid[# 0,edit_score]);
	           ds_list_delete(blind_list[scores_grid[# 5,edit_score]],ind_); // delete from blind list
           
	           scores_grid[# 5,edit_score] = noone; // remove from blind
	           }
	       }
	    else if scr_mouse_position_room_released(xx+250,yy+310,50,50,mb_left,true) // No team
	       {
	       scores_grid[# 19,edit_score]  = !scores_grid[# 19,edit_score]; // toggle no team
	       }
	    }
	else
	    {// edit teams score and roster
		var team_str = "Team ";
		if tourney_type team_str = "Group ";
	
	    for(var i=-1;i<2;i++)
	    draw_text(xx+15+(edit_score_scrolling_offset*500)+(i*500),yy+30+30,string(team_str)+string(edit_team_score+1+i+edit_score_offset)); // Draw Team name
    
	    draw_set_font(fn_name);
	    draw_text(xx+40,yy+30+80+20+fn_off,string(team_str)+"Front"); // Front
	    draw_text(xx+40+180,yy+30+80+20+fn_off,string(team_str)+"Back"); // Back
	    draw_line(xx,yy+30+30+80+30,xx+ww,yy+30+30+80+30);

	    var scr = if_undef(team_score[edit_team_score,0]);
	    draw_text(xx+40+30,yy+30+30+80+30+fn_off,scr); // Team Score Front
	    var scr = if_undef(team_score[edit_team_score,1]);
	    draw_text(xx+40+30+180,yy+30+30+80+30+fn_off,scr); // Team Score Front
    
	    var blind_size = ds_list_size(blind_list[edit_team_score]);
	    var team_size = ds_list_size(team_list[edit_team_score]);
	    var team_loop = min(team_size+1,5);
	    for(var i=0;i<team_loop;i++)
	        {
	        /*if i == team_size && scr_mouse_position_room_released(xx+ysep+10,yy+215+20+(i*ysep),480-ysep,ysep,mb_left,true)
	        edit_team_add_member = true;*/
        
	        if i < team_size
	            {
	            var name = ds_list_find_value(team_list[edit_team_score],i);
	            var sco_fr = if_undef(scores_grid[# 1,edit_team_offset+i]);
	            var sco_back = if_undef(scores_grid[# 2,edit_team_offset+i]);
	            if scores_grid[# 1,edit_team_offset+i] == undefined || scores_grid[# 2,edit_team_offset+i] == undefined
	            var sco_tot = "-";
	            else
	            var sco_tot = scores_grid[# 1,edit_team_offset+i]+scores_grid[# 2,edit_team_offset+i];
            
	            if scr_mouse_position_room_released(xx+5,yy+215+20+(i*ysep),46,ysep,mb_left,true)
	                {
	                scr_remove_from_team(name,edit_team_score,i);
	                scr_blinds_remove(scores_grid[# 0,i],scores_grid[# 5,i]);
	                scores_grid_delete_member(edit_team_offset+i);
	                }
            
	//            draw_rectangle(xx+10,yy+215+20+(i*ysep),xx+10+30,yy+215+20+(i*ysep)+30,true);
	            draw_sprite_ext(spr_crossout,0,xx+10,yy+215+25+(i*ysep),0.7,0.7,0,c_white,1);
	            draw_text(xx+50,yy+215+(i*ysep),name); // draw team players
	            draw_text(xx+50+260,yy+215+(i*ysep),sco_fr); // draw team players front
	            draw_text(xx+50+260+70,yy+215+(i*ysep),sco_back); // draw team players back
	            draw_text(xx+50+260+70+70,yy+215+(i*ysep),sco_tot); // draw team players total
            
	            var blind_col = make_color_rgb(98,145,242);
	            draw_set_font(fn_name_it);
	            if i+1 == team_size // if last name is drawn
	            for(var b=0;b<blind_size;b++)
	                {
	                var bl_name = ds_list_find_value(blind_list[edit_team_score],b);
	                draw_text_colour(xx+50,yy+215+((i+b+1)*ysep),bl_name,blind_col,blind_col,blind_col,blind_col,1); // draw blind players
	                }
	            draw_set_font(fn_name);
	            }
	        else if team_size+blind_size < 5
	            {
				// add another team member
	            if scr_mouse_position_room_released(xx+ysep+10,yy+215+20+((i+blind_size)*ysep),480-ysep,ysep,mb_left,true)
	            edit_team_add_member = true;
        
	            draw_set_alpha(0.5);
	            draw_rectangle(xx+50,yy+215+20+((i+blind_size)*ysep),xx+450,yy+215+20+((i+blind_size)*ysep)+ysep,true);
	            draw_set_alpha(1);
	            draw_text_transformed(xx+150,yy+215+12+((i+blind_size)*ysep),"(add member)",0.7,0.7,0);
	            }
	        }
	    }
    
	draw_text(xx+40+180+180,yy+30+80+20+fn_off,"Review"); // Back
    
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(0,yy,xx,yy+hh,false);
	draw_rectangle(xx+ww,yy,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);    
    
	surface_reset_target();
	draw_surface(surface,0,0);

	for(var i=0;i<2;i++)
	if scr_mouse_position_room_pressed(xx+20+(i*180),yy+30+80+20,150,100,mb_left,true,true)
		{
		edit_score_pos = i;
	
		if edit_team_score != noone // if editing team score
			{
			if team_score[edit_team_score,edit_score_pos] != undefined 
			&& sign(team_score[edit_team_score,edit_score_pos]) != 0
			negate = sign(team_score[edit_team_score,edit_score_pos]);
			}
		else // editing individual
			{
			if scores_grid[# edit_score_pos+1,edit_score] != undefined
			&& sign(scores_grid[# edit_score_pos+1,edit_score]) != 0
			negate = sign(scores_grid[# edit_score_pos+1,edit_score]);
			}
		}
    
	if edit_score_highlight_pos != edit_score_pos
	edit_score_highlight_pos = lerp(edit_score_highlight_pos,edit_score_pos,0.2);

	draw_set_alpha(0.7);
	draw_line_width_colour(xx+40+(edit_score_highlight_pos*180),yy+30+30+80+29,xx+40+90+(edit_score_highlight_pos*180),yy+30+30+80+29,7,c_yellow,c_yellow);
	draw_set_alpha(1);


	if edit_team_add_member
	   {
	   draw_edit_team_list();
	   exit;
	   }

	var xx = 600;
	var yy = 180;
	var sep = 100;
	var cent = sep*0.5;
	var row = -1;
	var size = ds_list_size(numpad_list);  

	draw_set_halign(fa_center);
	draw_set_font(fn_keyboard);


	draw_line(xx+(1.5*sep),yy-80-50,xx+(1.5*sep),yy-80); // middle line

	draw_set_alpha((!edit_score_pos*0.5)+0.5);
	draw_rectangle_colour(xx,yy-80-50,xx+(1.5*sep),yy-80,c_white,c_gray,c_gray,c_gray,false); // draw front tab
	draw_text_transformed(xx+(0.75*sep),yy-80-50+5,"Front",0.5,0.5,0); // front tab

	draw_set_alpha((edit_score_pos*0.5)+0.5);    
	draw_rectangle_colour(xx+(1.5*sep),yy-80-50,xx+(3*sep),yy-80,c_white,c_gray,c_gray,c_gray,false); // draw back tab
	draw_text_transformed(xx+(2.25*sep),yy-80-50+5,"Back",0.5,0.5,0); // back tab

	draw_set_alpha(1);

	// front/back
	for(var i=0;i<2;i++)
	if scr_mouse_position_room_released(xx+(i*1.5*sep),yy-80-50,1.5*sep,50,mb_left,true)
	    {
	    ds_list_clear(numpad_list);
	    edit_score_pos = i;
	
		if edit_team_score != noone // editing team score
			{
			if team_score[edit_team_score,edit_score_pos] != undefined 
			&& sign(team_score[edit_team_score,edit_score_pos]) != 0
			negate = sign(team_score[edit_team_score,edit_score_pos]);
			}
		else // editing individual
			{
			if scores_grid[# edit_score_pos+1,edit_score] != undefined
			&& sign(scores_grid[# edit_score_pos+1,edit_score]) != 0
			negate = sign(scores_grid[# edit_score_pos+1,edit_score]);
			}
	    }

	draw_rectangle_colour(xx,yy-80,xx+(3*sep),yy+(4*sep),c_white,c_white,c_white,c_white,false); // draw background
	draw_line(xx,yy,xx+(3*sep),yy);
	draw_rectangle(xx,yy-80,xx+(3*sep),yy+(4*sep),true); // draw background outline

	for(var i=0;i<9;i++) // row (x)
	    {    
	    if (i mod 3) == 0
	    row ++;
    
	//    draw_rectangle_colour(xx+((i mod 3)*sep),yy+(row*sep),xx+(((i mod 3)+1)*sep),yy+((row+1)*sep),c_white,c_white,c_white,c_white,true);
	    draw_sprite(spr_key_circles,0,xx+7+((i mod 3)*sep),yy+12+(row*sep));  
  
	    var num = 7+(i mod 3) - (row*3);
	    draw_text(xx+cent+((i mod 3)*sep),yy-25+cent+(row*sep),num); // draw numpad numbers

	    if scr_mouse_position_room_released(xx+((i mod 3)*sep),yy+(row*sep),sep,sep,mb_left,true)
	    if size < 2
	    ds_list_add(numpad_list,num);
	    }
    
	// draw 0
	draw_sprite(spr_key_circles,0,xx+sep+7,yy+12+(3*sep));
	draw_sprite(spr_key_circles,0,xx+7,yy+12+(3*sep));
	draw_sprite(spr_keyboard,0,xx+5+(2*sep),yy-80+10); // backspace
	draw_text(xx+cent,yy+20+(3*sep),"+/-"); // draw +/-
	draw_text(xx+cent+sep,yy+20+(3*sep),"0"); // draw 0

	var ind = 1;
	if edit_score_pos == 2
	ind = 2;
	draw_sprite(spr_keyboard,ind,xx+3+(2*sep),yy+2+(3*sep)); // enter

	// backspace
	if scr_mouse_position_room_released(xx+(2*sep),yy-80,sep,80,mb_left,true)
	ds_list_delete(numpad_list,size-1);

	// negate score
	if scr_mouse_position_room_released(xx,yy+(3*sep),sep,sep,mb_left,true)
	negate *= -1;

	// add 0
	if scr_mouse_position_room_released(xx+sep,yy+(3*sep),sep,sep,mb_left,true)
	if size < 2
	ds_list_add(numpad_list,0);


	// evaluate
	size = ds_list_size(numpad_list); 

	var num = 0;
	//var num_sign = 1;
	if size = 0
	   {
	   if edit_team_score != noone // editing team score
		   {
		   num = (team_score[edit_team_score,edit_score_pos]);
	   
		   if num != undefined
		   num = abs(num);
		   }
	   else // editing individual
		   {
		   num = scores_grid[# edit_score_pos+1,edit_score];
	   
		   if num != undefined
		   num = abs(num);
		   }
	   }
	else
	   {
	   if size > 0
	   num += numpad_list[| size-1];
    
	   if size > 1
	   num += numpad_list[| 0] *10;
   
	  // num_sign = negate;
	   }
   
	if (edit_score_pos == 2)
	num = undefined;

	if (num == undefined)
	var str = "-";
	else
	var str = num*negate;

	draw_text(xx+sep,yy-80,str); // draw result

	// Enter Keypad
	if scr_mouse_position_room(xx+(2*sep),yy+(3*sep),sep,sep,noone,true) && mouse_check_button_released(mb_left)
	   {
	   var sfx = irandom(2);
	   audio_play_sound(asset_get_index("snd_tap"+string(sfx)),0,false);
   
	   if edit_team_score != noone // team score
	       {
	       if num != undefined
	       team_score[edit_team_score,edit_score_pos] = num*negate;
       
	       edit_score_pos ++;
       
	       if edit_score_pos = 3
	          {
	          edit_team_score ++; // advance to next team
          
	          edit_team_offset = 0;
	          for(var tt=0;tt<edit_team_score;tt++)
	          edit_team_offset += ds_list_size(team_list[tt]);

	          if edit_team_score <= team_number
	          edit_score_pos = 0; // reset position
	          }
		   else if team_score[edit_team_score,edit_score_pos] != undefined
			   {
			   if sign(team_score[edit_team_score,edit_score_pos]) != 0
			   negate = sign(team_score[edit_team_score,edit_score_pos]);
			   }
	       }
	   else // individual
	       {
	       if num != undefined
	       scores_grid[# edit_score_pos+1,edit_score] = num*negate; // save score in grid
       
	       edit_score_pos ++; // advance to next position
       
	       if edit_score_pos = 3
	          {
	          edit_score ++; // advance to next player
          
	          var entr = ENTRANT_COUNT;
	          if edit_score < entr
	          edit_score_pos = 0; // reset position
	          }
	       }
   
	   ds_list_clear(numpad_list);
	   }
   
	// Submit Button
	if submit
	    {
	    if num != undefined
	        {
	        if edit_team_score != noone // team score
	        team_score[edit_team_score,edit_score_pos] = num*negate;
	        else
	        scores_grid[# edit_score_pos+1,edit_score] = num*negate;
	        }
       
	    edit_score_pos = 3;
	    }

	// Save Score
	if edit_score_pos = 3
	   {
	   mouse_clear(mb_left);
	   ds_list_clear(numpad_list);
	   edit_score_pos = 0;
	   edit_score_highlight_pos = 0;
	   edit_score = noone;
	   edit_team_score = noone;
	   negate = 1;
	   }




}
