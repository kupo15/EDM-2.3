function async_member_list() {

	var i_d = ds_map_find_value(async_load, "id");
	var name = ds_map_find_value(async_load, "result");

	if (name == "") {
		
		edit_member = false;
		add_member = false;
		exit;
		}

	if (i_d == add_member) {
		
		if ds_map_find_value(async_load, "status") {
			
			name = string_capitalize(name);
         
			if !edit_member // add member
			async_member_create(name);
			else // edit name
			async_member_edit(name);
			}
		}

	// reset
	add_member = false;
	edit_member = false;
	}
   
function async_member_create(name) {
	
	member_add_recent(name);
	}

function async_member_edit(name) {
	
	// if name exists
	if check_member_name_exists(name) {
	
		add_member = get_string_async("Member Already Exists!! Enter a different name","");
		exit;
		}
	
	var parsedName = parse_name(name);

	with edit_member_struct.memberDetails {
		
		fullName = name;
		firstName = parsedName.first;
		lastName = parsedName.last;
		}
		
	// update season ranking name
	}
