function database_member_id_generate() {
	
	
	
	
return _id;

}

function database_member_get_pointer(memberId,key,source) {
/// @param memberId
/// @param [key
/// @param source]	
	
if argument[2] == undefined
source = MEMBER_database;

var size = array_length(source);
for(var i=0;i<size;i++)
	{
	var pointer = source[i];
	var test_memberId = pointer.memberID;
	
	if memberId == test_memberId
		{
		if key == undefined // return the whole struct
		return pointer;
		else
		return variable_struct_get(pointer,key); // return the key
		}
	}

return undefined;
}

function database_member_get_index(memberId,source) {
/// @param memberId
/// @param [source]	

if argument[1] == undefined
source = MEMBER_database;

var size = array_length(source);
for(var i=0;i<size;i++)
	{
	var pointer = source[i];
	var test_memberId = pointer.memberID;
	
	if memberId == test_memberId
	return i;
	}

return undefined;
}	