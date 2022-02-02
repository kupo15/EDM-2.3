function scr_calculate_results_final(argument0) {
	
	phase = argument0;

	ds_grid_sort(scores_grid,18,true); // sort by index

	ds_grid_sort(scores_grid_front,18,true);
	ds_grid_sort(scores_grid_back,18,true);
	ds_grid_sort(scores_grid_total,18,true);

	ds_grid_sort(team_score_front_grid,0,true);
	ds_grid_sort(team_score_back_grid,0,true);
	ds_grid_sort(team_score_total_grid,0,true);

	var num = ds_grid_height(scores_grid);
	var skins_gross_tot = ds_grid_get_sum(scores_grid,13,0,13,num-1); // total gross skins given
	var skins_net_tot = ds_grid_get_sum(scores_grid,15,0,15,num-1); // total net skins given
	var skins_pot = skins_entry*num*0.5;

	no_gross_skins = (skins_gross_tot == 0);
	no_net_skins = (skins_net_tot == 0);

	if (skins_gross_tot == 0)
	skins_gross_tot = 1;   

	if (skins_net_tot == 0)
	skins_net_tot = 1;

	var skins_gross_pot_payout = skins_pot;
	var skins_net_pot_payout = skins_pot;
	
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
	//if irandom(1) = 1 || short > 500
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
