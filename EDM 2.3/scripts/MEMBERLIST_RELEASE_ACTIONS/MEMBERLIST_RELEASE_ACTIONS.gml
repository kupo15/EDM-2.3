
function memberlist_release_actions() {
	
	if (list_slot == noone)
	exit;
	
	// member
	var ind = list_slot+member_scroll_offset;
	var entryStruct = MEMBERS_LIST.list[ind];
	
	// release entry actions
	var swipeLeft = (mouse_xdist <= -100);
	var swipeRight = (mouse_xdist >= 200);
	var addTeam = !deleting_member;
		
	if mouse_check_button_released(mb_left) {
			
		switch true
		    {
			case swipeLeft: memberlist_swipe_left(ind,entryStruct); break;
			case swipeRight: memberlist_swipe_right(ind,entryStruct); break;
			case addTeam: memberlist_add_to_team(ind,entryStruct); break;
			}
			
		list_slot = noone;
		}
	}

function memberlist_swipe_left(ind,entryStruct) {
// archive member	
	
	array_push(MEMBERS_LIST.archived,entryStruct); // add to the archived list
	array_delete(MEMBERS_LIST.list,ind,1); // delete from member list
               
	member_scroll_offset = clamp(member_scroll_offset,0,array_length(MEMBERS_LIST.list)-memberListDisplayCount);
				   
	audio_play_sound(snd_tap0,0,false);
	}
	
function memberlist_swipe_right(ind,entryStruct) {			
	                            
	// remove from favorites list
	if entryStruct.favorite {
		
		entryStruct.favorite = false;
		entryStruct.recent = date_current_datetime();
		}
	else {
		// add to favorites
		entryStruct.favorite = true;
		entryStruct.recent = -1;
		}

	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list);
	audio_play_sound(snd_tap0,0,false);
	}
	
function memberlist_add_to_team(ind,entryStruct) {
	
	var teamGroup = TEAM_LIST[team_index];
	
	if (array_length(teamGroup) < 5) {
		// add to team
		
		entryStruct.teamAssigned = team_index;
		array_push(teamGroup,entryStruct); // add to group
		array_delete(MEMBERS_LIST.list,ind,1); // remove from members list
		
		audio_play_sound(snd_tap0,0,false);
		}
	else {
		
		entryStruct.teamAssigned = undefined;
		audio_play_sound(snd_tap0,0,false);
		}

	exit;
	if ds_list_size(team_list[team_index]) < 5 // limit team size
		{// click name
		ds_list_add(entrant_list,ind); // add to entrant list
		ds_list_add(team_list[team_index],ind); // add to team list
		ds_list_delete(member_list,i+member_scroll_offset); // delete from member list
                      
		member_scroll_offset = clamp(member_scroll_offset,0,list_size-disp_count-1);						  
                      
		if (i+member_scroll_offset < last_entrant_number) // if moving last entrant number
		last_entrant_number = max(last_entrant_number-1,0);
		}
	}