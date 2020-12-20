function draw_event_score_teams() {

draw_clear(c_lt_gray);

// main header
if surface_bundle_header(headerType.back,"Next",PROFILE_data.dispName,0.5) == -1
	{
	screen_change(screen.eventEntryReview);	
	}

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
	
element_event_teams(header_arr);
		
element_teams_popup_entry();		
		
if androidBack
	{
	if submenu == navbar.hidden
	screen_goto_prev();
	else
	submenu = navbar.hidden;
	}
}