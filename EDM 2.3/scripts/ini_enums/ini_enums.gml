function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
home,
stats,
playing,
score_list,
course_list,
score_card,
indexTrend,
handicapSeason,

help_info,
settings,
enumcount,

edit_score,
score_create,
score_view,
score_details,

score_card_details,

profileCreate,
profileView,

playing_score_enter,

create_course,
edit_course,

edit_tees,
edit_tees_from_teebar,
edit_date,
}

enum offsetScroll {
navbarYoff,
numpadYoff,
coursebarYoff,
teebarYoff,
locationYoff,
roundtypeYoff,
entryYoff,

sidebarXoff,

scoreSortUnderline,
courseSortUnderline,

scorelistOffset,
courselistOffset,
seasonOffset,
statsOffset,
indexOffset,
calendarOffset,

enumcount,
}

enum trendType {
indexYearly,
indexMax,
	
}

enum score_sort {
currentYear,
lastYear,
allScores
}

enum course_sort {
abc,
frequency,
favorite
}

enum round_Type {
practice,
normal,
tournament	
}

enum highlightAction {
courseSelect,	
navbarSwitch
}

enum textboxEntry {
dispName,	
	
courseName,
courseYardage,
courseSlope,
courseRating,
coursePar,

grossScore,
strokes,	
	
popupEntryText,
}

enum navbar {
enumstart = -5,
calendar = -4,
calendarYearSelect = -3,
main = -2,
hidden = -1,

profileChange,
sidebar,

coursebar,
locationbar,
teebar,
year_select,
parbar,
roundtype,
scorebar,
numpad,
popupEntry,
}

enum tee_marker {
green,
red,
white,
blue,
gold,
black
}

