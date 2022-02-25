function create_entrant_list_results() {
	
	var list = [];
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = deep_copy(TEAM_LIST[i]);
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];
			
			variable_struct_remove(memberStruct,"roundHistory");
			array_push(list,memberStruct);
			}
		}
		
	return list;
	}
	