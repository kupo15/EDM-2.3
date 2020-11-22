
function clickout_region(xx,yy,ww,hh,highlight,_sub) {

var tolerance = 5;
xx -= tolerance;
yy -=tolerance;
ww +=tolerance*2;
hh += tolerance*2;

if submenu != _sub
exit;

if androidBack || (canClick && !click_region(xx,yy,ww,hh,noone,highlight,_sub) && mouse_check_button_released(mb_left))
return true;
else
return false;
}

function click_textbox_set(str,textbox_ind,kvInit,kvGo) {
/// @param string
/// @param textboxInd
/// @param kvType
/// @param [kvGo]

var int = argument[3];

keyboard_string = str;
kvLastString = str;
textboxIndex = textbox_ind; // set the textbox index

vk_initiate(kvInit,kvGo); // popup keyboard
}

function ini_cursor_vars() {

	textboxStringScale = noone;
	textboxStringLength = 0;
	textboxStringWidth = 0;

	cursorSet = false;
	cursorSetIndex = 0;
	cursorPos = 0; // the actual cursor position in string
	cursorPosStart = 0; // the starting position
	cursorXposOff = 0; // the cursor xpos in pixels
	cursorHoverPos = 0;

}

function scr_cursor_position_set(str,scale) {

	if cursorSet
	cursorSetIndex ++;

	if cursorSetIndex < 2
	exit;

	// reset
	cursorSet = false;
	cursorSetIndex = 0;

	var str_length = 0;
	var str_clicked_pos = textboxStringWidth*cursorHoverPos; // xpos within string

	if cursorHoverPos == 0 // clicked before first text character
		{
		cursorPos = 0;
		cursorPosStart = 0;
		cursorXposOff = 0;
		exit;
		}
	else // somewhere in the middle
	for(var i=0;i<textboxStringLength;i++) // loop through characters in string
		{
		var char = string_char_at(str,1+i); // get this character	
		var char_width = string_width(char)*scale; // width of the character
	
		str_length += char_width*0.5; // add half width to string length
		if str_clicked_pos < str_length // if clicked point is before added character
			{
			cursorPos = i;
			cursorPosStart = cursorPos;
			cursorXposOff = str_length-(char_width*0.5);
			exit;
			}
		else str_length += char_width*0.5; // add the rest of the width
		}
	
	// set to the end
	cursorPos = textboxStringLength;
	cursorPosStart = cursorPos;
	cursorXposOff = textboxStringWidth;


}
	
// CLICK REGION FUNCTIONS
function click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,array_pos,alphaValue) {
	
if argument[9] == undefined
alphaValue = 1;
	
var col = c_yellow;
var alpha = 0.3*alphaValue;

var mx = mouse_x;
var my = mouse_y;

var within_region = (mx > x_left) && (mx < x_left+ww) && (my > y_top) && (my < y_top+hh);
var test_failed = (sub != submenu) || !canClick;

if mouse_check_button_pressed(button)
	{
	mouse_xstart = mouse_x;
	mouse_ystart = mouse_y;
	
	mouse_xdist = 0;
	mouse_ydist = 0;
	}

if within_region
	{
	// highlight region
	if (os_type == os_windows) && highlight
		{
		if (sub != submenu)
		var col = c_red;
		else if !canClick && mouse_check_button(mb_left)
		var col = c_orange;
			
		draw_set_alpha(alpha);
		draw_rectangle_colour(x_left,y_top,x_left+ww,y_top+hh,col,col,col,col,false);
		draw_set_alpha(alphaValue);
		}
		
	if test_failed
	exit;
	
	// clicked highlight
	if mouse_check_button_pressed(button) && highlight
		{
		if canClickPressed
		scr_click_highlight_set(x_left,y_top,ww,hh,highlight,screenIndex,array_pos);
		
		canClickPressed = false;
		}
           
	if condition || (condition == undefined)
	    {
		if mouse_check_button_released(button)
			{
			canClick = false;
			canClickPressed = true;
			scrollbarIndexScrolling = noone;
			}
			
	    return true;
	    }
	else 
	return false;
	}

return false;
}

function click_region_released(x_left,y_top,ww,hh,highlight,sub,alpha) {
	
var button = mb_left;	
var condition = mouse_check_button_released(button);
	
return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined,alpha);
}

function click_region_pressed(x_left,y_top,ww,hh,highlight,sub) {
	
var button = mb_left;	
var condition = mouse_check_button_pressed(button);

return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined);
}

function click_region(x_left,y_top,ww,hh,highlight,button,sub) {

var condition = mouse_check_button(button) || mouse_check_button_pressed(button)

if button == noone
var condition = undefined;
	
return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,undefined);
}


function click_region_pressed_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos) {
	
var condition = mouse_check_button_pressed(button);
	
return click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos);
}

function click_region_released_clamp(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos,ref_list,active_sub) {
	
var condition = mouse_check_button_released(button);

// draw clicked highlight
draw_highlight_click_clamp(y_top,yoff,hh,box_hh,array_pos,active_sub);
	
// highlight selected
if (ref_list != undefined) && mode_delete
delete_list_draw_selected(x_left,y_top,yoff,ww,hh,box_hh,deleteList,array_pos);
	
// set list variables to delete
if (ref_list != undefined) && !mode_delete && click_region_pressed_clamp(0,y_top,yoff,ww,hh,box_hh,button,false,sub,array_pos)	
delete_list_set(ref_list,array_pos);
	
return click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos)
}

function click_region_released_clamp_array(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,sub,array_pos,ref_array,active_sub) {
	
var condition = mouse_check_button_released(button);

// draw clicked highlight
draw_highlight_click_clamp(y_top,yoff,hh,box_hh,array_pos,active_sub);
	
// highlight selected
if (ref_array != undefined) && mode_delete
delete_list_draw_selected(x_left,y_top,yoff,ww,hh,box_hh,deleteList,array_pos);
	
// set list variables to delete
if (ref_array != undefined) && !mode_delete && click_region_pressed_clamp(0,y_top,yoff,ww,hh,box_hh,button,false,sub,array_pos)	
delete_list_set_array(ref_array,array_pos);
	
return click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos)
}

function click_region_clamp_set(x_left,y_top,yoff,ww,hh,box_hh,button,highlight,condition,sub,array_pos) {

// change yy and sep/hh
var ypos = y_top+yoff;
var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window
var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = hh-sep_adj;
		
// if hanging off the bottom
if ypos+sep > y_top+box_hh
sep = y_top+box_hh-ypos;

// set variables
y_top = ypos_clamp;
hh = sep;

// y_top += yoff; // top of selection

return click_region_home(x_left,y_top,ww,hh,button,highlight,condition,sub,array_pos);
}


	
