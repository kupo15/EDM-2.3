function scr_create_teams() {

	entrant_list = [];
	team_number = -1; // reset

	// shift members over to skip blank teams
	var missingIndex = false;
	var list = TEAM_LIST;
	var maxTeams = array_length(list);
	for(var i=0;i<maxTeams;i++) {
		
		var teamMemberList = list[i].members;
		
		var teamSize = array_length(teamMemberList);
		if (teamSize != 0) {
			
			team_number++;
		
			// assign team number and add to entrant list
			for(var j=0;j<teamSize;j++) {
			
				var memberStruct = teamMemberList[j];
				var memberDetails = memberStruct.memberDetails;
				var eventDetails = memberStruct.activeEvent.eventDetails;
				
				if (memberDetails.handicapIndex == undefined)
				missingIndex = true;
									
				eventDetails.teamAssigned = team_number;
				eventDetails.entrantNumber = array_length(entrant_list);
				
				if !missingIndex
				eventDetails.courseHandicap = calculate_member_course_handicap(memberStruct);
				
				array_push(entrant_list,memberStruct);
				}
			}
		}
		
	if missingIndex {
		
		screen_change(screenEnum.missingIndex);
		exit;
		}
		
	// disable team scores and entry fees
	if (team_number == 0)
	eventType = eventEnum.individual;
	
	skins_input = true;
	screen_change(screenEnum.eventRunning);
	scr_sort_members(MEMBERS_LIST.list);
	}
