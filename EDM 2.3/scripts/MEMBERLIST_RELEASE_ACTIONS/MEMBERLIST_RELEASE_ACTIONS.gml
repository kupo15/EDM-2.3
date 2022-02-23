
function memberlist_release_actions() {
	
	if (list_slot == noone)
	exit;
	
	// member
	var ind = list_slot+member_scroll_offset;
	var entryStruct = MEMBERS_LIST.list[ind];
	
	// release entry actions
	var swipeLeft = (global.mouse_xdist <= -100);
	var swipeRight = (global.mouse_xdist >= 200);
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
	
	var teamGroup = TEAM_LIST[team_index].members;
	
	if (array_length(teamGroup) < teamMemberMax) {
		// add to team
		
		entryStruct.teamAssigned = team_index;
		array_push(teamGroup,entryStruct); // add to group
		ENTRANT_COUNT++; // add to entrant number
		
		array_delete(MEMBERS_LIST.list,ind,1); // remove from members list
		member_scroll_offset = clamp(member_scroll_offset,0,array_length(MEMBERS_LIST.list)-memberListDisplayCount);

		audio_play_sound(snd_tap0,0,false);
		}
	else {
		
		entryStruct.teamAssigned = undefined;
		audio_play_sound(snd_tap0,0,false);
		}
	}