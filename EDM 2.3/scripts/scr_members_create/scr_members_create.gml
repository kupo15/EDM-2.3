function scr_member_create() {
	
	
member_struct = {

	memberID: -1,
	favorite: false,
	active: true,
	
	groups: [],
	}

return member_struct;
}

function scr_member_create_database(first_name,last_name,arr) {
	
member_struct = {
	
	firstName: first_name,
	lastName: last_name,
	
	}
	
if argument[2] != undefined
array_push(arr,member_struct)

return member_struct;
}