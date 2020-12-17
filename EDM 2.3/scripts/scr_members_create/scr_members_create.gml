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

function scr_member_create_database(first_name,last_name,arr,group_arr) {
/// @param [first_name
/// @param last_name
/// @param array
/// @param group_arr]

if argument[0] == undefined
first_name = "";

if argument[1] == undefined
last_name = "";

if argument[2] == undefined
arr = MEMBER_database;

if argument[3] == undefined
group_arr = [];

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
		
	groups: group_arr,
	
	stat: [],
	}
	
if argument[2] != undefined
array_push(arr,member_struct)

META_data.memberIdGenerator ++;

return member_struct;
}

function scr_memberlist_sort(source_array,ind) {
	
META_data.memberSort = ind;

switch ind
	{
	case member_sort.abc: scr_member_sort_abc(source_array,true); break;	
		
	case member_sort.favorite: scr_member_sort_favorite(source_array,true); break; // sort list
	}
	
	
}