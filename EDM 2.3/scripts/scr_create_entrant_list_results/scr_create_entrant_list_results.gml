function create_entrant_list_results() {
	
	entrantResultsList = [];
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = TEAM_LIST[i];
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];
			array_push(entrantResultsList,memberStruct);
			}
		}
	}