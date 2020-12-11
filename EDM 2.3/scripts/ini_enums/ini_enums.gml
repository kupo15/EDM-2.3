function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
appStartup = -1,
eventSetup,
membersList,
stats,
blank3,

help_info,
settings,
enumcount,

home,

profileCreate,
profileView,

memberProfileEdit,
memberProfileView,

edit_date,
}

enum offsetScroll {
navbarYoff,
numpadYoff,
entryYoff,

sidebarXoff,

memberSortUnderline,
memberProfileUnderline,

membersOffset,
groupsOffset,
currencyOffset,
calendarOffset,

sidebarDarken,

enumcount,
}


enum highlightAction {
courseSelect,	
navbarSwitch
}


enum textboxEntry {
dispName,

memberFirstName,
memberLastName,
memberAddress,
memberState,
memberPhone,
	
popupEntryText,
}

enum navbar {
enumstart = -5,
calendar = -4,
calendarYearSelect = -3,
main = -2,
hidden = -1,

sidebar,
numpad,

profileChange,
currencyList,
popupEntry,
}

enum member_sort {
abc,
favorite,
firstName,
lastName,
active,
}

