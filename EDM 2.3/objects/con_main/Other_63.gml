var i_d = ds_map_find_value(async_load, "id");

if i_d == add_member
   {
   if ds_map_find_value(async_load, "status")
      {
      if ds_map_find_value(async_load, "result") != ""
         {
         var str = ds_map_find_value(async_load, "result");
		 str = string_capitalize(str);
         
         if !edit_member // add member
             {
             if (list_type == listType.members) // member list
                 {
                 ds_list_insert(member_list,last_entrant_number,str);
                 ds_list_insert(member_list_save,0,str);
                 }
             else // favorites list
                 {
                 ds_list_insert(favorites_members_list,0,str);
                 ds_list_insert(favorites_list,0,str);
                 }
				 
			 ini_member_list_save();
             }
         else // edit name
             {
             var old_name = member_list[| edit_member_slot]; // get the old name to replace with
             var grid_hh = ds_grid_height(season_ranking_grid);
             
             for(var i=0;i<grid_hh;i++) // loop through grid
             if season_ranking_grid[# 0,i] == old_name
                {
                season_ranking_grid[# 0,i] = str; // replace name in season rank
                ini_season_ranking_save();
                break;
                }
             
             if (list_type == listType.members)
                 {
                 member_list[| edit_member_slot] = str; // edit members list
                 
                 if edit_member_slot < last_entrant_number // if a favorites
                 recent_list[| edit_member_slot] = str; // edit recent list
                 else
                 member_list_save[| edit_member_slot-last_entrant_number] = str; // edit members list save file
                 }
             else
                 {
                 favorites_members_list[| edit_member_slot] = str;
                 favorites_list[| edit_member_slot] = str;
                 }
				 
			 ini_member_list_save();
             }
         }
      }
   }

