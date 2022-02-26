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
	
	member_add_recent(name);
	}

function async_member_edit(name) {
	
	edit_member_slot.memberDetails.fullName = name;

	// update season ranking name
	}
