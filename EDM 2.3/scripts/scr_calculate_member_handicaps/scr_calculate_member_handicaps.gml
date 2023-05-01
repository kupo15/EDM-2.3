function calculate_member_course_handicap(memberStruct) {

	var memberDetails = memberStruct.memberDetails;
	
	if (memberDetails.handicapIndex == Undefined)
	return Undefined;
		
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

	return round_tenth(diffAdj);
	}
	
function calculate_member_handicap_index(memberStruct) {

	var historyArr = memberStruct.roundHistory;
	var historyCount = array_length(historyArr);

	// if no history
	if (historyCount == 0)
	return Undefined;
			
	// sort history oldest first
	array_sort_struct(historyArr,"roundDate",true);

	var lowIndex = maxHCP;
	var reachedEnd = !(historyCount > 0);
	var pos_start = 0;

	while !reachedEnd {
		
		// add to diffList
		var diffList = [];
		var pos_end = clamp(pos_start+20,0,historyCount);
		for(var i=pos_start;i<pos_end;i++) {
		
			var roundStruct = historyArr[i];
			
			roundStruct.includedIndex = false; // reset the flag
			array_push(diffList,roundStruct);
			
			// break out
			if (i+1 == historyCount)
			reachedEnd = true;
			}
				
		var index = handicap_calculate(diffList);
		
		if (index < lowIndex)
		lowIndex = index;
		
		pos_start++;
		}
		
	// set low index
	memberStruct.memberDetails.handicapLowIndex = handicap_index_format_string(lowIndex);
	
	// sort by date newest first
	array_sort_struct(historyArr,"roundDate",false);
		
	return handicap_index_format_string(clamp(index,-200,maxHCP));
	}
	
function handicap_calculate(diffList) {
	
	// sort low to high
	array_sort_struct(diffList,"differentialAdjusted",true);
	
	var diffSum = 0;
	var table = handicap_index_calculate_included_rounds(diffList);
	var num = table.scoreCount;
	for(var i=0;i<num;i++) {
		
		var struct = diffList[i];
		var diffAdj = struct.differentialAdjusted;
		
		struct.includedIndex = true;
		diffSum += diffAdj;
		}
	
	// calculate
	var adjustment = table.adjustment;
	var diffAveraged = round_tenth(diffSum/num);
	var index = diffAveraged+adjustment;
		
	return index;
	}
		
function handicap_cap_adjustments(memberStruct) {
		
	var historyArr = memberStruct.roundHistory;
	var historyCount = array_length(historyArr);
	
	var memberDetails = memberStruct.memberDetails;
	var lowIndex = memberDetails.handicapLowIndex;
	var index = memberDetails.handicapIndex;
	
	if (historyCount < 20)
	return index;

	// apply caps
	index = handicap_index_apply_caps(real(lowIndex),index);
		
	return handicap_index_format_string(index);
	}
	
function handicap_index_apply_esr(index) {
	
	//if (index > 7)
	
	return index;
	}
		
function handicap_index_apply_caps(low_index,currentIndex) {
		
	// soft cap
	var diff = (currentIndex-low_index);
	var softCap = clamp(diff,0,3);
	var incBeyondThree = max(0,diff-3);
	var softIndex = low_index+softCap+(incBeyondThree*0.5);
	
	// hard cap
	var hardIndex = low_index+5;
	
	return min(softIndex,hardIndex);
	}

function IndexAdjustment(count,adj=0) constructor {
	
	scoreCount = count;
	adjustment = adj;
	}
	
function handicap_index_calculate_included_rounds(diffList) {

	var scoreCount = array_length(diffList);
	var ind = clamp(scoreCount-1,0,19);

	var table = [
	
		new IndexAdjustment(1,-2),
		new IndexAdjustment(1,-2),
		new IndexAdjustment(1,-2),
		new IndexAdjustment(1,-1),
		new IndexAdjustment(1,0),
		new IndexAdjustment(2,-1),
		new IndexAdjustment(2),
		new IndexAdjustment(2),
		new IndexAdjustment(3),
		new IndexAdjustment(3),
		new IndexAdjustment(3),
		new IndexAdjustment(4),
		new IndexAdjustment(4),
		new IndexAdjustment(4),
		new IndexAdjustment(5),
		new IndexAdjustment(5),
		new IndexAdjustment(6),
		new IndexAdjustment(6),
		new IndexAdjustment(7),
		new IndexAdjustment(8),
		];
		
	return table[ind];
	}
	
function handicap_index_format_string(val) {
	
	var str = string(val);
	var dec_pos = string_pos(".",str);
	
	if (dec_pos != 0)
	str = string_delete(str,dec_pos+2,1);
	
	return str;
	}