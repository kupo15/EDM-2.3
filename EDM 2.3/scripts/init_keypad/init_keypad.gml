#macro KEYPAD_ACTIVE obj_number_input.active

function init_keypad(entry_enum,initValue="",blankValue="-",_negate=false,xx=obj_number_input.x,yy=obj_number_input.y,clickout_x1=undefined,clickout_y1=undefined,clickout_x2=undefined,clickout_y2=undefined) {

	with obj_number_input {
		
		if (clickout_x1 == undefined)
		clickout_x1 = xx;
		
		if (clickout_y1 == undefined)
		clickout_y1 = yy;
		
		if (clickout_x2 == undefined)
		clickout_x2 = xx+width;
		
		if (clickout_y2 == undefined)
		clickout_y2 = yy+height;
		
		x = xx;
		y = yy;
		
		clickoutX1 = clickout_x1;
		clickoutY1 = clickout_y1;
		clickoutX2 = clickout_x2;
		clickoutY2 = clickout_y2;
		
		negate = _negate;
		active = true;
		entryString = initValue;
		startingString = initValue;
		blankStringDisplay = blankValue;
	    global.entryEnum = entry_enum;
		}
	}
	
function keypad_set_value(entry_enum,initValue="",blankValue="-",_negate=false) {
	
	with obj_number_input {
		
		global.entryEnum = entry_enum;

		negate = _negate;
		entryString = initValue;
		startingString = initValue;
		blankStringDisplay = blankValue;
		}
	}