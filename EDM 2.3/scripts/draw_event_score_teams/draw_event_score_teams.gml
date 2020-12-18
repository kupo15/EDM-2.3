function draw_event_score_teams() {

draw_clear(c_lt_gray);

// main header
surface_bundle_header(headerType.back,headerType.none,PROFILE_data.dispName,0.5);

// Team submenu
var sort_index = teamlist_index;
var header_arr = active_event_team_header;
var offset = offsetArray[offsetScroll.teamsUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,app_width,1,header_arr);
if (header != undefined)
	{
	scr_surface_rebuild_struct("body");
	teamlist_index = header;
	}
	
element_event_teams(header_arr);
		
if androidBack
screen_goto_prev();
}