#macro highlight_color c_yellow

enum buttonTimers {
	
	onPress,
	enumcount,
	}

mouseEntered = false;
onPress = false;
clicked = false;
released = false;
active = false;

ini_timers(buttonTimers.enumcount);

// highlight
onPressWidth = 0;
onPressWidthEnd = 0;
onPressLerp = 0.2;