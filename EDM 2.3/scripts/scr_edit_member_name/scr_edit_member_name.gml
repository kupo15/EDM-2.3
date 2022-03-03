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
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var member = list[i];
		var memberDetails = member.memberDetails;
		
		if !memberDetails.favorite {
			
			array_insert(list,i,new Member(name));
			manageMemberIndex = i;
			scrollbar_set_value(scrollbarIndex.manageMemberList,i);
			scrollbar_set_value(scrollbarIndex.homeMemberList,i);
			break;
			}
		}
	}
	
function member_delete(memberStruct) {
	
	memberStruct.memberDetails.archived = true;
	
	var list = MEMBERS_LIST.list;
	for(var i=manageMemberIndex;i<array_length(list);i++) {
		
		if !list[i].memberDetails.archived {
			
			manageMemberIndex = i;
			break;
			}
		}
	}