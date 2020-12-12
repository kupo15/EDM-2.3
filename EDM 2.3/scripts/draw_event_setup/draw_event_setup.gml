
function draw_event_setup() {


var scrollbar_index = offsetScroll.membersOffset;
var sub = submenu;

var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height;
var ww = app_width;
var hh = app_height-yy;
var sep = pct_y(13);
var height = pct_y(4.5);

var selection = draw_members_list_overlay(xx,yy,ww,hh,sep,height,event_entrant_array,undefined,scrollbar_index);
if selection != undefined
	{
	var ref_pointer = selection[1];
	var index = selection[2];

	if array_length(TEAM_array.players) < 5
		{
		array_push(TEAM_array.players,ref_pointer); // add to teamlist
		array_delete(event_entrant_array,index,1); // remove from entrant list
		}
	}

// draw teams
var xx = pct_x(50);
var yy = header_ypos_end;
var ww = app_width;
var hh = app_height-yy;

// main header
draw_screen_header(headerType.back,headerType.none,"Select Entrants");

// player list submenu
var sort_index = META_data.memberSort;
var header_arr = ["A-Z","Favorites"];
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,ww,1,header_arr);
if (header != undefined)
	{
	scr_memberlist_sort(header);
	app_save;
	
	// jump to top
	if META_data.memberSort == member_sort.favorite
		{
		offsetArray[scrollbar_index] = 0;
		offsetArrayStart[scrollbar_index] = 0;
		}
	}

	
if androidBack
screen_goto_prev();
}