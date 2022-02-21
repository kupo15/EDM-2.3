function draw_edit_score_all() {
	
	var xx = 0;
	var yy = 0;
	var ww = 920;
	var hh = room_height;

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy,ww+10,hh+10,noone,false) && mouse_check_button_released(mb_left) && !edit_score_scrolling)
	    {
	    edit_score = noone;
	    edit_team_score = noone;
	    edit_score_pos = entryType.memberFront;
	    edit_team_add_member = false;
	    exit;
	    }
		
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
    
	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_text_centered(xx+15,yy+20,"ENTER GROSS SCORE:",35,,);
	
	//scr_entrant_scrolling(xx,yy,hh);

	// number of teams
	var size = team_number+1;
	draw_text_height(xx+430,yy+25,"team "+string(team_index_entry+1)+"/"+string(size),25);

	// submit button
	var b_ww = 220;
	var b_hh = 90;
	var b_xx = xx+150;
	var b_yy = yy+hh-10-b_hh;
	var col = make_colour_rgb(69,117,228);
	var submit = draw_text_button(b_xx,b_yy,"SUBMIT",45,220,b_hh,col,,,true);
	
	draw_rectangle(b_xx,b_yy,b_xx+b_ww,b_yy+b_hh,true);

	// headers
	var yy = 180;
	var height = 25;
	var c_col = appblue;

	draw_text_centered(30,yy-height*1.8,"Team "+string(team_index_entry+1),height*1.8,,height*2,c_col);
	draw_text_centered(340,yy-height,"Front",height,70);
	draw_text_centered(410,yy-height,"Back",height,70);
	draw_text_centered(480,yy-height,"Adj. 18",height,70);

	draw_line_pixel(xx,yy,560,1); // line
	

	//draw_set_valign(fa_bottom);

	// create surface
	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);

	// edit player's score
	draw_edit_score_player_popup();
    
	// draw surface
	draw_surface(surface,0,0);
	
	// submit button
	if submit {

		entry_scores_individual_submit(obj_number_input.entryString);
		obj_number_input.active = false;
		
		edit_score = noone;
	    edit_team_score = noone;
	    edit_score_pos = entryType.memberFront;
	    edit_team_add_member = false;
		}
	}


function draw_edit_score_player_popup() {
	
	var xx = 0;
	var yy = 180;
	var list = TEAM_LIST[team_index_entry].members;
	var size = array_length(list);
	var height = 70;
	for(var i=-1;i<2;i++) {
			
	    var ind = (edit_score+i+edit_score_offset+size) mod size;
		var xoff = (edit_score_scrolling_offset*500)+(i*500);
		var entrantName = list[ind].name; // get_entrant_by_id(ind);
			
		// draw player's name
	    draw_text_centered(xx+20+xoff,130-height,entrantName,height);
	    }
		
	// cutoff 
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(520,0,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);
	
	// draw list of members
	var height = 35;
	var sep = 50;
	for(var i=0;i<size;i++)
		{
		var memberData = list[i];
		var name = memberData.name;
		
		var entrantRoundStats = memberData.roundStats;
			
		// member name
		draw_text_centered(15,yy+(i*sep),string(i+1)+". "+name,height,,sep*1.2,,,);
		
		if draw_icon_click(,,0,yy+(i*sep),340,sep,,,false,,true)
		edit_score = i;
		
		// member scores
		if draw_text_button(340,yy+(i*sep),draw_value(entrantRoundStats.grossFront,"-"),height,70,sep,,,,true) {
			
			edit_score = i;
			edit_score_pos = entryType.memberFront;
			keypad_set_value(edit_score_pos,entrantRoundStats.grossFront);
			}
		
		if draw_text_button(410,yy+(i*sep),draw_value(entrantRoundStats.grossBack,"-"),height,70,sep,,,,true) {

			edit_score = i;
			edit_score_pos = entryType.memberBack;
			keypad_set_value(edit_score_pos,entrantRoundStats.grossBack);
			}
		
		if draw_text_button(480,yy+(i*sep),draw_value(entrantRoundStats.grossAdj,"-"),height,70,sep,,,,true) {
			
			edit_score = i;
			edit_score_pos = entryType.memberAdjGross;
			keypad_set_value(edit_score_pos,entrantRoundStats.grossAdj);
			}
		}

	surface_reset_target();
		
	// draw highlight member
	draw_icon(,,0,yy+(edit_score*sep),560,sep,c_white,0.7);
	
	// draw highlight entry members
	if (edit_score_pos >= entryType.memberFront) && (edit_score_pos <= entryType.memberEntryNext) {
		
		var xoff = (clamp(edit_score_pos,entryType.memberFront,entryType.memberAdjGross)-entryType.memberFront)*70;
		draw_icon(,,340+xoff,yy+(edit_score*sep),70,sep,c_blue,0.3);
		}
	else {
		
		var xoff = (clamp(edit_score_pos,entryType.teamFront,entryType.teamBack)-entryType.teamFront)*70;
		draw_icon(,,200+xoff,420,70,sep,c_blue,0.3);
		}
		
	// draw team score
	var xx = 20;
	var yy = 420;
	var height = 30;
	var c_col = appblue;

	draw_text_centered(xx,yy,"Team Score",height,,sep,c_col);
	
	var list = TEAM_LIST[team_index_entry];
	
	if draw_text_button(200,yy,draw_value(list.teamNetFront,"-"),height,70,sep,,,,true) {
		
		edit_score_pos = entryType.teamFront;
		keypad_set_value(edit_score_pos,list.teamNetFront,,true);
		}
	
	if draw_text_button(270,yy,draw_value(list.teamNetBack,"-"),height,70,sep,,,,true) {
		
		edit_score_pos = entryType.teamBack;
		keypad_set_value(edit_score_pos,list.teamNetBack,,true);
		}
	
	// draw Next Team button
	var xx = 350;
	var yy = 440;
	var ww = 200;
	var height = 30;
	var hh = height*1.5;
	var alpha = 1;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	if draw_text_button(xx,yy,"Next Team",height,ww,hh,,alpha,,true) {
		
		edit_score_pos = entryType.memberEntryNext;
		entry_scores_individual_submit();
		}
		
	// highlight
	if (edit_score_pos == entryType.memberEntryNext) 
	draw_icon(,,xx,yy,ww,hh,c_blue,0.3);
	
	exit;
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
            
	        var blind_col = appblue;
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

	draw_edit_score_all();
	exit;

	var xx = 0;
	var yy = 0;
	var ww = 920;
	var hh = room_height;

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy,ww+10,hh+10,noone,false) && mouse_check_button_released(mb_left) && !edit_score_scrolling)
	    {
	    edit_score = noone;
	    edit_team_score = noone;
	    edit_score_pos = entryType.memberFront;
	    edit_team_add_member = false;
	    exit;
	    }
		
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
    
	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_text_centered(xx+15,yy+20,"ENTER GROSS SCORE:",35,,);

	scr_entrant_scrolling(xx,yy,hh);

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
	draw_text_height(15,yy,"Team",height);
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
    
	// underline highlight
	if edit_score_highlight_pos != edit_score_pos
	edit_score_highlight_pos = lerp(edit_score_highlight_pos,edit_score_pos,0.2);

	if edit_team_add_member {
		
	   draw_edit_team_list();
	   exit;
	   }
	}
	
