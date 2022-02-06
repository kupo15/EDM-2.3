#macro KEYPAD_ACTIVE obj_number_input.active

function init_keypad(entry_enum,initValue="",blankValue="-",xx=obj_number_input.x,yy=obj_number_input.y) {

	with obj_number_input {
		
		x = xx;
		y = yy;
		
		active = true;
		entryString = initValue;
		startingString = initValue;
		blankStringDisplay = blankValue;
	    global.entryEnum = entry_enum;
		}
	}