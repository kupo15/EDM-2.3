
function draw_event_setup_split() {

var member = draw_memberslist(app_width*0.55,MEMBER_list,undefined);
if member != undefined
	{
	var ref_pointer = member[1];
	var index = member[2];

	if array_length(TEAM_array.players) < 5
		{
		array_push(TEAM_array.players,ref_pointer); // add to teamlist
		array_delete(event_entrant_array,index,1); // remove from entrant list
		}
	}

// draw teams
var xx = pct_x(55);
var yy = header_ypos_end;
var ww = app_width*0.55;
var hh = app_height-yy;

// main header
surface_bundle_header(headerType.back,headerType.none,"Select Entrants");

// player list submenu
var sort_index = META_data.memberSort;
var header_arr = ["A-Z","Favorites"];
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,ww,1,header_arr);
if (header != undefined)
	{
	scr_surface_rebuild_struct("scrollVert");
	scr_memberlist_sort(header);
	app_save;
	
	// jump to top
	if META_data.memberSort == member_sort.favorite
	scrollbar_set(offsetScroll.membersOffset,0,true);
	}

element_event_setup_teams(xx,0.45);


// pressed back
if androidBack
screen_goto_prev();
}