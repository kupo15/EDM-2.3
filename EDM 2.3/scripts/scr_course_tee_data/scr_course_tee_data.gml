function Tee(_rating,_slope,_par,_color,_colorHex) constructor {
	
	name = _color;
	rating = _rating;
	slope = _slope;
	par = _par;
	color = _colorHex;
	}
	
function CourseList() constructor {
	
	estrella = course_information_estrella("Estrella Del Mar");
	}

function course_information_estrella(_name) {
	
	var courseInfo = {
		
		courseData: {
			
			courseName: _name,
			currencyIndex: 1,
			evenHandicapHoles: 0,
			},
		
		teeMarker: {
			
			teeOrder: ["gold","blue","white","silver","combo"],
			
			white: new Tee("70.7","128","72","White",whiteColor),
			gold: new Tee("75.4","131","72","Gold",goldColor),
			blue: new Tee("72.5","129","72","Blue",blueColor),
			silver: new Tee("68.6","122","72","Silver",silverColor),
			combo: new Tee("69.3","125","72","Combo",comboColor),
			},		
		}

	return courseInfo;
	}