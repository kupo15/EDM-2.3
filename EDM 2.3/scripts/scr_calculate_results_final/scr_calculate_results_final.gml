function scr_calculate_results_final() {
		
	// loop through results list
	for(var i=0;i<array_length(entrantResultsList);i++) {
		
		var memberStruct = entrantResultsList[i];
		var payoutBreakdown = memberStruct.activeEvent.eventResults.payoutBreakdown;
		var eventDetails = memberStruct.activeEvent.eventDetails;
		
		var teamInd = eventDetails.teamAssigned;
		var teamEntered = !eventDetails.noTeam && (eventType == eventEnum.team);
		var blind = (eventDetails.blindTeam != Undefined) && teamEntered;
	
		// apply team winnings
		var teamFront = TEAM_LIST[teamInd].teamWinnings.frontWinnings;
		var teamBack = TEAM_LIST[teamInd].teamWinnings.backWinnings;
		var teamTotal = TEAM_LIST[teamInd].teamWinnings.allHolesWinnings;
		
		payoutBreakdown.lowNetWinning = payoutBreakdown.frontWinnings+payoutBreakdown.backWinnings+payoutBreakdown.allHolesWinnings;
		payoutBreakdown.teamWinning = teamFront+teamBack+teamTotal;
		payoutBreakdown.entryFee = real(ENTRY_FEES.lowNetEntry)+(teamEntered*real(ENTRY_FEES.teamEntry))+real(ENTRY_FEES.skinsEntry)+(blind*real(ENTRY_FEES.blindFee));
		
		// blind winning
		if blind {
			
			var blindInd = eventDetails.blindTeam;
			var teamFront = TEAM_LIST[blindInd].teamWinnings.frontWinnings;
			var teamBack = TEAM_LIST[blindInd].teamWinnings.backWinnings;
			var teamTotal = TEAM_LIST[blindInd].teamWinnings.allHolesWinnings;
		
			payoutBreakdown.blindWinning = teamFront+teamBack+teamTotal;
			}
		
		payoutBreakdown.winSubtotal = payoutBreakdown.lowNetWinning+payoutBreakdown.skinsTotalWinnings+payoutBreakdown.teamWinning+payoutBreakdown.blindWinning;
		
		var noSkinsRefund = (no_net_skins+no_gross_skins)*real(ENTRY_FEES.skinsEntry)*0.5;
		payoutBreakdown.winningGrandTotal = payoutBreakdown.winSubtotal+noSkinsRefund-payoutBreakdown.entryFee;
		
		var memberStats = memberStruct.memberStats;
		var prevEarning = pick(memberStats.seasonEarningsPrev,0,memberStats.seasonEarningsPrev==Undefined);
		
		memberStats.seasonEarnings = prevEarning+payoutBreakdown.winningGrandTotal;
		}
		
	db("calculated");
	}
