function async_member_list() {

	var i_d = ds_map_find_value(async_load, "id");
	var name = ds_map_find_value(async_load, "result");

	if (name == "")
	exit;

	if (i_d == add_member) {
		
		if ds_map_find_value(async_load, "status") {
			
			name = string_capitalize(name);
         
			if !edit_member // add member
			async_member_create(name);
			else // edit name
			async_member_edit(name);
			}
		}
	}
   
function async_member_create(name) {
	

	}

function async_member_edit(name) {
	
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
	}
