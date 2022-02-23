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
		winningStruct.entryFee = -real(ENTRY_FEES.lowNetEntry)-(noTeam*real(ENTRY_FEES.teamEntry))-real(ENTRY_FEES.skinsEntry)-(blind*real(ENTRY_FEES.blindFee));
		
		// blind winning
		if blind {
			
			var blindInd = memberStruct.roundStats.blindTeam;
			var teamFront = TEAM_LIST[blindInd].teamWinnings.frontWinnings;
			var teamBack = TEAM_LIST[blindInd].teamWinnings.backWinnings;
			var teamTotal = TEAM_LIST[blindInd].teamWinnings.allHolesWinnings;
		
			winningStruct.blindWinning = teamFront+teamBack+teamTotal;
			}
		
		// winningStruct.skinsGross
		// winningStruct.skinsNet
		// winningStruct.winSubtotal
		// winningStruct.winGrandTotal
		
		//cs(js(memberStruct))
		//sm("")
		}
		
	cs(js(entrantResultsList))
	sm("")
		
	
	exit;
	

	// calculate final score
	for(var i=0;i<ds_grid_height(scores_grid);i++)
	scores_grid[# 23,i] = scores_grid[# 12,i]+((no_net_skins+no_gross_skins)*10); // grand total
	}

function scr_calculate_skins_count() {
	
	var grossCount = 0;
	var netCount = 0;
	
	for(var i=0;i<team_number+1;i++)
		{
		var teamStruct = TEAM_LIST[i];	
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)
			{
			var memberStruct = teamStruct.members[j];
			var roundStats = memberStruct.roundStats;
			
			grossCount += real(roundStats.skinsGross);
			netCount += real(roundStats.skinsNet);
			}
		}
		
	no_gross_skins = (grossCount == 0);
	no_net_skins = (netCount == 0);

	// default count to 1 if 0
	if no_gross_skins
	grossCount = 1;

	if no_net_skins
	netCount = 1;
		
	return {gross: grossCount, net: netCount}
	}