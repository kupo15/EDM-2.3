function element_teams_popup_entry() {

if submenu != navbar.eventEntry
exit;

var numpad_yoff = 1-offsetArray[offsetScroll.numpadYoff];
var num_xx = app_width-element_numpad.ww;
var ww = app_width*0.5;
var surf_hh = app_height-header_ypos_end;

if surface_set_struct("overlay",0,undefined,surf_hh)
	{
	// draw background
	var col = make_color_rgb(255,227,215);
	draw_clear(col);
			
	element_teams_popup_entry_draw();		
			
	// draw entry info	
	var xx = px(52);
	draw_text_height(xx,0,"ENTER SCORE:",py(5));
			
	// draw numpad
	numpad_hustle_draw(num_xx,surf_hh-element_numpad.hh);
	
	draw_line_pixel(num_xx,0,1,surf_hh,c_gray,1);
	draw_line_pixel(num_xx,surf_hh-element_numpad.hh,ww,1,c_gray,1);
	
	surface_reset_target();
	}
	



// darken screen
draw_rectangle_pixel(0,0,app_width,app_height,c_black,false,0.4);

surface_draw_struct("overlay",0,0,header_ypos_end,1);

numpad_value = numpad_hustle_step(numpad_value,num_xx,app_height-element_numpad.hh,ww);

element_teams_popup_entry_step();

// clickout
if click_region_released(0,0,app_width,header_ypos_end,false,submenu,1)
	{
	submenu = navbar.hidden;
	scr_surface_free_struct("overlay");
	}
}