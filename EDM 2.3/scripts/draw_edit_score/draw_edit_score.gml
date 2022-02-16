function draw_edit_score_player_popup() {
	
	var xx = 0;
	var yy = 180;
	var size = array_length(entrant_list);
	for(var i=-1;i<2;i++) {
			
	    var ind = (edit_score+i+edit_score_offset+size) mod size;
		var entrantName = get_entrant_by_id(ind);
		var xoff = (edit_score_scrolling_offset*500)+(i*500);
			
		// draw player's name
	    draw_text(xx+20+xoff,130,entrantName);
	    }
			
	// draw front/back/adj gross
	var entrantStruct = entrant_list[edit_score];
	var entrantRoundStats = entrantStruct.roundStats;
	var height = 35;
	var sep = 45;

	draw_text_button(45,yy,draw_value(entrantRoundStats.grossFront,"-"),height,85,sep,,,,true);
	draw_text_button(170,yy,draw_value(entrantRoundStats.grossBack,"-"),height,85,sep,,,,true);
	draw_text_button(280,yy,draw_value(entrantRoundStats.grossAdj,"-"),height,120,sep,,,,true);

	// draw blind
	var xx = 100;
	var yy = 380;
	var ww = 36;
		
	var _bl = entrantRoundStats.blindTeam;
			
	draw_text_button(xx,yy-ww-30,"Blind",40,ww,65);	
			
	if (_bl == undefined)
	draw_icon(ico_checkbox,0,xx,yy,ww,ww);
	else
	draw_text_centered(xx,yy,"T"+string(_bl+1),45,55,36); // team the blind is assigned to
			
	// clicked blind
	if scr_mouse_position_room_released(70,yy,80,ww,mb_left,true,true) {
				
		// assign blinds
		if (_bl == undefined) {
					
			select_blind_team = entrantStruct;
			}
		else // remove from blinds
		entrantRoundStats.blindTeam = undefined;
		}
	
	// no team
	var xx = 300;
		
	if draw_icon_click(ico_checkbox,entrantRoundStats.noTeam,xx,yy,ww,ww,,,,,true)
	entrantRoundStats.noTeam = !entrantRoundStats.noTeam;

	draw_text_button(xx,yy-ww-30,"No\nTeam",60,ww,65);
	}
	
function draw_edit_score_team_popup() {
	
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

function draw_edit_score() {
	
	if (edit_score == noone) && (edit_team_score == noone)
	exit;

	var xx = 0;
	var yy = 0;
	var ww = 920;
	var hh = room_height;
	var ysep = 35;

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
		
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
    
	scr_entrant_scrolling(xx,yy,hh);

	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_text_centered(xx+15,yy+20,"ENTER GROSS SCORE:",35,,);

	if (edit_score >= 0) {
		
	    var size = ENTRANT_COUNT;
	    draw_text_height(xx+430,yy+25,"entrant "+string(edit_score+1)+"/"+string(size),25);
	    }
	else {// unused
		
		var team_str = pick("team ","group ",tourney_type);
	    draw_text_transformed(xx+400,yy,string(team_str)+string(edit_team_score+1)+"/"+string(team_number+1),0.7,0.7,0);
	    }

	// submit button
	draw_rectangle(xx+150,yy+hh-110,xx+150+220,yy+hh-10,true);

	var col = make_colour_rgb(69,117,228);
	var submit = draw_text_button(xx+150,yy+hh-110,"SUBMIT",45,220,100,col);

	// headers
	var yy = 180;
	var height = 30;
	
	draw_set_valign(fa_bottom);
	draw_text_height(50,yy,"Front 9",height);
	draw_text_height(170,yy,"Back 9",height);
	draw_text_height(280,yy,"Adjusted 18",height);

	draw_line_pixel(xx,yy,470,1); // line

	// create surface
	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);

	// edit player's score
	if (edit_team_score == noone)
	draw_edit_score_player_popup();
	else // edit team score
	draw_edit_score_team_popup();
    
	// cutoff 
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(470,0,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);    
    
	// draw surface
	surface_reset_target();
	draw_surface(surface,0,0);
	
exit;
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


	if edit_team_add_member {
		
	   draw_edit_team_list();
	   exit;
	   }

	var xx = 600;
	var yy = 180;
	var sep = 100;
	var size = ds_list_size(numpad_list);  

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
	
function entry_scores_individual_submit(entry) {
	
	var entrantStruct = entrant_list[edit_score];
	var entrantRoundStats = entrantStruct.roundStats;
	
	// save score
	switch edit_score_pos
		{
		case entryType.memberFront: entrantRoundStats.grossFront = entry; break;	
		case entryType.memberBack: entrantRoundStats.grossBack = entry; break;	
		case entryType.memberAdjGross: entrantRoundStats.grossAdj = entry; break;
		
		case entryType.memberEntryNext: 
		
			// advance to next player
			edit_score++;
			  
			// reset position
			if (edit_score < ENTRANT_COUNT)
			edit_score_pos = entryType.memberFront;
			
			break;
		}
	
	// advance to next position
	edit_score_pos++;
	keypad_set_value(edit_score_pos);
	}
