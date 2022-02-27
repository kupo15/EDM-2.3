function draw_entrant_count_label(xx,yy) {
	
	if (eventType == eventEnum.team) {
		
		var size = team_number+1;
		var str = "team "+string(team_index_entry+1);
		}
	else {
		
		var size = ENTRANT_COUNT;
		var str = "entrant "+string(edit_score+1);
		}
		
	// draw label
	draw_text_height(xx,yy,str+"/"+string(size),25);
	}

function draw_edit_score_all() {
	
	var xx = 0;
	var yy = 0;
	var ww = 920;
	var hh = room_height;

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy,ww+10,hh+10,noone,false) && mouse_check_button_released(mb_left) && !TEELIST_ACTIVE && !edit_score_scrolling) {
		
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

	draw_text_centered(xx+15,yy+10,"ENTER GROSS SCORE:",35,,);
	
	//scr_entrant_scrolling(xx,yy,hh);

	// number of teams
	draw_entrant_count_label(xx+430,yy+25);

	// submit button
	var can_click = !TEELIST_ACTIVE && (select_blind_team == undefined);
	var b_ww = 200;
	var b_hh = 90;
	var b_xx = xx+180;
	var b_yy = yy+hh-10-b_hh;
	var col = make_colour_rgb(69,117,228);
	var submit = draw_text_button(b_xx,b_yy,"SUBMIT",45,b_ww,b_hh,col,,,true,can_click);
	
	draw_rectangle(b_xx,b_yy,b_xx+b_ww,b_yy+b_hh,true);

	// headers
	var yy = 180;
	var height = 25;
	var c_col = appblue;

	//draw_text_centered(30,yy-height*1.8,"Team "+string(team_index_entry+1),height*1.8,,height*2,c_col);
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

function draw_selected_edit_score(xx,list,size) {
	
	var can_click = !TEELIST_ACTIVE && (select_blind_team == undefined);
	
	var yy = 120;
	var sep = 35;
	var height = 70;
	
	for(var i=0;i<1;i++) {
			
	    var ind = (edit_score+i+edit_score_offset+size) mod size;
		var xoff = (edit_score_scrolling_offset*500)+(i*500);
		
		var entrant = list[ind]; // get_entrant_by_id(ind);
		var entrantDetails = entrant.memberDetails;
		var eventDetails = entrant.eventDetails;
			
		// draw player's name
	    draw_text_centered(xx+20+xoff,115-height,entrantDetails.fullName,height,);
		
		// draw tee
		var struct = TEE_DATA[$ entrantDetails.teeColor];
		var teeStr = entrantDetails.teeColor+" tees";
		
		draw_sprite_ext(ico_tee_marker,0,xx+20+xoff,yy+(sep*0.5*1.3),1,1,0,struct.color,1);
		draw_text_centered(xx+40+xoff,yy,teeStr,sep,,sep*1.3);
		
		if draw_text_button(xx,yy,"",sep,220,sep*1.3,,,,true,can_click)	
		tee_popover_init(entrant,,room_height,,entrantDetails.teeColor);
		
		// draw chevron
		var ww = string_width_height(teeStr,sep);
		draw_icon(ico_chevron_down,0,xx+40+ww+xoff,yy,36,sep*1.3);
		
		// draw course handicap
		draw_text_centered(xx+230+xoff,yy,"HCP: "+string(eventDetails.courseHandicap),sep*0.9,,sep*1.3);
		}
		
	return list[ind];
	}

function draw_edit_score_player_popup_buttons(entrant,can_click) {
	
	if (eventType == eventEnum.individual)
	exit;
	
	var eventDetails = entrant.eventDetails;
	
	// draw blind
	var b_xx = 640;
	var b_yy = 55;
	var b_ww = 36;
		
	var _blindInd = eventDetails.blindTeam;
			
	draw_text_button(b_xx,b_yy-b_ww-15,"Blind",35,b_ww,65);	
			
	if (_blindInd == undefined)
	draw_icon(ico_checkbox,0,b_xx,b_yy,b_ww,b_ww);
	else
	draw_text_centered(b_xx,b_yy,"T"+string(_blindInd+1),45,b_ww,36); // team the blind is assigned to
			
	// clicked blind
	if scr_mouse_position_room_released(b_xx,b_yy,b_ww,b_ww,mb_left,true,true,can_click) {
				
		// assign blinds
		if (_blindInd == undefined) {
					
			select_blind_team = entrant;
			}
		else { // remove from blinds
			
			blind_struct_remove_member(entrant,_blindInd);
			eventDetails.blindTeam = undefined;
			}
		}
	
	// no team
	var b_xx = 790;
		
	if draw_icon_click(ico_checkbox,eventDetails.noTeam,b_xx,b_yy,b_ww,b_ww,,,,can_click,true) {
	
		eventDetails.noTeam = !eventDetails.noTeam;
		noTeamCount += pick(-1,1,eventDetails.noTeam);
		}

	draw_text_button(b_xx,b_yy-b_ww-15,"No Team",35,b_ww,65);
	}

function draw_edit_score_player_popup() {
	
	var can_click = !TEELIST_ACTIVE && (select_blind_team == undefined);
	var xx = 0;
	var list = TEAM_LIST[team_index_entry].members;
	var size = array_length(list);

	var entrant = draw_selected_edit_score(xx,list,size);
		
	// cutoff 
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(520,0,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);
	
	draw_edit_score_player_popup_buttons(entrant,can_click);
	
	// draw list of members
	var yy = 180+50;
	var height = 35;
	var sep = 50;
	for(var i=0;i<size;i++)	{
		
		var memberData = list[i];
		var entrantDetails = memberData.memberDetails;
		var entrantRoundStats = memberData.eventScores;

		var name = entrantDetails.fullName;
					
		// member name
		draw_text_centered(15,yy+(i*sep),string(i+1)+". "+name,height,,sep*1.2,,,);
		
		if draw_icon_click(,,0,yy+(i*sep),340,sep,,,false,can_click,true)
		edit_score = i;
		
		// member scores
		if draw_text_button(340,yy+(i*sep),draw_value(entrantRoundStats.grossFront,"-"),height,70,sep,,,,true,can_click) {
			
			edit_score = i;
			edit_score_pos = entryType.memberFront;
			keypad_set_value(edit_score_pos,entrantRoundStats.grossFront);
			}
		
		if draw_text_button(410,yy+(i*sep),draw_value(entrantRoundStats.grossBack,"-"),height,70,sep,,,,true,can_click) {

			edit_score = i;
			edit_score_pos = entryType.memberBack;
			keypad_set_value(edit_score_pos,entrantRoundStats.grossBack);
			}
		
		if draw_text_button(480,yy+(i*sep),draw_value(entrantRoundStats.grossAdj,"-"),height,70,sep,,,,true,can_click) {
			
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
		draw_icon(,,340+xoff,180,70,sep,c_blue,0.3);
		}
	
	// if an individual event
	if (eventType == eventEnum.individual)
	exit;	
		
	// draw team score
	var xx = 20;
	var yy = 180;
	var height = 35;
	var c_col = appblue;

	draw_text_centered(xx,yy,"Team "+string(team_index_entry+1)+" Net Score",height,,sep+1.1,c_col);
	draw_line_pixel(xx,yy+sep,540,1,,0.5);	
	
	var list = TEAM_LIST[team_index_entry];
	
	if draw_text_button(340,yy,draw_value(list.teamNetFront,"-"),height,70,sep,,,,true,can_click) {
		
		edit_score_pos = entryType.teamFront;
		keypad_set_value(edit_score_pos,list.teamNetFront,,true);
		}
	
	if draw_text_button(410,yy,draw_value(list.teamNetBack,"-"),height,70,sep,,,,true,can_click) {
		
		edit_score_pos = entryType.teamBack;
		keypad_set_value(edit_score_pos,list.teamNetBack,,true);
		}
					
	// draw Next Team button
	var xx = 400;
	var yy = 500;
	var ww = 150;
	var height = 30;
	var hh = 90; // height*1.5;
	var alpha = 1;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	if draw_text_button(xx,yy,"Next Team",height,ww,hh,,alpha,,true,can_click) {
		
		edit_score_pos = entryType.memberEntryNext;
		entry_scores_individual_submit();
		}
	
	// draw Prev Team button
	var xx = 10;
	var yy = 500;
	var ww = 150;
	var height = 60;
	var hh = 90; // height*1.5;
	var alpha = 1;
	
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	if draw_text_button(xx,yy,"Previous\nTeam",height,ww,hh,,alpha,,true,can_click) {
		
		team_index_entry -= 2;
		edit_score_pos = entryType.memberEntryNext;
		entry_scores_individual_submit();
		}
		
	// highlight
	if (edit_score_pos == entryType.memberEntryNext) 
	draw_icon(,,xx,yy,ww,hh,c_blue,0.3);
	}

function draw_edit_score() {
	
	if (edit_score == noone) && (edit_team_score == noone)
	exit;

	draw_edit_score_all();
	
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
	
	if (team_index_entry < -1)
	team_index_entry = team_number-1;
	
	var ind = max(0,team_index_entry);
	var list = TEAM_LIST[ind].members;
	var teamSize = array_length(list);
	var entrantStruct = list[edit_score];
	var entrantRoundStats = entrantStruct.eventScores;

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
				
											// loop
											team_index_entry = 0;
											break; 
											
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
	var entrantRoundStats = entrantStruct.eventScores;
				
	keypad_set_value(edit_score_pos,entrantRoundStats.grossFront);
	}