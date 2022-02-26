function scr_calculate_results_final() {
		
	// loop through results list
	for(var i=0;i<array_length(entrantResultsList);i++) {
		
		var memberStruct = entrantResultsList[i];
		var eventResults = memberStruct.eventResults;
		var eventDetails = memberStruct.eventDetails;
		var eventScores = memberStruct.eventScores;
		
		var teamInd = eventDetails.teamAssigned;
		var blind = (eventScores.blindTeam != undefined);
		var noTeam = !eventScores.noTeam || (team_number == 0);
	
		// apply team winnings
		var teamFront = TEAM_LIST[teamInd].teamWinnings.frontWinnings;
		var teamBack = TEAM_LIST[teamInd].teamWinnings.backWinnings;
		var teamTotal = TEAM_LIST[teamInd].teamWinnings.allHolesWinnings;
		
		eventResults.lowNetWinning = eventResults.frontWinnings+eventResults.backWinnings+eventResults.allHolesWinnings;
		eventResults.teamWinning = teamFront+teamBack+teamTotal;
		eventResults.entryFee = real(ENTRY_FEES.lowNetEntry)+(noTeam*real(ENTRY_FEES.teamEntry))+real(ENTRY_FEES.skinsEntry)+(blind*real(ENTRY_FEES.blindFee));
		
		// blind winning
		if blind {
			
			var blindInd = eventScores.blindTeam;
			var teamFront = TEAM_LIST[blindInd].teamWinnings.frontWinnings;
			var teamBack = TEAM_LIST[blindInd].teamWinnings.backWinnings;
			var teamTotal = TEAM_LIST[blindInd].teamWinnings.allHolesWinnings;
		
			eventResults.blindWinning = teamFront+teamBack+teamTotal;
			}
		
		eventResults.winSubtotal = eventResults.lowNetWinning+eventResults.skinsTotalWinnings+eventResults.teamWinning+eventResults.blindWinning;
		
		var noSkinsRefund = (no_net_skins+no_gross_skins)*real(ENTRY_FEES.skinsEntry)*0.5;
		eventResults.winningGrandTotal = eventResults.winSubtotal+noSkinsRefund-eventResults.entryFee;
		}
	}
