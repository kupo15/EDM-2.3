function draw_event_setup_review() {

// main header
surface_bundle_header(headerType.back,headerType.dots,"Review Teams");

// Team submenu
var sort_index = teamlist_index;
var header_arr = active_event_team_header;
var offset = offsetArray[offsetScroll.teamsUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,app_width,1,header_arr,navbar.hidden);
if (header != undefined)
	{
	scr_surface_rebuild_struct("body");
	teamlist_index = header;
	}

element_event_setup_entry_fee(header_arr);

// 
var submit = true;
var col = pick(c_gray,header_color,submit);

if element_shared_finished_draw(col,"Start Event",submit)
	{
	teamlist_index = 0;
	scrollbar_set(offsetScroll.teamsUnderline,0,true);

	//scr_event_struct_setup();
	array_push(ACTIVE_data,active_event); // save to root struct
	
	screen_change(screen.eventEntry);
	
	app_save;
	}

if androidBack
screen_goto_prev();
}