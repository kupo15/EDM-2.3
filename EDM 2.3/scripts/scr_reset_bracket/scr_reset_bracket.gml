function clear_all_teams() {
	
	for(var i=0;i<array_length(TEAM_LIST);i++) {
		
		var teamStruct = TEAM_LIST[i];
		var teamMembers = teamStruct.members;
		
		var size = array_length(teamMembers);
		for(var j=0;j<size;j++) {
			
			var memberStruct = teamMembers[j];
			remove_from_team(teamMembers,j,memberStruct);
			
			size--;
			j--;
			}
		}

	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list,false);
	clear_all_safty = true;
	}
	
function event_create_new() {
	
	clear_all_safty = true;
	screen_change(screenEnum.homeScreen,true);
	}
