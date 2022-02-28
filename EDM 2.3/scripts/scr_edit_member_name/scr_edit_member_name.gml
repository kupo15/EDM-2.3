function member_edit_name(struct) {
	
	var memberDetails = struct.memberDetails;
	
	edit_member_struct = struct;
	list_slot = noone;
	edit_member = true;
	add_member = get_string_async("Edit Member Name",memberDetails.fullName);
	}
	
function member_create_new() {
	
	edit_member = false;
	add_member = get_string_async("Enter Member Name","");
	}