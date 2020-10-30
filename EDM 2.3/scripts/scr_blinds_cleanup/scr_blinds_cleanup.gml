function scr_blinds_cleanup() {
	for(var i=0;i<team_number+1;i++) // loop through teams
	  {
	  for(var ii=0;ii<ds_list_size(blind_list[i]);ii++) // loop through blind list positions
	      {
	      var found = false;
	      var name_ = ds_list_find_value(blind_list[i],ii); // get name
	      for(var iii=0;iii<ds_grid_height(scores_grid);iii++) // loop through scores grid
	      if name_ == scores_grid[# 0,iii] 
	          {
	          found = true;
	          break;
	          }
          
	      if !found
	      ds_list_delete(blind_list[i],ii);
	      }
	  }



}
