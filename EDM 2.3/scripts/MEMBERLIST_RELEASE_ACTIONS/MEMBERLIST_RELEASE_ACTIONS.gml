
function memberlist_release_actions() {
	
	if (list_slot == noone)
	exit;
	
	// release entry actions
	var swipeLeft = (mouse_xdist <= -100);
	var swipeRight = (mouse_xdist >= 200);
	var addTeam = !deleting_member;
		
	if mouse_check_button_released(mb_left) {
			
		switch true
		    {
			case swipeLeft: memberlist_swipe_left(); break;
			case swipeRight: memberlist_swipe_right(); break;
			case addTeam: memberlist_add_to_team(); break;
			}
			
		list_slot = noone;
		}
	}

function memberlist_swipe_left() {
	
	ds_list_delete(member_list,list_slot+member_scroll_offset); // delete from member list
               
	if (list_slot >= last_entrant_number) // not saved in recent
	ds_list_delete(member_list_save,list_slot-last_entrant_number+member_scroll_offset); // delete from member list save file
	else 
	    {
	    ds_list_delete(recent_list,list_slot); // delete from recent list
	    last_entrant_number--;
	    }
                   
	member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
				   
	list_size--;
	audio_play_sound(snd_tap0,0,false);
	}
	
function memberlist_swipe_right() {			
// add to favorites list
	                
	var ind = member_list[| i+member_scroll_offset]; // find name
                   
	if list_slot+member_scroll_offset < last_entrant_number // favorites list
	    {
	    ds_list_insert(member_list,last_entrant_number,ind); // insert at end of favorites in member list
	    ds_list_insert(member_list_save,0,ind); // insert at beginning of member list save
	    ds_list_delete(member_list,list_slot+member_scroll_offset); // delete from member list
	    ds_list_delete(recent_list,list_slot+member_scroll_offset); // delete from favorites
                       
	    last_entrant_number --; // 1 less favorite
	    }
	else // in main list
	    {
	    ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
	    ds_list_delete(member_list_save,i+member_scroll_offset-last_entrant_number); // delete from member list save file
	    ds_list_add(recent_list,ind); // add to recent list
                       
	    last_entrant_number ++;
	    ds_list_insert(member_list,last_entrant_number-1,ind); // insert to top of member list below recent
	    }

	audio_play_sound(snd_tap0,0,false);
	}
	
function memberlist_add_to_team() {
// add to team list

	if scr_mouse_position_room_released(xx,yy+(i*ysep),ww,button_sep,mb_left,false)
	if (team_index != -1)
		{
		if ds_list_size(team_list[team_index]) < 5 // limit team size
		    {// click name
		    var ind = member_list[| i+member_scroll_offset]; // find name
		    ds_list_add(entrant_list,ind); // add to entrant list
		    // ds_list_add(recent_list,ind); // add to recent list
		    ds_list_add(team_list[team_index],ind); // add to team list
		    ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
                      
		    member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);
						  
			if (member_scroll_offset < 0)
			member_scroll_offset = 0;
					  
		    list_size --;
                      
		    if (i+member_scroll_offset < last_entrant_number) // if moving last entrant number
		    last_entrant_number = max(last_entrant_number-1,0);
		    }
		}
	}