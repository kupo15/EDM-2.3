function scr_create_teams() {
	var redo = (ds_grid_height(scores_grid) != 1); // if grid already created

	// debug
	var team_num = 2;
	if debug
	    {
	    repeat(4) // four players
	    for(var i=0;i<team_num;i++)
	        {
	        var rand = irandom(ds_list_size(member_list)-1);
	        var str = member_list[| rand]; // get name
	        ds_list_delete(member_list,rand); // delete index
	        ds_list_add(team_list[i],str); 
	        ds_list_add(entrant_list,str);
	        }
    
	    // set team scores
	    for(var i=0;i<team_num;i++)
	        {
	        team_score[i,0] = -irandom(26)-1;
	        team_score[i,1] = -irandom(26)-1;
	        team_score[i,2] = team_score[i,0]+team_score[i,1];
	        }
	    }
	else if !redo
	for(var i=0;i<team_num;i++)
	    {
	    team_score[i,0] = undefined;
	    team_score[i,1] = undefined;
	    team_score[i,2] = 0;
	    }

	//

	skins_input = 1;
	phase = 1;
	team_number = -1; // reset
	ini_member_list_save();

	if redo
	    {
	    grid_copy = ds_grid_create(ds_grid_width(scores_grid),ds_grid_height(scores_grid));
	    ds_grid_copy(grid_copy,scores_grid); // copy the grid
	    }

	// set number of teams
	for(var i=0;i<teams_max;i++)
	    {
	    var n=i+1;
	    while ds_list_empty(team_list[i])
	        {
	        if n = teams_max
	        break;
        
	        if ds_list_empty(team_list[n]) // if next list is empty
	        n ++;
	        else // not empty
	            {
	            ds_list_copy(team_list[i],team_list[n]); // copy list
	            ds_list_clear(team_list[n]); // clear copied list
	            }
	        }  
    
	    if !ds_list_empty(team_list[i])
	    team_number ++; // add to the number of teams
	    }

	var hh = ds_list_size(entrant_list);
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
    
	if redo
	   {    
	   var size = ds_grid_height(scores_grid); // get height of scores grid
	   var size_copy = ds_grid_height(grid_copy); // get height of copy grid
   
	   for(var i=0;i<size;i++) // loop through scores grid
	      {
	      var name = scores_grid[# 0,i]; // get name
	      for(var ii=0;ii<size_copy;ii++) // loop through copy scores
	          {
	          if grid_copy[# 0,ii] == name // if matching name found
	              {
	              ds_grid_set_grid_region(scores_grid,grid_copy,1,ii,3,ii,1,i); // copy scores over
	              scores_grid[# 5,i] = grid_copy[# 5,ii]; // blind
	              scores_grid[# 13,i] = grid_copy[# 13,ii]; // net skins
	              scores_grid[# 15,i] = grid_copy[# 15,ii]; // gross skins
	              scores_grid[# 19,i] = grid_copy[# 19,ii]; // no team
              
	              if scores_grid[# 5,i] == scores_grid[# 4,i] // if blind team is the same as current team
	                  {
	                  scr_blinds_remove(name,scores_grid[# 4,i]) // remove from blinds team
	                  scores_grid[# 5,i] = noone; // reset blinds assignment
	                  }
	              }
	          }
	      }
   
	   ds_grid_destroy(grid_copy);
   
	   // remove from blind list
	   scr_blinds_cleanup();
	   }
    
	scr_sort_members();



}
