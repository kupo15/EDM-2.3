function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

draw_clear(c_lt_gray);

// header
if surface_set(surfaces.header)
	{
	element_header_draw(headerType.bars,headerType.none,"Hustle");
	element_header_delete_draw();
	surface_reset_target();
	}

// body
if surface_set(surfaces.scroll0)
	{
	element_home_active_event_draw();
	element_home_create_event_draw();
	surface_reset_target();
	}

// draw surfaces
surface_draw(surfaces.header,0,0,1);
surface_draw(surfaces.scroll0,0,0,1);


// click //

// header
element_header_step(headerType.bars,headerType.none);
element_header_delete_step();

// body
element_home_active_event_step();

if element_home_create_event_step()
screen_change(screen.eventSetup);



exit;
debugyoff = 0;
debug_device_info(20,200,0,30,30);
}