function scr_calculate_missing_fields(){

	// loop through teams
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];
		
		if (noTeamCount != ENTRANT_COUNT)
		teamStruct.teamNetTotal = real(teamStruct.teamNetFront)+real(teamStruct.teamNetBack);
		
		// members
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)
			{
			var memberStruct = teamStruct.members[j];
			var roundStats = memberStruct.roundStats;
			
			var courseHandicap = scr_calculate_member_handicaps();
			var frontAdj = ceil(courseHandicap*0.5);
			var backAdj = floor(courseHandicap*0.5);
			
			roundStats.netFront = roundStats.grossFront-frontAdj;
			roundStats.netBack = roundStats.grossBack-backAdj;
			roundStats.netTotal = roundStats.netFront+roundStats.netBack;
			}
		}
	}