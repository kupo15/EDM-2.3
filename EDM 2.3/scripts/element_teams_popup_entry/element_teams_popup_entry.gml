function element_teams_popup_entry() {

if submenu != navbar.eventEntry
exit;

var numpad_yoff = 1-offsetArray[offsetScroll.numpadYoff];
var xx = app_width-element_numpad.ww;
var ww = app_width*0.5;
var hh = app_height-header_ypos_end;

if surface_set_struct("overlay",0,undefined,hh)
	{
	// draw background
	var col = make_color_rgb(255,227,215);
	draw_clear(col);
		
	// draw numpad
	numpad_hustle_draw(xx,hh-element_numpad.hh);
	surface_reset_target();
	}

surface_draw_struct("overlay",0,0,header_ypos_end,1);

numpad_value = numpad_hustle_step(numpad_value,xx,app_height-element_numpad.hh,ww);

}