
function scr_calculate_net_scores() {

	payout_low_net_winnings(entrantResultsList,"netFront","frontWinnings");
	payout_low_net_winnings(entrantResultsList,"netBack","backWinnings");
	payout_low_net_winnings(entrantResultsList,"netTotal","allHolesWinnings");
	}

function payout_low_net_winnings(tempArr,sortKey,winningKey) {
		
	array_sort_struct(tempArr,sortKey,true,["eventScores"]);

	// rank individuals
	var rank = 1;
	for(var i=0;i<array_length(tempArr);i++) {
		
		var tempMemberStruct = tempArr[i];
		var eventScores = tempMemberStruct.eventScores;
		var eventResults = tempMemberStruct.eventResults;
		
		// if score is worse than previous team
		if (i > 0) {

			var prevScore = tempArr[i-1].eventScores[$ sortKey];
			var currScore = eventScores[$ sortKey];
		
			if (currScore > prevScore)
			rank++;
			}

		// assign rank
		eventResults.resultRanking[$ sortKey] = rank;
		}
		
	// loop through winning slots
	var entrantMax = min(PAYOUT_TABLES.lowNetPayoutMax,ENTRANT_COUNT)-1;
	var payoutTableArray = PAYOUT_TABLES.lowNetPayout[entrantMax];
	for(var i=0;i<array_length(payoutTableArray);i++) {
		
		var payoutPot = real(payoutTableArray[i]);

		while (payoutPot > 0) // while there is money in the pot
		for(var j=0;j<array_length(tempArr);j++) {
			
			var memberStruct = tempArr[j];
			var eventResults = memberStruct.eventResults;

			// if rank equals payout index
			if (eventResults.resultRanking[$ sortKey] == i+1) {

				eventResults[$ winningKey]++;
				payoutPot--;
				}
				
			if (payoutPot == 0)
			break;
			}
		}
	}