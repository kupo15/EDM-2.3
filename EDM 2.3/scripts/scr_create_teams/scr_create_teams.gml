function scr_create_teams() {

	entrant_list = [];
	team_number = -1; // reset

	// shift members over to skip blank teams
	var list = TEAM_LIST;
	var maxTeams = array_length(list);
	for(var i=0;i<maxTeams;i++) {
		
		var teamMemberList = list[i].members;
		
		var teamSize = array_length(teamMemberList);
		if (teamSize != 0) {
			
			team_number++;
		
			// assign team number and add to entrant list
			for(var j=0;j<teamSize;j++) {
			
				var member = teamMemberList[j];
				var memberDetails = member.memberDetails;
				var eventDetails = member.eventDetails;
				
				eventDetails.teamAssigned = team_number;
				eventDetails.entrantNumber = array_length(entrant_list);
				memberDetails.handicapIndex = calculate_member_handicap_index(member);
				eventDetails.courseHandicap = calculate_member_course_handicap(memberDetails.handicapIndex,memberDetails.teeColor);
				
				array_push(entrant_list,member);
				}
			}
		}

	// disable team scores and entry fees
	eventType = pick(eventEnum.team,eventEnum.individual,team_number == 0);
	
	skins_input = true;
	screen_change(screenEnum.eventRunning);
	scr_sort_members(MEMBERS_LIST.list);
	}
