function calculate_member_course_handicap(current_index,_teeColor) {

	var teeStruct = TEE_DATA[$ _teeColor];
	var course_slope = teeStruct.slope;
	var course_rating = teeStruct.rating;
	var course_par = teeStruct.par;

	var course_handicap = (real(current_index)*real(course_slope)/113)+real(course_rating)-real(course_par);

	return round(course_handicap);
	}

function calculate_member_handicap_index(memberStruct) {
	
	return 10;
	}
	
function RoundHistory(_teeData,adjGross,_date=date_current_datetime()) constructor {
	
	roundDate = _date;
	adjustedGross = adjGross;
	includedIndex = false; // included in index calculation
	differentialAdjusted = 	round_calculate_differential(adjGross,_teeData);
	
	teeData = deep_copy(_teeData);
	
	variable_struct_remove(teeData,"color");
	}

function round_calculate_differential(adjGross,_teeData) {
	
	var course_rating = _teeData.rating;
	var course_slope = _teeData.slope;
	
	var diff = adjGross-course_rating;
	var diffAdj = diff*113/course_slope;
	
	return diffAdj;
	
	return {differential: diff,differentialAdj: diffAdj};
	}
	
function round_history_set_included_scores(historyArr) {
		
	// sort low to high
	array_sort_struct(historyArr,"differentialAdjusted",true);
	
	// set the first 8 scores to active
	var num = min(topScores,array_length(historyArr));
	for(var i=0;i<num;i++) {
		
		var struct = historyArr[i];
		
		struct.includedIndex = true; // index
		}

	// sort by date
	array_sort_struct(historyArr,"roundDate",false);
	}