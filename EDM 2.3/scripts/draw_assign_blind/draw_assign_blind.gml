function draw_assign_blind() {
	
	if (select_blind_team == undefined)
	exit;

	var struct = select_blind_team;
	var eventDetails = struct.activeEvent.eventDetails;

	var xx = 160;
	var yy = 150;
	var ww = 580;
	var hh = 300;
	var hsep = 70;
	var vsep = 70;
	var sep = hsep+20;

	// click out/cancel
	if android_back || (!scr_mouse_position_room_released(xx,yy,ww,hh,noone,true,true) && mouse_check_button_released(mb_left) && !global.clicked) {
		
	   select_blind_team = undefined;
	   global.clicked = true;
	   exit;
	   }
	   
	// darken back
	draw_line_pixel(0,0,room_width,room_height,c_black,0.3);

	// background
	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_text_centered(xx,yy,"Select Blind Team",45,ww,45);

	var get_team = eventDetails.teamAssigned; // current team player is on
	for(var i=0;i<team_number+1;i++) {
		
		var blindTeamStruct = TEAM_LIST[i];
	    var tot_size = array_length(blindTeamStruct.members)+array_length(variable_struct_get_names(blindTeamStruct.blindMembers));
		var team_maxed = (tot_size == teamMemberMax);
	    var gray_out = (get_team == i) || team_maxed // team list size isn't maxed out
    
	    var alph = 0.4+(!gray_out*0.6);
	    draw_set_alpha(alph);
	    draw_rectangle(xx+30+(i*sep),yy+120,xx+30+hsep+(i*sep),yy+120+vsep,true);
		
		if team_maxed {
			
			draw_set_font(fn_italic);
			draw_text_centered(xx+30+(i*sep),yy+190,"maxed",25,hsep,,appblue,0.8);
			draw_set_font(fn_normal);
			}
    
	    if draw_text_button(xx+30+(i*sep),yy+120,i+1,45,hsep,vsep,,alph,,true) && !gray_out {
			
	        eventDetails.blindTeam = i; // assign blind team
	        blind_struct_add_member(select_blind_team,i); // add to the blind list
	        select_blind_team = undefined;
	        break;
	        }
	    }
    
	draw_set_alpha(1);
	}
	
function blind_struct_add_member(struct,teamInd) {
	
	var memberDetails = struct.memberDetails;
	var key = memberDetails.lastName;
	
	TEAM_LIST[teamInd].blindMembers[$ key] = struct;
	}
	
function blind_struct_remove_member(struct,teamInd) {

	var memberDetails = struct.memberDetails;
	var key = memberDetails.lastName;
	
	variable_struct_remove(TEAM_LIST[teamInd].blindMembers,key);
	}