function clear_all_teams() {
	
	for(var i=0;i<array_length(TEAM_LIST);i++) {
		
		var teamStruct = TEAM_LIST[i];
		var teamMembers = teamStruct.members;
		
		members_return_to_memberlist(teamMembers);
		}

	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list,false);
	clear_all_safty = true;
	}
	
function members_return_to_memberlist(arr) {
	
	var size = array_length(arr);
	for(var i=0;i<size;i++) {
			
		var memberStruct = arr[i];
		remove_from_team(arr,i,memberStruct);
			
		size--;
		i--;
		}
	}
	
function event_create_new() {
	
	var list = EVENT_HISTORY;
	var lastEventInd = array_length(list)-1;
	
	var arr = deep_copy(list[lastEventInd].entrantResults);
	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		
		with memberStruct {
						
			activeEvent = new MemberEvent();
			memberStats.seasonEarningsPrev = memberStats.seasonEarnings;
			}
		
		// push back to the members list
		array_push(MEMBERS_LIST.list,memberStruct);
		}
	
	// reset
	SAVE_FILE.activeEvent = new ActiveEvent();
	
	// sort members list
	clear_all_safty = true;
	resultsEdited = false;
	close_enough_shown = false;
	close_enough_skip = false;
	
	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list,false);
	save_program;
	screen_change(screenEnum.homeScreen,true);
	}
