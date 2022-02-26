function draw_team_list_home(ysep) {

	var xx = 470;
	var yy = 20;

	draw_set_color(c_black);

	draw_team_list_header(xx,yy);
	draw_team_list_body(xx+60,yy+100,ysep);
	}
	
function draw_team_list_header(xx,yy) {

	var hsep = 80;
	var region_ww = hsep;
	var region_hh = 60;
		
	for(var i=0;i<teams_max;i++) {
		
		var selected = (i == team_index);
		var teamGroup = TEAM_LIST[i].members;
    
		// select team header
	    if scr_mouse_position_room_pressed(xx+(i*hsep),yy,hsep,60,mb_left,true,true)
	    team_index = i;
		
		// draw number of entrants dots
	    for(var n=0;n<array_length(teamGroup);n++)
	    draw_circle(xx+10+(n*10)+(i*hsep),yy+55,4,false);

		// draw team box outline
		var col = c_black;

		draw_set_alpha(1);
	    draw_rectangle_colour(xx+(i*hsep),yy,xx-1+(i*hsep)+hsep,yy+region_hh,col,col,col,col,true); // outline
	    draw_text_centered(xx+(i*hsep),yy,string(i+1),50,region_ww,region_hh); // draw team index

		// draw selected team
		if selected {

			draw_set_alpha(0.3);
		    draw_rectangle_colour(xx+(i*hsep),yy,xx-1+(i*hsep)+hsep,yy+region_hh,c_yellow,c_yellow,c_yellow,c_yellow,false); 
			draw_set_alpha(1);
			}
	    }
	}
	
function draw_team_list_body(xx,yy,ysep) {
	
	var ww = button_ww;
	var hh = button_sep*5-7;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true); // draw outline
	draw_text_centered(xx,yy-30,"Team "+string(team_index+1),35,ww); // draw team list number
    
	// draw team list
	var teamGroup = TEAM_LIST[team_index].members;
	var size = array_length(teamGroup);
	for(var i=0;i<size;i++) {
		
		var memberStruct = teamGroup[i];
		var memberDetails = memberStruct.memberDetails;

		var name = memberDetails.fullName;
		var yoff = (i*ysep);
		
	    // draw team member names
	    var spr_ind = scr_mouse_position_room(xx,yy+yoff,ww,button_sep,mb_left,true);
        var col = BUTTON_STYLE.bgColor;
		
	    draw_sprite_ext(spr_member_button,spr_ind,xx,yy+yoff,1,1,0,col,1); // draw button
	    draw_text_centered(xx,yy+yoff,name,45,button_ww,button_hh,BUTTON_STYLE.textColor); // draw player's name
                 
	    // clicked on name
	    if scr_mouse_position_room_released(xx,yy+yoff,ww,button_sep,mb_left,false) {
			
		    remove_from_team(teamGroup,i,memberStruct);
			size--;
			i--;
			}
	    }
	}

function remove_from_team(teamArr,ind,memberStruct) {
	   
	// remove from team
	memberStruct.teamAssigned = undefined;
	
	array_delete(teamArr,ind,1);
	ENTRANT_COUNT--; // remove from entrant count
         		 
	// add back to member list
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++)
		{	
		var listEntry = list[i];
		
		if listEntry.favorite
		continue;
		
		array_insert(list,i,memberStruct);
		break;
		}    
	}
