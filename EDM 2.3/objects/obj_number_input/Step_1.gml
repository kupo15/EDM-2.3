// close if clickout

var clickoutWidth = clickoutX2-clickoutX1;
var clickoutHeight = clickoutY2-clickoutY1;

if mouse_check_button_released(mb_left) && !scr_button_hover(clickoutX1,clickoutY1,clickoutWidth,clickoutHeight,true) && !TEELIST_ACTIVE
active = false;