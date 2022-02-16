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

clickoutX1 = x;
clickoutY1 = y;
clickoutX2 = x+width;
clickoutY2 = y+height;

submitedString = undefined;
	
global.entryEnum = entryType.none;