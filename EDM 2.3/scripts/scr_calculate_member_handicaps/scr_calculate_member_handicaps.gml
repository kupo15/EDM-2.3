function calculate_member_handicaps(teeStruct) {

return 15;

	var course_slope = teeStruct.slope;
	var course_rating = teeStruct.rating;
	var course_par = teeStruct.par;

	var course_handicap = (real(current_index)*real(course_slope)/113)+real(course_rating)-real(course_par);

	return round(course_handicap);
	}

function calculate_member_index() {
	
	
	}