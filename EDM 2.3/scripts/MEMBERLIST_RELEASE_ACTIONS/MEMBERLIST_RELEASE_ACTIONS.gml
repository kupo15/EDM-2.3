
function memberlist_release_actions() {
	
	if (list_slot == undefined) || !mouse_check_button_released(mb_left)
	exit;
	
	// member
	var ind = list_slot+scrollbar_get_offset(scrollbarIndex.homeMemberList);
	var entryStruct = MEMBERS_LIST.list[ind];
	
	// release entry actions
	var swipeLeft = (global.mouse_xdist <= -100);
	var swipeRight = (global.mouse_xdist >= 200);
	var addTeam = !deleting_member;
		
	switch true
		{
		case swipeLeft: memberlist_swipe_left(ind,entryStruct); break;
		case swipeRight: memberlist_swipe_right(ind,entryStruct); break;
		case addTeam: memberlist_add_to_team(ind,entryStruct); break;
		}
			
	list_slot = undefined;
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
	
	var eventDetails = entryStruct.activeEvent.eventDetails;
	var teamGroup = TEAM_LIST[team_index].members;
	var canAdd = (array_length(teamGroup) < teamMemberMax);
	
	if !canAdd
	exit;
	
	eventDetails.teamAssigned = team_index;
	array_push(teamGroup,entryStruct); // add to group
	ENTRANT_COUNT++; // add to entrant number
		
	array_delete(MEMBERS_LIST.list,ind,1); // remove from members list
	member_scroll_offset = clamp(member_scroll_offset,0,array_length(MEMBERS_LIST.list)-memberListDisplayCount);

	scr_play_sound(snd_tap0);
	}
	
function remove_from_team(teamArr,ind,memberStruct) {
	   
	var eventDetails = memberStruct.activeEvent.eventDetails;	
	eventDetails.teamAssigned = undefined;
	
	array_delete(teamArr,ind,1);
	ENTRANT_COUNT--; // remove from entrant count
         		 
	// add back to member list
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var listEntry = list[i];
		var memberDetails = listEntry.memberDetails;
		
		if memberDetails.favorite
		continue;
		
		array_insert(list,i,memberStruct);
		break;
		}    
	}