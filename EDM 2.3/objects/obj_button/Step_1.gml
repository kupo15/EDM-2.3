mouseEntered = point_in_rectangle(mouse_x,mouse_y,x,y,x+width,y+height);
held = mouse_check_button(mb_left);
released = mouse_check_button_released(mb_left);

if mouseEntered
	{
	onPress = mouse_check_button_pressed(mb_left);
	clicked = mouse_check_button_released(mb_left);
	}

if onPress
	{
	active = true;
	timer[buttonTimers.onPress] = 30;
	}
else if released
active = false;

scr_timers();