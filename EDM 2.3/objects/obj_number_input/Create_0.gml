keyWidth = 120;
keyHeight = 100;
submitHeight = 100;
displayHeight = 100;

width = 3*keyWidth;
height = 4*keyHeight+displayHeight;

surf = -1;

maxCharacters = 3;
entryString = "";
startingString = "";
blankStringDisplay = "-";
active = false;

x = room_width-width;
y = room_height-height;

submitedString = undefined;

enum entryType {
	
	none,
	teamEntry,
	lowNetEntry,
	skinsEntry,
	blindFee,
	teamPayout,
	lowNetPayout,
	}
	
global.entryEnum = entryType.none;