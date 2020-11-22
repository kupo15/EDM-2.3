function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
home,
stats,
playing,
score_list,
course_list,
score_card,
index,
blank7,
blank8,

help_info,
settings,
enumcount,

edit_score,
score_create,
score_view,
score_details,

add_course,
edit_course,

edit_tees,
edit_date,
}

enum highlightAction {
courseSelect,	
navbarSwitch
}

enum course_data {
name,
yardage,
slope,
rating,
par,

enumcount
}

enum score_data {
course,
score_,
strokes,

tee,

}

enum tee_data {
yardage,
slope,
rating,
par
}



enum navbar {
sidebar = -5,
main = -4,
hidden = -1,
numpad,
calendar,
calendarYearSelect,
year_select,

}

enum tee_marker {
green,
red,
white,
blue,
gold,
black
}

