function create_entrant_list_results() {
	
	var list = [];
	
	for(var i=0;i<team_number+1;i++) {
		
		var teamStruct = deep_copy(TEAM_LIST[i]);
		
		var size = array_length(teamStruct.members);
		for(var j=0;j<size;j++)	{
			
			var memberStruct = teamStruct.members[j];

			//variable_struct_remove(memberStruct,"roundHistory");
			array_push(list,memberStruct);
			}
		}
		
	return list;
	}
	
function RoundHistory(_teeData,adjGross,_date=date_current_datetime()) constructor {
	
	roundDate = _date;
	adjustedGross = adjGross;
	includedIndex = false; // included in index calculation
	differentialAdjusted = 	round_calculate_differential(adjGross,_teeData);
	
	teeData = deep_copy(_teeData);
	
	variable_struct_remove(teeData,"color");
	}	

function member_round_save() {
	
	// loop through entrants
	var list = FINAL_EVENT_RESULTS.entrantResults;
	for(var i=0;i<array_length(list);i++) {
		
		var memberStruct = list[i];	
		var roundStruct = member_round_history_create(memberStruct); // create new round data
		
		array_push(memberStruct.roundHistory,roundStruct); // add to handicap history
		
		// calculate index
		}
	}
	
function member_round_history_create(memberStruct) {
	
	var memberDetails = memberStruct.memberDetails;
	var eventScores = memberStruct.eventScores;
		
	var teeCol = memberDetails.teeColor;
	var teeData = TEE_DATA[$ teeCol];
		
	return new RoundHistory(teeData,eventScores.grossAdj); // create new round data
	}
	