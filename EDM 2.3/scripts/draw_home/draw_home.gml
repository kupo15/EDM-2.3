function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}

function draw_home() {

draw_clear(c_lt_gray);

// header
surface_bundle_header(headerType.bars,headerType.none,"Hustle");

// body
if surface_set_struct("body")
	{
	element_home_active_event_draw();
	element_home_create_event_draw();
	surface_reset_target();
	}
	

// draw surfaces
surface_draw_struct("body",0,0,0,1);

// body
element_home_active_event_step();

if element_home_create_event_step()
screen_change(screen.eventSetup);

exit;
debugyoff = 0;
debug_device_info(20,200,0,30,30);
}