function draw_team_header(xx,yy,ysep,_team) {
	
	var str_group = pick("Team ","Group ",tourney_type);
	var c_col = make_color_rgb(98,145,242);
	var height = 40;
	
	draw_set_valign(fa_bottom);
	draw_text_height_color(xx+5,yy,string(str_group)+string(_team+1),c_col,height); // team number
	
	if (tourney_type == tourneyType.team) // team game
		{
		var scr1 = if_undef(team_score[_team,0]);
		var scr2 = if_undef(team_score[_team,1]);
		
		draw_text_height(xx+135,yy,"Score: F: "+string(scr1)+"   B: "+string(scr2),height);
		}
	
	var height = 35;
	
	draw_text_height(xx+400,yy,"F/B/",height,);
	draw_text_height(xx+480,yy,"Adj.\nGross",height*1.2);
	
	var c1_str = pick("Gross Skins","Blind",!skins_input);
	var c2_str = pick("Net Skins","No Team",!skins_input);
	var height = 30;
	
	draw_text_centered(xx+535,yy,c1_str,height,150,0,,,true);
	draw_text_centered(xx+695,yy,c2_str,height,150,0,,,true);
	}
	
function draw_team_content(xx,team_yy,ysep,teamInd) {
	
	var can_edit = (edit_score == noone) && (select_blind_team == noone);
	
	// draw team list
	var list = TEAM_LIST[teamInd].members;
	for(var i=0;i<array_length(list);i++) // loop through teams
	    {
		var struct = list[i];
		var round_stats = struct.roundStats;
	    var name = struct.name;
		var height = 55;
        
	    var str = "";
	    if (round_stats.blindTeam != undefined) // if blind draw
	    str += "*";
			
	    if round_stats.noTeam // if no team
	    str += "`";
        
	    str += string(name);
        
		// draw name
	    draw_text_centered(xx+5,team_yy+(i*ysep),str,height,,ysep);
        
		// gross front/back
		var fr = pick("-",round_stats.grossFront,round_stats.grossFront != "");
		var bk = pick("-",round_stats.grossBack,round_stats.grossBack!= "");
		var adjGross = pick("-",round_stats.grossAdj,round_stats.grossBack!= "");
	    var scr = fr+"/"+bk+"/"+adjGross;
		
	    draw_text_centered(xx+375,team_yy+(i*ysep),scr,30,145,ysep);
	
	    if skins_input {
			
			// gross skins
	        if draw_icon_click(spr_add_button,0,xx+535,team_yy+(i*ysep),50,ysep,,,,can_edit) // minus button
			round_stats.skinsGross = add_string(round_stats.skinsGross,-1,0,17);
			
			draw_text_centered(xx+535,team_yy+(i*ysep),"-",35,50,ysep); // minus

	        if draw_icon_click(spr_add_button,0,xx+555+85,team_yy+(i*ysep),50,ysep,,,,can_edit) // plus button
			round_stats.skinsGross = add_string(round_stats.skinsGross,1,0,17);
			
			draw_text_centered(xx+555+85,team_yy+(i*ysep),"+",35,50,ysep); // plus
			
			draw_text_centered(xx+535,team_yy+(i*ysep),round_stats.skinsGross,50,155,ysep) // value

			// net skins
	        if draw_icon_click(spr_add_button,0,xx+695,team_yy+(i*ysep),50,ysep,,,,can_edit) // minus button
			round_stats.skinsNet = add_string(round_stats.skinsNet,-1,0,17);

			draw_text_centered(xx+695,team_yy+(i*ysep),"-",35,50,ysep); // minus

	        if draw_icon_click(spr_add_button,0,xx+795,team_yy+(i*ysep),50,ysep,,,,can_edit) // plus button
			round_stats.skinsNet = add_string(round_stats.skinsNet,1,0,17);

			draw_text_centered(xx+795,team_yy+(i*ysep),"+",35,50,ysep); // plus
			
			draw_text_centered(xx+695,team_yy+(i*ysep),round_stats.skinsNet,50,155,ysep) // value
			continue
	        }
	    else
	        {
	        var _bl = scores_grid[# 5,grid_row];
	        if _bl == noone
	        draw_sprite(spr_blind_draw,0,xx+col_off+300+80+80+50,yy+(ii*ysep)+(off_pos*sep)); // blind draw
	        else
	        draw_text(xx+col_off+300+80+80+50,yy-30+(ii*ysep)+(off_pos*sep),"T"+string(_bl+1)); // team the blind is assigned to
	        draw_sprite(spr_blind_draw,scores_grid[# 19,grid_row],xx+col_off+300+80+80+50+100,yy+(ii*ysep)+(off_pos*sep)); // No Team
	        }
        
	    if edit_score = noone && select_blind_team == noone 
	        {
	        if scr_mouse_position_room_released(xx,team_yy+(i*ysep),550,ysep,mb_left,true) // edit score
	            {
	            edit_score = grid_row;   
	            edit_score_scrolling_end = edit_score;
	            edit_team_score = noone;
	            mouse_clear(mb_left);
	            }
	        else
	            {
	            if scr_mouse_position_room_released(xx+col_off+300+80+80+50,yy+(ii*ysep)+(off_pos*sep),50,50,mb_left,true) // blind draw
	                {
	                if (scores_grid[# 5,grid_row] != noone)
	                    {
	                    var ind_ = ds_list_find_index(blind_list[scores_grid[# 5,grid_row]],string(scores_grid[# 0,grid_row]));
	                    ds_list_delete(blind_list[scores_grid[# 5,grid_row]],ind_); // delete from blind list
                        
	                    scores_grid[# 5,grid_row] = noone; // toggle off blind
	                    }
	                else
	                select_blind_team = grid_row;
	                }
	            else if scr_mouse_position_room_released(xx+col_off+300+80+80+50+100,yy+(ii*ysep)+(off_pos*sep),50,50,mb_left,true) // No team
	                {
	                scores_grid[# 19,grid_row]  = !scores_grid[# 19,grid_row]; // toggle no team
	                }
	            }
	        }   
               
	    if ii+1 == size // if last member draw
	        {
	        var _blind_size = ds_list_size(blind_list[_team]);
	        var bl_col = make_color_rgb(98,145,242);
	        for(var b=0;b<_blind_size;b++) // loop through blind list
	            {
	            var b_str = ds_list_find_value(blind_list[_team],b); // get name
	            draw_text_colour(xx+10,yy+fn_off-8+((ii+b+1)*ysep)+(off_pos*sep),b_str,bl_col,bl_col,bl_col,bl_col,1); // draw blind name
	            }
	        }
                  
	    grid_row ++;
	    }
	}

function draw_teams() {
	
	// draw team groups
	var xx = 10;
	var yy = 60;
	var ysep = 55; // line break separation
	var ww = 845;
	var hsep = ww+10; // column separation

	var col = 0;
	var grid_row = 0;
	var col_off = 120;
	var in_menu = edit_team_score >= 0 || edit_score >= 0;

	draw_set_color(c_black);
	draw_set_halign(fa_left);

	scr_teams_scrolling(xx,yy,ww);
   
	var loop = team_number+1; // min(team_number+1,2);
	for(var i=0;i<loop;i++)
	    {        
	    var _team = i; //+floor(team_scroll_offset);
	    var off_pos = i-team_scroll_offset;
		
		var member_sep = 59;
		var hh = member_sep*5;
	    var sep = hh+ysep+10; // row separation
		var team_yoff = (off_pos*sep);
		
		// outline
		draw_rectangle(xx+(col*hsep),yy+team_yoff,xx+ww+(col*hsep),yy+team_yoff+hh,true);
		
		draw_team_header(xx,yy+team_yoff,ysep,i);
		draw_team_content(xx,yy+team_yoff,member_sep,i);
		
		continue;
		
	    var _team_sep = max(_team-1,0);
	    var sep_pos = ds_list_size(team_list[_team_sep]);
	    var ss = ds_list_size(team_list[_team]);
    
	    // edit team score
	    if (edit_score == noone) && (edit_team_score == noone) && (select_blind_team == noone)
	    if scr_mouse_position_room_released(xx+(col*hsep),yy-ysep+team_yoff,300+col_off,ysep,mb_left,true)
	        {
	        edit_score = -1;      
	        edit_team_score = _team;
	        negate = -1;
	        edit_team_offset = 0;
		
			if (team_score[edit_team_score,edit_score_pos] != undefined)
				{
				if sign(team_score[edit_team_score,edit_score_pos]) != 0
				negate = sign(team_score[edit_team_score,edit_score_pos]);
				}
        
	        for(var tt=0;tt<_team;tt++)
	        edit_team_offset += ds_list_size(team_list[tt]);
	        mouse_clear(mb_left);
	        }
	    }

    
	var xx = 870;
	var yy = 500;
	var ww = 150;
	var hh = 80;
	var entr = ENTRANT_COUNT;
	var calc = (entr > 3);

	// if all players are No Team
	if ds_grid_get_sum(scores_grid,19,0,19,entr-1) == entr
	calc = true;
	else // team score unneeded
		{
		if (tourney_type == tourneyType.team) // if team event
		for(var i=0;i<team_number+1;i++) // loop through teams
		for(var ii=0;ii<3;ii++)
		if team_score[i,ii] == undefined
		   {
		   calc = false;
		   break;
		   }
		}
   
	// make sure entrants entered scores - activates Results Button
	for(var i=0;i<entr;i++)
	for(var ii=0;ii<2;ii++)
	if scores_grid[# ii+1,i] == undefined
		{
		calc = false;
		break;
		}

	// draw blind/no team toggle
	var str = pick("Blind/\nNo Teams","Gross Skins/\n Net Skins",!skins_input);
	
	draw_rectangle_colour(xx,yy-400,xx+ww,yy-400+hh+hh,c_green,c_green,c_green,c_green,true);
	draw_text_centered(xx,yy-400,str,60,ww,hh+hh);
   
	// debug
	draw_rectangle_colour(xx,yy-100,xx+ww,yy-100+hh,c_green,c_green,c_green,c_green,true);
	draw_text_centered(xx,yy-100,"Go Back",40,ww,hh); 

	// back button
	if !in_menu && scr_mouse_position_room_released(xx,yy-100,ww,hh,mb_left,true)
	phase = 0;
   
	// debug randomize
	if dev_mode && keyboard_check_pressed(vk_space)
	    {
	    for(var i=0;i<team_number+1;i++)
	        {
	        team_score[i,0] = -irandom(26)-1;
	        team_score[i,1] = -irandom(26)-1;
	        }
        
	    var height = ds_grid_height(scores_grid);
	    for(var i=0;i<height;i++)
	        {
	        scores_grid[# 1,i] = irandom_range(33,50); // front nine
	        scores_grid[# 2,i] = irandom_range(33,50); // back nine
	        }
	    }
	//

	draw_set_alpha((calc*0.5)+0.5)
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,false);

	draw_text_centered(xx,yy,"Results",40,ww,hh,c_white);
	draw_set_alpha(1);

	if edit_score == noone && edit_team_score == noone && select_blind_team == noone
	if scr_mouse_position_room_released(xx,yy-400,ww,hh+hh,mb_left,true)
	skins_input = !skins_input;
	else if calc && scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
		{
		season_save = false;
		scr_calculate_results();
		}
    
	if select_blind_team == noone
	draw_edit_score();
	else
	draw_assign_blind();    
	}
