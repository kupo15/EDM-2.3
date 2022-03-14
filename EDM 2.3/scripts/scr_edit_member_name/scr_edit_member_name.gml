function member_edit_name(struct) {
	
	var memberDetails = struct.memberDetails;
	
	edit_member_struct = struct;
	list_slot = undefined;
	edit_member = true;
	add_member = get_string_async("Edit Member Name",memberDetails.fullName);
	}
	
function member_create_new() {
	
	edit_member = false;
	add_member = get_string_async("Enter Member Name","");
	}
	
function member_add_recent(name) {
	
	// if name exists
	if check_member_name_exists(name) {
	
		add_member = get_string_async("Member Already Exists!! Enter a different name","");
		exit;
		}
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var member = list[i];
		var memberDetails = member.memberDetails;
		
		if !memberDetails.favorite {
			
			array_insert(list,i,new Member(name)); // add member
			array_insert(WORKING_SAVE_FILE.membersList.list,i,new Member(name)); // add member to working
			
			manageMemberIndex = i;
			scrollbar_set_value(scrollbarIndex.manageMemberList,i);
			scrollbar_set_value(scrollbarIndex.homeMemberList,i);
			return -1;
			}
		}
		
	// if empty list
	array_push(list,new Member(name)); // add member
	array_push(WORKING_SAVE_FILE.membersList.list,new Member(name)); // add member to working
	}
	
function member_delete(memberStruct) {
	
	memberStruct.memberDetails.archived = true;
	
	// reset the scrolling index
	var list = MEMBERS_LIST.list;
	for(var i=manageMemberIndex;i<array_length(list);i++) {
		
		if !list[i].memberDetails.archived {
			
			manageMemberIndex = i;
			break;
			}
		}
	}
	
function check_member_name_exists(name) {
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var memberStruct = list[i];
		var memberName = memberStruct.memberDetails.fullName;
		
		if (string_lower(name) == string_lower(memberName))
		return true;
		}
		
	return false;
	}
	
	