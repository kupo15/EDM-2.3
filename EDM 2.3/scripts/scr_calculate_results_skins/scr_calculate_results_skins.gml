function scr_calculate_skins_count() {
	
	var grossCount = 0;
	var netCount = 0;
	
	for(var i=0;i<team_number+1;i++)
		{
		var teamStruct = TEAM_LIST[i];	
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++) {
			
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

function scr_calculate_results_skins() {

	var skins_pot_collected = real(ENTRY_FEES.skinsEntry)*ENTRANT_COUNT;
	var skins_gross_pot_collected = skins_pot_collected*0.5;
	var skins_net_pot_collected = skins_pot_collected*0.5;
	
	// create payout pots
	var skins_gross_pot_payout = skins_gross_pot_collected;
	var skins_net_pot_payout = skins_net_pot_collected;

	// calculate the number of total skins awarded
	var skins_struct = scr_calculate_skins_count();
	var skins_gross_total = skins_struct.gross; // total gross skins awarded
	var skins_net_total = skins_struct.net; // total net skins awarded

	// loop through entrant list
	for(var i=0;i<array_length(entrantResultsList);i++) {
		
	   var memberStruct = entrantResultsList[i];
	   var roundStats = memberStruct.roundStats;
	   var winningStruct = memberStruct.eventWinnings;
		
	   var skins_gross_win = round(real(roundStats.skinsGross)/skins_gross_total*skins_gross_pot_collected);
	   var skins_net_win = round(real(roundStats.skinsNet)/skins_net_total*skins_net_pot_collected);
	   
	   // if rounding up causes higher payout than whats in pot, subtract 1   
	   if (skins_gross_win > 0) 
	   while (skins_gross_win > skins_gross_pot_payout)
	   skins_gross_win--;
   
	   if (skins_net_win > 0)
	   while (skins_net_win > skins_net_pot_payout)
	   skins_net_win--;
   
	   // subtract from pot
	   skins_gross_pot_payout -= skins_gross_win;
	   skins_net_pot_payout -= skins_net_win;
   
	   // calculate skins winning pesos
	   winningStruct.skinsGross = skins_gross_win;
	   winningStruct.skinsNet = skins_net_win;
	   winningStruct.skinsTotalWinnings = skins_net_win+skins_gross_win;
	   }
  
  	// if someone had gross skins
	if !no_gross_skins
	distribute_leftover_skin_payout(entrantResultsList,"skinsGross",skins_gross_pot_payout);
	
  	// if someone had net skins
	if !no_net_skins
	distribute_leftover_skin_payout(entrantResultsList,"skinsNet",skins_net_pot_payout);
	}
	
function distribute_leftover_skin_payout(arr,sortKey,payoutPot) {
	
	// sort descending
	array_sort_struct(arr,sortKey,false,["eventWinnings"]);
	
	// distribute any remaining skins starting from the bottom
	while (payoutPot > 0)
	for(var i=array_length(arr)-1;i>0;i--) {
		
		var memberStruct = arr[i];
		var winningStruct = memberStruct.eventWinnings;
		
		// if you had skins
		if (winningStruct[$ sortKey]) {
			
		   winningStruct[$ sortKey]++; // add to skins breakdown
		   winningStruct.skinsTotalWinnings++; // calculate skins total winning
   
		   payoutPot--; // 1 less in pot
   
		   if (payoutPot == 0)
		   break;
		   }
		}
	}