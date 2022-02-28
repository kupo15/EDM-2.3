function RoundHistory(_teeData,adjGross,_date=date_current_datetime()) constructor {
	
	roundDate = _date;
	adjustedGross = adjGross;
	includedIndex = false; // included in index calculation
	
	var diffs = round_calculate_differentials(adjGross,_teeData);
	differential = diffs.differential;
	differentialAdjusted = diffs.differentialAdj;
	
	teeData = deep_copy(_teeData);
	
	variable_struct_remove(teeData,"color");
	}

function round_calculate_differentials(adjGross,_teeData) {
	
	var course_rating = _teeData.rating;
	var course_slope = _teeData.slope;
	
	var diff = adjGross-course_rating;
	var diffAdj = diff*113/course_slope;
	
	return {differential: diff,differentialAdj: diffAdj};
	}

function debug_generate_round_history(arr) {

	var historyStruct = debug_round_history();

	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var roundHistory = memberStruct.roundHistory;
		var memberDetails = memberStruct.memberDetails;
		var lastName = string_lower(memberDetails.lastName);
		
		if (historyStruct[$ lastName] == undefined)
		continue;
		
		var scoreHistory = debug_create_score_history(memberStruct,historyStruct[$ lastName]);
		array_push(roundHistory,scoreHistory);
		
		cs(js(roundHistory));
		sm("")
		}
	}

function debug_create_score_history(memberStruct,scoreArray) {
	
	var historyArr = [];
	var date = date_create_datetime(2022,2,24,0,0,0);
	
	for(var i=0;i<array_length(scoreArray);i++) {
		
		var teeCol = memberStruct.memberDetails.teeColor;
		var teeData = TEE_DATA[$ teeCol];
		var eventScore = new RoundHistory(teeData,scoreArray[i],date);
		
		array_push(historyArr,eventScore);
		
		var dayIsThurs = date_get_day(date);
		var inc = pick(-2,-3,dayIsThurs);
		
		date = date_inc_day(date,inc);
		}
		
	return historyArr;
	}

function debug_round_history() {
	
	var history = {
		
		stratoti: [79,86,84,77,83,81,80,85,84,83,76,81,83,81,84,82,78,81,76,85],
		
		}
		
	return history;
	}
