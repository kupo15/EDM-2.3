function draw_team_header(xx,yy,ysep,_team,in_popover) {
	
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
	
function draw_team_content(xx,team_yy,ysep,teamInd,can_edit) {
	
	can_edit = !can_edit;
	
	// draw team list
	var list = TEAM_LIST[teamInd].members;
	for(var i=0;i<array_length(list);i++) // loop through teams
	    {
		var struct = list[i];
		var round_stats = struct.roundStats;
		var height = 55;
        
		// draw name
		draw_member_name(xx+5,team_yy+(i*ysep),struct,height,,ysep)
        
		// gross front/back
		var fr = pick("-",round_stats.grossFront,round_stats.grossFront != "");
		var bk = pick("-",round_stats.grossBack,round_stats.grossBack!= "");
		var adjGross = pick("-",round_stats.grossAdj,round_stats.grossBack!= "");
	    var scr = fr+"/"+bk+"/"+adjGross;
		
	    draw_text_centered(xx+375,team_yy+(i*ysep),scr,30,145,ysep);
		
		// edit individual score
		if scr_mouse_position_room_released(xx,team_yy+(i*ysep),535,ysep,mb_left,true,,can_edit) {
			
	        edit_score = 0;   
	        edit_score_scrolling_end = edit_score;
	        edit_team_score = noone;
			
			init_keypad(entryType.memberFront,entrant_list[edit_score].roundStats.grossFront,,560,,0,0);
	        mouse_clear(mb_left);
	        }
	
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
	        }
	    else
	        {
			// blind team
	        var _bl = round_stats.blindTeam;
			
	        if (_bl == undefined)
	        draw_icon(ico_checkbox,0,xx+585,team_yy+(i*ysep),55,ysep); // Blind
	        else
	        draw_text_centered(xx+585,team_yy+(i*ysep),"T"+string(_bl+1),45,55,ysep); // team the blind is assigned to
			
			// clicked blind
			if scr_mouse_position_room_released(xx+570,team_yy+(i*ysep),90,ysep,mb_left,true,,can_edit) {
				
				// assign blinds
				if (_bl == undefined) {
					
					select_blind_team = struct;
					}
				else // remove from blinds
				round_stats.blindTeam = undefined;
				}
						
			// no team
	        if draw_icon_click(ico_checkbox,round_stats.noTeam,xx+725,team_yy+(i*ysep),100,ysep,,,,can_edit)
			round_stats.noTeam = !round_stats.noTeam;
	        }
			
        continue 
               
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
	var col_off = 120;
	var in_popover = (select_blind_team != undefined) || (edit_score != noone) || (edit_team_score != noone);

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
		
		draw_team_header(xx,yy+team_yoff,ysep,i,in_popover);
		draw_team_content(xx,yy+team_yoff,member_sep,i,in_popover);
		
		continue;
		
	    var _team_sep = max(_team-1,0);
	    var sep_pos = ds_list_size(team_list[_team_sep]);
	    var ss = ds_list_size(team_list[_team]);
    
	    // edit team score
	    if (edit_score == noone) && (edit_team_score == noone) && (select_blind_team == undefined)
	    if scr_mouse_position_room_released(xx+(col*hsep),yy-ysep+team_yoff,300+col_off,ysep,mb_left,true,in_popover)
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
		
	// draw blind/no team toggle
	var xx = 870;
	var yy = 500;
	var ww = 150;
	var hh = 80;
	var str = pick("Blind/\nNo Teams","Gross Skins/\n Net Skins",!skins_input);
	
	draw_rectangle_colour(xx,yy-400,xx+ww,yy-400+hh+hh,c_green,c_green,c_green,c_green,true);
	
	if draw_text_button(xx,yy-400,str,60,ww,hh+hh,,,,,!in_popover)
	skins_input = !skins_input;
   
	// back button
	draw_rectangle_colour(xx,yy-100,xx+ww,yy-100+hh,c_green,c_green,c_green,c_green,true);
	
	if draw_text_button(xx,yy-100,"Go Back",40,ww,hh,,,,,!in_popover)
	screen_change(screenEnum.homeScreen);

	// results button
	var calc = activate_results_button();
	var alpha = (calc*0.5)+0.5;

	draw_set_alpha(alpha);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,false);
	draw_set_alpha(1);

	if draw_text_button(xx,yy,"Results",40,ww,hh,c_white,alpha,true,,!in_popover && calc) {
		
		season_save = false;
		scr_calculate_results();
		}

	// draw popovers
	draw_edit_score();
	draw_assign_blind();
	
	// debug
	debug_randomize_scores();
	}
	
function debug_randomize_scores() {
	
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
	}
	
function activate_results_button() {
	
	var entr = ENTRANT_COUNT;
	var calc = (entr > 3); // must have at least entrants 

	//// if all players are No Team
	//if ds_grid_get_sum(scores_grid,19,0,19,entr-1) == entr
	//calc = true;
	//else // team score unneeded
	//	{
	//	if (tourney_type == tourneyType.team) // if team event
	//	for(var i=0;i<team_number+1;i++) // loop through teams
	//	for(var ii=0;ii<3;ii++)
	//	if team_score[i,ii] == undefined
	//	   {
	//	   calc = false;
	//	   break;
	//	   }
	//	}
   	//
	//// make sure entrants entered scores - activates Results Button
	//for(var i=0;i<entr;i++)
	//for(var ii=0;ii<2;ii++)
	//if scores_grid[# ii+1,i] == undefined
	//	{
	//	calc = false;
	//	break;
	//	}
	
	return calc;
	}
