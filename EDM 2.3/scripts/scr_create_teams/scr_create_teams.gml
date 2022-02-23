function scr_create_teams() {

	entrant_list = [];
	team_number = -1; // reset

	// shift members over to skip blank teams
	var list = TEAM_LIST;
	var maxTeams = array_length(list);
	for(var i=0;i<maxTeams;i++) {
		
		var teamMemberList = list[i].members;
		
		var teamSize = array_length(teamMemberList);
		if (teamSize != 0) {
			
			team_number++;
		
			// assign team number and add to entrant list
			for(var j=0;j<teamSize;j++) {
			
				var member = teamMemberList[j];
				
				member.teamAssigned = team_number;
				member.entrantNumber = array_length(entrant_list);
				
				array_push(entrant_list,member);
				}
			}
		}

	skins_input = true;
	screen_change(screenEnum.eventRunning);
	scr_sort_members(MEMBERS_LIST.list);

exit;
	
	var hh = ENTRANT_COUNT;
	ds_grid_resize(scores_grid,ds_grid_width(scores_grid),hh);

	var row = 0;
	for(var t=0;t<teams_max;t++) // loop through teams
	    {
	    var size = ds_list_size(team_list[t]);
	    for(var i=0;i<size;i++) // loop through members of teams
	       {
	       var name = ds_list_find_value(team_list[t],i);
	       scores_grid[# 0,row] = name; // copy names from entrant list
	       scores_grid[# 1,row] = irandom_range(33,50); // front nine
	       scores_grid[# 2,row] = irandom_range(33,50); // back nine
	       scores_grid[# 3,row] = irandom_range(33,50); // total score
       
	       if !debug
	           {
	           scores_grid[# 1,row] = undefined; // front nine
	           scores_grid[# 2,row] = undefined; // back nine
	           }
       
	       scores_grid[# 4,row] = t; // team number
	       scores_grid[# 5,row] = noone; // blind
	       scores_grid[# 6,row] = 1; // rank
	       // 7 front payout
	       // 8 back payout
	       // 9 total payout
	       // 10 total win
	       // 11 entry fee
	       // 12 net win
	       scores_grid[# 13,row] = 0; // net skins
	       // 14 skins payout
	       scores_grid[# 15,row] = 0; // gross skins
	       // 16 team winnings
	       // 17 low net winnings
	       scores_grid[# 18,row] = row; // index
	       scores_grid[# 19,row] = 0; // no teams
	       // 20 blind winnings
	       // 21 net skins winnings
	       // 22 gross skins winnings
	       // 23 grand total winnings
	       row ++;
	       }    
	    }
	}
