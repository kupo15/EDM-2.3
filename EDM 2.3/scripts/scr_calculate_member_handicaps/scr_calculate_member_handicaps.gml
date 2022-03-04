function calculate_member_course_handicap(memberStruct) {

	var memberDetails = memberStruct.memberDetails;
	
	if (memberDetails.handicapIndex == undefined)
	return undefined;
	
	var current_index = memberDetails.handicapIndex;
	var _teeColor = memberDetails.teeColor;
	
	var teeStruct = TEE_DATA[$ _teeColor];
	var course_slope = teeStruct.slope;
	var course_rating = teeStruct.rating;
	var course_par = teeStruct.par;

	var course_handicap = (real(current_index)*real(course_slope)/113)+real(course_rating)-real(course_par);

	return round(course_handicap);
	}
	
function round_calculate_differential(adjGross,_teeData) {
	
	var course_rating = _teeData.rating;
	var course_slope = _teeData.slope;
	
	var diff = adjGross-course_rating;
	var diffAdj = diff*113/course_slope;
	
	return diffAdj;
	}
	
function calculate_member_handicap_index(memberStruct) {
		
	var historyArr = memberStruct.roundHistory;
	var historyCount = array_length(historyArr);
	
	// if no history
	if (historyCount == 0)
	return 0;
		
	// sort low to high
	array_sort_struct(historyArr,"differentialAdjusted",true);
	
	// set the first 8 scores to active
	var ave = 0;
	var num = min(topScores,historyCount);
	for(var i=0;i<num;i++) {
		
		var struct = historyArr[i];
		
		struct.includedIndex = true;
		ave += struct.differentialAdjusted;
		}

	// sort by date
	array_sort_struct(historyArr,"roundDate",false);
	
	return clamp(round_tenth(ave/num),-200,maxHCP);
	}