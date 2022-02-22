function scr_calculate_results_teams() {	
	
	var tempRanking = [];
	
	// convert values to real
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];
		var entry = {
			
			teamIndex: teamStruct.teamNumber,
			teamRank: 0,
			
			front: real(teamStruct.teamNetFront),
			back: real(teamStruct.teamNetBack),
			total: real(teamStruct.teamNetTotal),
			}
			
		array_push(tempRanking,entry);
		}

	// apply payouts
	payout_team_winnings(tempRanking,"front","frontWinnings");
	payout_team_winnings(tempRanking,"back","backWinnings");
	payout_team_winnings(tempRanking,"total","allHolesWinnings");
	}

function payout_team_winnings(tempArr,sortKey,winningKey)  {
	
	array_sort_struct(tempArr,sortKey,true);
		
	// rank teams
	var rank = 1;
	for(var i=0;i<array_length(tempArr);i++)
		{
		var tempTeamStruct = tempArr[i];
		
		// if score is worse than previous team
		if (i > 0) {

			var prevScore = tempArr[i-1][$ sortKey];
			var currScore = tempTeamStruct[$ sortKey];
		
			if (currScore > prevScore)
			rank++;
			}

		// assign rank
		tempTeamStruct.teamRank = rank; // assign to temp team
		TEAM_LIST[tempTeamStruct.teamIndex].teamWinnings[$ sortKey+"Rank"] = rank; // assign to actual team
		}

	// loop through winning slots
	var payoutTableArray = PAYOUT_TABLES.teamPayout[team_number];
	for(var i=0;i<array_length(payoutTableArray);i++)
		{
		var payoutPot = real(payoutTableArray[i]);

		while (payoutPot > 0) // while there is money in the pot
		for(var j=0;j<array_length(tempArr);j++) {
			
			var tempTeamStruct = tempArr[j];

			// if rank equals payout index
			if (tempTeamStruct.teamRank == i+1) {
		
				var teamInd = tempTeamStruct.teamIndex;
				var teamStruct = TEAM_LIST[teamInd];
		
				teamStruct.teamWinnings[$ winningKey]++;
				payoutPot--;
				}
			}
		}
	}