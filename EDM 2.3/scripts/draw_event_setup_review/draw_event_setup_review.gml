function draw_event_setup_review() {

// main header
surface_bundle_header(headerType.back,headerType.none,"Review Teams");

var submit = true;
var col = pick(c_gray,header_color,submit);

if element_shared_finished_draw(col,"Start Event",submit)
	{
	teamlist_index = 0;
	scrollbar_set(offsetScroll.teamsUnderline,0,true);

	scr_event_struct_setup();
	screen_change(screen.eventEntry);
	}

if androidBack
screen_goto_prev();
}