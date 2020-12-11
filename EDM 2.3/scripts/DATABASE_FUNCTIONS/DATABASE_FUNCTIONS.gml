function database_member_id_generate() {
	
var last_given_id = META_data.memberIdGenerator;
var _id = last_given_id ++;
	
META_data.memberIdGenerator = _id;
	
return _id;
}

function database_get_pointer(source,memberId,idKeyString,key) {
/// @param source
/// @param memberId
/// @param idKeyString
/// @param [key]
	
var size = array_length(source);
for(var i=0;i<size;i++)
	{
	var pointer = source[i];
	var test_memberId = variable_struct_get(pointer,idKeyString);
	
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