function scr_calculate_net_scores() {

	var entrantList = create_entrant_list();
	
	payout_low_net_winnings(entrantList,"netFront","frontWinnings");
	payout_low_net_winnings(entrantList,"netBack","backWinnings");
	payout_low_net_winnings(entrantList,"netTotal","allHolesWinnings");
	}

function create_entrant_list() {
	
	var list = [];
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];	
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];
			array_push(list,memberStruct);
			}
		}
		
	return list;
	}

function payout_low_net_winnings(tempArr,sortKey,winningKey) {
		
	array_sort_struct(tempArr,sortKey,true,["roundStats"]);

	// rank individuals
	var rank = 1;
	for(var i=0;i<array_length(tempArr);i++)
		{
		var tempMemberStruct = tempArr[i].roundStats;
		
		// if score is worse than previous team
		if (i > 0) {

			var prevScore = tempArr[i-1].roundStats[$ sortKey];
			var currScore = tempMemberStruct[$ sortKey];
		
			if (currScore > prevScore)
			rank++;
			}

		// assign rank
		tempMemberStruct.resultRanking[$ sortKey] = rank;
		}

	// loop through winning slots
	var payoutTableArray = PAYOUT_TABLES.lowNetPayout[ENTRANT_COUNT-1];
	for(var i=0;i<array_length(payoutTableArray);i++)
		{
		var payoutPot = real(payoutTableArray[i]);

		while (payoutPot > 0) // while there is money in the pot
		for(var j=0;j<array_length(tempArr);j++) {
			
			var memberStruct = tempArr[j];

			// if rank equals payout index
			if (memberStruct.roundStats.resultRanking[$ sortKey] == i+1) {

				memberStruct.eventWinnings[$ winningKey]++;
				payoutPot--;
				}
				
			if (payoutPot == 0)
			break;
			}
		}
	}