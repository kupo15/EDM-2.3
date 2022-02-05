function draw_team_list(ysep) {

	draw_set_color(c_black);

	// draw team boxes to select
	var xx = 470;
	var yy = 20;
	var hsep = 80;
	var region_ww = hsep;
	var region_hh = 60;
		
	for(var i=0;i<teams_max;i++)
	    {
		var selected = (i == team_index);
	    var size = ds_list_size(team_list[i]);
	    var col = c_black;
    
		// draw number of entrants dots
	    for(var n=0;n<size;n++)
	    draw_circle(xx+10+(n*10)+(i*hsep),yy+55,4,false);
    
		// draw team boxes
		if selected {

			draw_set_alpha(0.3);
		    draw_rectangle_colour(xx+(i*hsep),yy,xx-1+(i*hsep)+hsep,yy+region_hh,c_yellow,c_yellow,c_yellow,c_yellow,false); 
			}

		draw_set_alpha(1);
	    draw_rectangle_colour(xx+(i*hsep),yy,xx-1+(i*hsep)+hsep,yy+region_hh,col,col,col,col,true); // outline
	    draw_text_centered(xx+(i*hsep),yy,string(i+1),50,region_ww,region_hh); // draw team index
		
		// select team
	    if scr_mouse_position_room_pressed(xx+(i*hsep),yy,hsep,60,mb_left,true,true)
	    team_index = i;
	    }
    
	// draw team list
	xx += 60;
	yy += 100;
	var ww = button_ww;
	var hh = button_sep*5-7;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true); // draw outline
	draw_text_centered(xx,yy-30,"Team "+string(team_index+1),35,ww); // draw team list number
    
	// draw team list
	var teamList = team_list[team_index];
	var size = ds_list_size(teamList);
	for(var i=0;i<size;i++)
	    {
		var memberStruct = teamList[| i];
		var name = memberStruct.name;
		var yoff = (i*ysep);
		
	    // draw team member names
	    var spr_ind = scr_mouse_position_room(xx,yy+yoff,ww,button_sep,mb_left,true);
        
	    draw_sprite(spr_member_button,spr_ind,xx,yy+yoff); // draw button
	    draw_text_centered(xx,yy+yoff,name,45,button_ww,button_hh); // draw player's name
                 
	    // clicked on name
	    if scr_mouse_position_room_released(xx,yy+yoff,ww,button_sep,mb_left,false)
	    remove_from_team();
	    }
	}

function remove_from_team() {
	   
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
