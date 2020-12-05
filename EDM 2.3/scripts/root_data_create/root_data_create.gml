function root_data_create() {
	
profile_index = 0;
rounds_played = 0;
subcourse_index = 0;
		
statslist_array = array_create(0); // culled stats list
courselist_array = array_create(0); // local courses added
scorelist_array = array_create(0); // local scorelist
handicap_season_array = array_create(0);

ini_handicap_season(); // create db of location's golf season
var course_db = debug_data_courses_database();

ROOT_data_struct = {
	
	courselistDatabase: course_db,
	seasonList: handicap_season_array,
	profiles: [],
	
	meta: {
		profileIndex: 0,
		scoreSort: score_sort.currentYear,
		courseSort: course_sort.abc,
		version: json_version,
		},
	}
}


function debug_data_courses_database() {
	
// debug
var arr = [];
scr_course_create_database("Atlantic Country Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6728","137","73.1","72");

scr_course_create_database("Apple Mountain Golf","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6668","124","71.9","70");

scr_course_create_database("Bass Rocks","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","5953","124","69.3","69");

scr_course_create_database("Braintree Municipal","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6212","123","70.0","72");

scr_course_create_database("Broad Run Golf Club","PA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6080","132","70.3","72");

scr_course_create_database("Campbell's Scottish Highlands","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6249","121","70.1","71");

scr_course_create_database("Cape May National","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6063","125","69.0","71");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6592","130","71.4","71");

scr_course_create_database("Charleston Springs","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6374","121","70.3","72");

scr_course_create_database("Crosswinds-Jones/Zaharias","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6520","134","71.9","72");

scr_course_create_database("Crotched Mountain","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"red","4604","117","67.4","71");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6277","125","69.2","71");

scr_course_create_database("Crumpin Fox Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6508","141","72.2","72");

scr_course_create_database("Crystal Lake Golf Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6501","129","71.9","72");

scr_course_create_database("Gardner Municipal","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6131","128","69.8","71");

scr_course_create_database("Granite Fields Golf Club","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6543","130","71.7","72");

scr_course_create_database("Hickory Hills","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6020","119","69.6","71");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6287","123","70.8","71");

scr_course_create_database("Highfields","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6474","134","71.7","72");

scr_course_create_database("Ledges Golf Club","ME",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"black","6981","137","74.2","72");

scr_course_create_database("McCullough's Emerald Links","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6132","125","69.8","71");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6535","135","72.2","71");

scr_course_create_database("Nashua Country Club","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","5965","126","69.8","71");

scr_course_create_database("Newton Commonwealth","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","5354","119","67.0","70");

scr_course_create_database("Olde Scottish Links","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"green","5396","110","65.9","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6306","124","70.3","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"black","6790","126","72.6","72");

scr_course_create_database("Pembroke Country Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6677","132","73.3","71");

scr_course_create_database("Pinehills - Nicklaus","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6640","131","72.2","72");

scr_course_create_database("Putterham Meadows","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","5859","116","68.1","70");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6208","124","70.0","70");

scr_course_create_database("West Bridgewater Country Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"red","4915","120","67.7","71");
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6659","127","70.9","71");

scr_course_create_database("Riverwinds","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6576","128","70.3","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6843","132","72.3","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"black","7086","135","73.8","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"green","6544","126","70.8","72");

scr_course_create_database("Rolling Green","PA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6695","140","73.7","71");

scr_course_create_database("Sagamore Spring","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"black","5972","125","69.1","70");

scr_course_create_database("Shore Gate","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6391","137","71.0","72");

scr_course_create_database("Souhegan Woods","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6507","125","70.3","72");

scr_course_create_database("South Shore Country Club","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6470","132","70.6","72");

scr_course_create_database("Stow Acres C. C.-North Course","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","7001","130","73.7","72");

scr_course_create_database("Stow Acres C. C.-South Course","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6520","128","71.7","72");

scr_course_create_database("Vineyard Golf","NJ",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"white","6358","125","70.4","72");
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6746","129","72.0","72");

scr_course_create_database("Waverly Oaks","MA",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"gold","6682","124","72.3","72");

scr_course_create_database("Windham Country Club","NH",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","6033","130","69.1","72");

scr_course_create_database("Crystal Lake Golf Club","RI",undefined,arr);
scr_course_tee_add(course_struct.subcourses[0].teeData,"blue","5966","119","69.1","71");

//array_sort_nested_struct(arr,"courseName",true);

db(string(array_length(arr))+" courses created");
return arr;
}