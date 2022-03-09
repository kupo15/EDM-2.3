function scr_calculate_missing_fields() {

	var isTeamEvent = (noTeamCount != ENTRANT_COUNT) && (eventType == eventEnum.team);

	// loop through teams
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];
		
		if isTeamEvent
		teamStruct.teamNetTotal = real(teamStruct.teamNetFront)+real(teamStruct.teamNetBack);
		
		// members
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++) {
			
			var memberStruct = teamStruct.members[j];
			var eventScores = memberStruct.activeEvent.eventScores;
			var eventDetails = memberStruct.activeEvent.eventDetails;
			
			var courseHandicap = pick(0,eventDetails.courseHandicap,eventDetails.courseHandicap!= undefined);
			var moreStrokes = ceil(courseHandicap*0.5);
			var lessStrokes = floor(courseHandicap*0.5);
			
			var frontAdj = pick(moreStrokes,lessStrokes,COURSE_DATA.courseData.evenHandicapHoles);
			var backAdj = pick(moreStrokes,lessStrokes,!COURSE_DATA.courseData.evenHandicapHoles);
			
			eventScores.netFront = eventScores.grossFront-frontAdj;
			eventScores.netBack = eventScores.grossBack-backAdj;
			eventScores.netTotal = eventScores.netFront+eventScores.netBack;
			}
		}
	}