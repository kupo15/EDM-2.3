function scr_member_add_local(member_id,array) {
/// add to local memberlist_array
/// @param memberID
/// @param [destinationArray]

if argument[1] == undefined
array = memberlist_array;

var local_struct = {

	memberID: member_id,
	favorite: false,
	active: true,
	}
	
array_push(array,local_struct);

return local_struct;
}

function scr_member_create_database(first_name,last_name,arr) {
/// @param [first_name
/// @param last_name
/// @param array]

if argument[0] == undefined
first_name = "";

if argument[1] == undefined
last_name = "";

if argument[2] == undefined
arr = MEMBER_database;


member_struct = {
	
	memberID: database_member_id_generate(),
	firstName: first_name,
	lastName: last_name,
	phone: -1,
	dateJoined: date_current_datetime(),
	
	location: {
		
		address: -1,
		state: -1,		
		},
		
	groups: [],
	
	stat: [],
	}
	
if argument[2] != undefined
array_push(arr,member_struct)

META_data.memberIdGenerator ++;

return member_struct;
}

function scr_memberlist_sort(ind) {
	
META_data.memberSort = ind;

switch ind
	{
	case member_sort.abc: membersort; break;	
		
	case member_sort.favorite: scr_member_sort_favorite(MEMBER_list,true); break; // sort list
	}
	
	
}