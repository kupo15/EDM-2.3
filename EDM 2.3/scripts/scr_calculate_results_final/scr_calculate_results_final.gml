function scr_calculate_results_final() {
	
	// loop through results list
	for(var i=0;i<array_length(entrantResultsList);i++) {
		
		var memberStruct = entrantResultsList[i];
		var winningStruct = memberStruct.eventWinnings;
		var teamInd = memberStruct.teamAssigned;
		var blind = (memberStruct.roundStats.blindTeam != undefined);
		var noTeam = !memberStruct.roundStats.noTeam;
	
		// apply team winnings
		var teamFront = TEAM_LIST[teamInd].teamWinnings.frontWinnings;
		var teamBack = TEAM_LIST[teamInd].teamWinnings.backWinnings;
		var teamTotal = TEAM_LIST[teamInd].teamWinnings.allHolesWinnings;
		
		winningStruct.teamWinning = teamFront+teamBack+teamTotal;
		winningStruct.entryFee = -real(ENTRY_FEES.lowNetEntry)-(noTeam*real(ENTRY_FEES.teamEntry))-real(ENTRY_FEES.skinsEntry)-(blind*real(ENTRY_FEES.blindFee));
		}
		
	cs(js(entrantResultsList))
	sm("")
		
	
	exit;
	
	var num = ENTRANT_COUNT;
	var skins_total_struct = scr_calculate_skins_count();
	var skins_gross_tot = skins_total_struct.gross; // total gross skins awarded
	var skins_net_tot = skins_total_struct.net; // total net skins awarded
	var skins_pot = real(ENTRY_FEES.skinsEntry)*ENTRANT_COUNT*0.5;

	no_gross_skins = (skins_gross_tot == 0);
	no_net_skins = (skins_net_tot == 0);

	// default count to 1 if 0
	if no_gross_skins
	skins_gross_tot = 1;

	if no_net_skins
	skins_net_tot = 1;

	var skins_gross_pot_payout = skins_pot;
	var skins_net_pot_payout = skins_pot;
	
	// loop through teams
	for(var i=0;i<team_number+1;i++)
		{
		var teamStruct = TEAM_LIST[i];	
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)
			{
			var memberStruct = teamStruct.members[j];
			var roundStats = memberStruct.roundStats;
			var eventWinnings = memberStruct.eventWinnings;
			
			eventWinnings.lowNetWinning = eventWinnings.frontWinnings+eventWinnings.backWinnings+eventWinnings.allHolesWinnings;
			eventWinnings.teamWinning = (eventWinnings.teamFrontWinnings+eventWinnings.teamBackWinnings+eventWinnings.teamAllHolesWinnings)*!roundStats.noTeam;
			
			}
		}
		
	for(var i=0;i<num;i++)
	   {
	   var ind = scores_grid[# 18,i];
	   var low_net_winnings = scores_grid_front[# 7,ind]+scores_grid_back[# 8,ind]+scores_grid_total[# 9,ind];
	   var team_winnings = (team_score_front_grid[# 3,scores_grid[# 4,i]]+team_score_back_grid[# 3,scores_grid[# 4,i]]+team_score_total_grid[# 3,scores_grid[# 4,i]])*!scores_grid[# 19,i];
	   var skins_gross_win = round(scores_grid[# 13,i]/skins_gross_tot*skins_pot);
	   var skins_net_win = round(scores_grid[# 15,i]/skins_net_tot*skins_pot);
	   var blind_winnings = 0;
	   
	   if scores_grid[# 5,i] != noone
	   blind_winnings = (team_score_front_grid[# 3,scores_grid[# 5,i]]+team_score_back_grid[# 3,scores_grid[# 5,i]]+team_score_total_grid[# 3,scores_grid[# 5,i]]);

	   // if rounding up causes higher payout than whats in pot, subtract 1   
	   if skins_gross_win > 0 
	   while skins_gross_win > skins_gross_pot_payout
	   skins_gross_win --;
   
	   if skins_net_win > 0
	   while skins_net_win > skins_net_pot_payout
	   skins_net_win --;
   
	   // subtract from pot
	   skins_gross_pot_payout -= skins_gross_win;
	   skins_net_pot_payout -= skins_net_win;
   
	   var skins_amt = skins_net_win+skins_gross_win;
	   var _blind = scores_grid[# 5,i] != noone;
	   var _no_team = scores_grid[# 19,i] || team_number == 0; // no team checkbox or only one team playing

	   scores_grid[# 11,i] = -low_net_entry-team_entry-skins_entry-(_blind*blind_fee)+(_no_team*team_entry); // entry fee
	   scores_grid[# 14,i] = skins_amt; // calculate skins winning
	   scores_grid[# 10,i] = low_net_winnings+scores_grid[# 14,i]+team_winnings+blind_winnings; // total winning 
	   scores_grid[# 12,i] = scores_grid[# 10,i]+scores_grid[# 11,i]; // net winnings
	   scores_grid[# 16,i] = team_winnings;
	   scores_grid[# 17,i] = low_net_winnings;
	   scores_grid[# 20,i] = blind_winnings;
	   scores_grid[# 21,i] = skins_gross_win;
	   scores_grid[# 22,i] = skins_net_win;
	   }

	var short = 0;   
	ds_grid_sort(scores_grid,21,false); // sort by gross skins
	
	// distribute any remaining gross skins
	if !no_gross_skins // if someone had gross skins
	while skins_gross_pot_payout > 0
	for(var i=num-1;i>0;i--)
	if scores_grid[# 13,i] > 0 // if you had gross skins
	   {
	   scores_grid[# 14,i] ++; // calculate skins winning
	   scores_grid[# 21,i] ++; // add to gross skins breakdown
	   scores_grid[# 10,i] ++; // total winning 
	   scores_grid[# 12,i] ++; // net winnings
   
	   skins_gross_pot_payout --; // 1 less in pot
   
	   if skins_gross_pot_payout == 0
	   break;
	   }        
	else
	short ++;

	short = 0;
	ds_grid_sort(scores_grid,22,false); // sort by net skins

	// distribute any remaining net skins
	if !no_net_skins { // if someone had net skins
		
		while (skins_net_pot_payout > 0)
		for(var i=num-1;i>0;i--)
		if scores_grid[# 15,i] > 0 // if you had net skins
		   {
		   scores_grid[# 14,i]++; // calculate skins winning
		   scores_grid[# 22,i]++; // add to net skins breakdown
		   scores_grid[# 10,i]++; // total winning 
		   scores_grid[# 12,i]++; // net winnings
   
		   skins_net_pot_payout--; // 1 less in pot
   
		   if (skins_net_pot_payout == 0) // if no more in the pot
		   break;
		   }   
		else
		short++;
		}

	// calculate final score
	for(var i=0;i<ds_grid_height(scores_grid);i++)
	scores_grid[# 23,i] = scores_grid[# 12,i]+((no_net_skins+no_gross_skins)*10); // grand total
   
	// sort by team
	ds_grid_sort(scores_grid,18,true); // sort by net skins   
   
	// sort teams
	ds_grid_sort(team_score_front_grid,1,true);
	ds_grid_sort(team_score_back_grid,1,true);
	ds_grid_sort(team_score_total_grid,1,true);

	// sort scores
	ds_grid_sort(scores_grid_front,1,true); // front
	ds_grid_sort(scores_grid_back,2,true); // back
	ds_grid_sort(scores_grid_total,3,true); // total
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
		
	return {gross: grossCount, net: netCount}
	}