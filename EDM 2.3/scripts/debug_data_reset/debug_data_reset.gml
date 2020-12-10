function debug_data_reset() {
db("***debug reset***");

root_data_create();
scr_profile_create("Estrella Del Mar");
//scr_profile_create("River");
//scr_profile_create("Test");
//scr_profile_create("Yes");

// TEMPORARY add member pointers to local list
var source_arr = MEMBER_database;
var list_num = array_length(MEMBER_database);
for(var n=0;n<list_num;n++)
	{
	var member_pointer = source_arr[n];
	var member_id = member_pointer.memberID;
			
	// loop through profiles
	var size = array_length(ROOT_data_struct.profiles);
	for(var i=0;i<size;i++)
		{
		var arr = ROOT_data_struct.profiles[i].memberlist;
		scr_member_add_local(member_id,arr);
		}
	}

}