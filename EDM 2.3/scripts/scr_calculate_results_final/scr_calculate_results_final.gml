function scr_calculate_results_final() {
		
	// loop through results list
	for(var i=0;i<array_length(entrantResultsList);i++) {
		
		var memberStruct = entrantResultsList[i];
		var winningStruct = memberStruct.eventWinnings;
		var teamInd = memberStruct.teamAssigned;
		var blind = (memberStruct.roundStats.blindTeam != undefined);
		var noTeam = !memberStruct.roundStats.noTeam || (team_number == 0);
	
		// apply team winnings
		var teamFront = TEAM_LIST[teamInd].teamWinnings.frontWinnings;
		var teamBack = TEAM_LIST[teamInd].teamWinnings.backWinnings;
		var teamTotal = TEAM_LIST[teamInd].teamWinnings.allHolesWinnings;
		
		winningStruct.lowNetWinning = winningStruct.frontWinnings+winningStruct.backWinnings+winningStruct.allHolesWinnings;
		winningStruct.teamWinning = teamFront+teamBack+teamTotal;
		winningStruct.entryFee = real(ENTRY_FEES.lowNetEntry)+(noTeam*real(ENTRY_FEES.teamEntry))+real(ENTRY_FEES.skinsEntry)+(blind*real(ENTRY_FEES.blindFee));
		
		// blind winning
		if blind {
			
			var blindInd = memberStruct.roundStats.blindTeam;
			var teamFront = TEAM_LIST[blindInd].teamWinnings.frontWinnings;
			var teamBack = TEAM_LIST[blindInd].teamWinnings.backWinnings;
			var teamTotal = TEAM_LIST[blindInd].teamWinnings.allHolesWinnings;
		
			winningStruct.blindWinning = teamFront+teamBack+teamTotal;
			}
		
		winningStruct.winSubtotal = winningStruct.lowNetWinning+winningStruct.skinsTotalWinnings+winningStruct.teamWinning+winningStruct.blindWinning;
		
		var noSkinsRefund = (no_net_skins+no_gross_skins)*real(ENTRY_FEES.skinsEntry)*0.5;
		winningStruct.winGrandTotal = winningStruct.winSubtotal+noSkinsRefund-winningStruct.entryFee;
		
		//cs(js(memberStruct))
		//sm("")
		}
		
	cs(js(entrantResultsList))
	sm("")
	}