function entry_scores_team_submit(entry) {
	
	var list = TEAM_LIST[team_index_entry];

	// save score
	switch edit_score_pos
		{
		case entryType.teamFront: list.teamNetFront = entry;
								  edit_score_pos++;
								  keypad_set_value(edit_score_pos,list.teamNetBack,,true);
								  break;
		
		case entryType.teamBack: list.teamNetBack = entry;
								 //edit_score_pos++;
								 keypad_set_value(edit_score_pos,list.teamNetBack,,true);
								 break;			
		}
	}
	
function entry_scores_individual_submit(entry) {
	
	var list = TEAM_LIST[team_index_entry].members;
	var teamSize = array_length(list);
	var entrantStruct = list[edit_score];
	var entrantRoundStats = entrantStruct.roundStats;

	// save score
	switch edit_score_pos
		{
		case entryType.memberFront: entrantRoundStats.grossFront = entry;
									edit_score_pos++;
									keypad_set_value(edit_score_pos,entrantRoundStats.grossBack);
									break;
									
		case entryType.memberBack: entrantRoundStats.grossBack = entry;
								   edit_score_pos++;
								   keypad_set_value(edit_score_pos,entrantRoundStats.grossAdj);
								   break;
									
		case entryType.memberAdjGross: entrantRoundStats.grossAdj = entry;
									   edit_score++; // advance to next player
									   edit_score_pos = entryType.memberFront;
									   entry_next_entrant(list,teamSize);
									   break;
		
		case entryType.memberEntryNext: edit_score = 0; // start at first member
										edit_score_pos = entryType.memberFront;
										team_index_entry++; // move to next team
										
										// reaches end exit
										if (team_index_entry == team_number+1) {
				
											edit_score = noone;
											edit_team_score = noone;
											edit_team_add_member = false;
											team_index_entry = undefined;
					
											with obj_number_input
											active = false;
											
											break;
											}
										
										entry_next_entrant(list,teamSize);
										break;
		}
	}

function entry_next_entrant(list,teamSize) {

	// end of team list
	if (edit_score == teamSize) {
		
		edit_score--;
		edit_score_pos = entryType.memberEntryNext;
		exit;
		}
			
	// advance to next position
	var entrantStruct = list[edit_score];
	var entrantRoundStats = entrantStruct.roundStats;
				
	keypad_set_value(edit_score_pos,entrantRoundStats.grossFront);
	}