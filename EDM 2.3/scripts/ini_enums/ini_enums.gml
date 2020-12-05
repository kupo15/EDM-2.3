function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
home,
members,
stats,
blank3,
blank4,
blank5,


help_info,
settings,
enumcount,

profileCreate,
profileView,

edit_date,
}

enum offsetScroll {
navbarYoff,
numpadYoff,
entryYoff,

sidebarXoff,

scoreSortUnderline,
courseSortUnderline,

calendarOffset,

enumcount,
}


enum highlightAction {
courseSelect,	
navbarSwitch
}

enum textboxEntry {
dispName,	
	
popupEntryText,
}

enum navbar {
enumstart = -5,
calendar = -4,
calendarYearSelect = -3,
main = -2,
hidden = -1,

sidebar,

year_select,
numpad,
popupEntry,
}

