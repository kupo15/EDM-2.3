function scr_calculate_results_teams(argument0) {
	phase = argument0;

	// remove empty teams and sort
	var size = 0;
	for(var i=0;i<teams_max;i++)
	if !ds_list_empty(team_list[i])
	    {
	    team_score_front_grid[# 0,i] = i+1; // team number
	    team_score_front_grid[# 1,i] = team_score[i,0]; // team score front
	    team_score_front_grid[# 3,i] = 0; // team payout front

	    team_score_back_grid[# 0,i] = i+1; // team number
	    team_score_back_grid[# 1,i] = team_score[i,1]; // team score back
	    team_score_back_grid[# 3,i] = 0; // team payout back
    
	    team_score_total_grid[# 0,i] = i+1; // team number
	
		if team_score[i,0] == undefined
		team_score_total_grid[# 1,i] = undefined;
		else
	    team_score_total_grid[# 1,i] = team_score[i,0]+team_score[i,1]; // team score total
	
	    team_score_total_grid[# 3,i] = 0; // team payout total
	    size ++;
	    }
    
	// sort teams
	ds_grid_sort(team_score_front_grid,1,true);
	ds_grid_sort(team_score_back_grid,1,true);
	ds_grid_sort(team_score_total_grid,1,true);

	// first team is ranked 1st
	team_score_front_grid[# 2,0] = 1;
	team_score_back_grid[# 2,0] = 1;
	team_score_total_grid[# 2,0] = 1;

	// remove blank teams
	ds_grid_resize(team_score_front_grid,ds_grid_width(team_score_front_grid),size);
	ds_grid_resize(team_score_back_grid,ds_grid_width(team_score_back_grid),size);
	ds_grid_resize(team_score_total_grid,ds_grid_width(team_score_total_grid),size);

	// set payout amounts
	ds_list_clear(payout_list_front);   
	ds_list_clear(payout_list_back);   
	ds_list_clear(payout_list_total);  

	// add first place value
	ds_list_add(payout_list_front,team_pay_table[team_number,0]); 
	ds_list_add(payout_list_back,team_pay_table[team_number,0]);
	ds_list_add(payout_list_total,team_pay_table[team_number,0]); 
 
	// set rest to 0
	for(var i=1;i<size;i++)
	    {
	    ds_list_add(payout_list_front,0); 
	    ds_list_add(payout_list_back,0);
	    ds_list_add(payout_list_total,0);
	    }

	var payout_max = array_length_2d(team_pay_table,team_number); // the last pay slot


	// TEAM RESULTS
	// calculate rank of front
	var rank = 1;
	var _score;
	for(var i=1;i<size;i++)
	    {
	    _score = team_score_front_grid[# 1,i-1]; // get previous score
	    if team_score_front_grid[# 1,i] > _score // if score is worse than previous team
	    rank ++;
    
	    if i < payout_max
	    payout_list_front[| rank-1] += team_pay_table[team_number,i]; // add to payout pot
	    team_score_front_grid[# 2,i] = rank; // set rank
	    }
    
	// calculate rank of back
	var rank = 1;
	var _score;
	for(var i=1;i<size;i++)
	    {
	    _score = team_score_back_grid[# 1,i-1]; // get previous score
	    if team_score_back_grid[# 1,i] > _score // if score is worse than previous team
	    rank ++;
    
	    if i < payout_max
	    payout_list_back[| rank-1] += team_pay_table[team_number,i]; // add to payout pot
	    team_score_back_grid[# 2,i] = rank; // set rank
	    }
    
	// calculate rank of total
	var rank = 1;
	var _score;
	for(var i=1;i<size;i++)
	    {
	    _score = team_score_total_grid[# 1,i-1]; // get previous score
	    if team_score_total_grid[# 1,i] > _score // if score is worse than previous team
	    rank ++;
    
	    if i < payout_max
	    payout_list_total[| rank-1] += team_pay_table[team_number,i]; // add to payout pot
	    team_score_total_grid[# 2,i] = rank; // set rank
	    }


	// distribute payout
	var pay;

	// front
	for(var p=0;p<size;p++) // loop through payout list
	    {
	    pay = payout_list_front[| p]; // get payout amount
    
	    while pay > 0 // while there is money in the pot
	    for(var i=0;i<size;i++) // loop through team grid
	        {
	        if team_score_front_grid[# 2,i] = p+1 // if rank equals payout index
	            {
	            team_score_front_grid[# 3,i] += 1; // add 1 to winning
	            pay --; // remove 1 from pot
	            }
	        }
	    }
        
	// back
	for(var p=0;p<size;p++) // loop through payout list
	    {
	    pay = payout_list_back[| p]; // get payout amount
    
	    while pay > 0 // while there is money in the pot
	    for(var i=0;i<size;i++) // loop through team grid
	        {
	        if team_score_back_grid[# 2,i] = p+1 // if rank equals payout index
	            {
	            team_score_back_grid[# 3,i] += 1; // add 1 to winning
	            pay --; // remove 1 from pot
	            }
	        }
	    }
    
	// total
	for(var p=0;p<size;p++) // loop through payout list
	    {
	    pay = payout_list_total[| p]; // get payout amount
    
	    while pay > 0 // while there is money in the pot
	    for(var i=0;i<size;i++) // loop through team grid
	        {
	        if team_score_total_grid[# 2,i] = p+1 // if rank equals payout index
	            {
	            team_score_total_grid[# 3,i] += 1; // add 1 to winning
	            pay --; // remove 1 from pot
	            }
	        }
	    }
    
    
    
    
    
    
    
    
    
    
    
    






}
