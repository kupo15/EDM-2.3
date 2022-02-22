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

	}

function scr_calculate_net_scores() {

	var entrantList = create_entrant_list();
	
	payout_low_net_winnings(entrantList,"netFront","frontWinnings");
	//payout_low_net_winnings(entrantList,"netBack","backWinnings");
	//payout_low_net_winnings(entrantList,"netTotal","allHolesWinnings");

	exit;

	var num = min(ENTRANT_COUNT-1,23); // number of players
	var payout_max = array_length_2d(low_net_pay_table,num); // the last pay slot

	for(var rr=0;rr<3;rr++)
	    {
	    // set payout amounts
	    ds_list_clear(payout_list_front);   
    
	    // add first place payout value
	    ds_list_add(payout_list_front,low_net_pay_table[num,0]); 
    
	    // set rest to 0
	    for(var i=1;i<num;i++)
	    ds_list_add(payout_list_front,0);
    
	    // select grid
	    var ds_grid = scores_grid_front;
    
	    if rr = 1
	    ds_grid = scores_grid_back;
	    else if rr = 2
	    ds_grid = scores_grid_total;
        
	    // LOW NET RESULTS
	    // calculate rank of front
	    var rank = 1;
	    var _score;
	    for(var i=1;i<num+1;i++)
	        {
	        _score = ds_grid[# 1+rr,i-1]; // get previous score
        
	        if ds_grid[# 1+rr,i] > _score // if score is worse than previous team
	        rank ++;
        
	        if i < payout_max
	        payout_list_front[| rank-1] += low_net_pay_table[num,i]; // add to payout pot
        
	        ds_grid[# 6,i] = rank; // set rank
	        }
        
	    // distribute payout
	    var pay;
    
	    // front
	    for(var p=0;p<num;p++) // loop through payout list
	        {
	        pay = payout_list_front[| p]; // get payout amount
        
	        while pay > 0 // while there is money in the pot
	        for(var s=0;s<num+1;s++) // loop through team grid
	            {
	            if ds_grid[# 6,s] = p+1 // if rank equals payout index
	                {
	                ds_grid[# 7+rr,s] += 1; // add 1 to winning
	                pay --; // remove 1 from pot
                
	                if pay == 0
	                break;
	                }
	            }
	        }
	    }
	}
