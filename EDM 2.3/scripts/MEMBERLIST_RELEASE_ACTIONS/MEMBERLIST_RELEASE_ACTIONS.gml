
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
				   
	scr_play_sound(snd_tap0);
	}
	
function memberlist_swipe_right(ind,entryStruct) {			
	                            
	var memberDetails = entryStruct.memberDetails;
								
	// remove from favorites list
	if memberDetails.favorite {
		
		memberDetails.favorite = false;
		memberDetails.recent = date_current_datetime();
		}
	else {
		// add to favorites
		memberDetails.favorite = true;
		memberDetails.recent = -1;
		}

	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list);
	scr_play_sound(snd_tap0);
	}
	
function memberlist_add_to_team(ind,entryStruct) {
	
	var eventDetails = entryStruct.eventDetails;
	var teamGroup = TEAM_LIST[team_index].members;
	
	if (array_length(teamGroup) < teamMemberMax) {
		// add to team
		
		eventDetails.teamAssigned = team_index;
		array_push(teamGroup,entryStruct); // add to group
		ENTRANT_COUNT++; // add to entrant number
		
		array_delete(MEMBERS_LIST.list,ind,1); // remove from members list
		member_scroll_offset = clamp(member_scroll_offset,0,array_length(MEMBERS_LIST.list)-memberListDisplayCount);

		scr_play_sound(snd_tap0);
		}
	else {
		
		eventDetails.teamAssigned = undefined;
		scr_play_sound(snd_tap0);
		}
	}