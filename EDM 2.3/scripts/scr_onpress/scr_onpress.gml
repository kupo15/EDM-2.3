function scr_onpress() {

	if onPress
	onPressWidthEnd = width;
	else if !held && (timer[buttonTimers.onPress] == -1)
		{
		onPressWidth = 0;
		onPressWidthEnd = 0;
		}
	
	onPressWidth = lerp(onPressWidth,onPressWidthEnd,onPressLerp);
	}