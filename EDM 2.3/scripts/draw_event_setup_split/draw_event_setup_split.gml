
function draw_event_setup_split() {


var scrollbar_index = offsetScroll.membersOffset;
var sub = submenu;

var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height;
var ww = app_width*0.5;
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
var ww = app_width*0.5;
var hh = app_height-yy;

var header_hh = pct_y(10);

draw_line_pixel(xx,yy,1,app_height,c_gray,0.8); // dividing line

// main header
draw_screen_header(headerType.back,headerType.none,"Event Setup");

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

// team list submenu
var sort_index = teamlist_index;
var header_arr = ["Team 1","Team 2","Team 3","Team 4","Team 5","Team 6"];
var offset = offsetArray[offsetScroll.teamsUnderline];
var header = draw_screen_header_submenu(offset,sort_index,app_width*0.5,ww,0.65,header_arr);
if (header != undefined)
teamlist_index = header;

// draw teams
var xx = app_width*0.75;
var yy = header_ypos_end+header_submenu_height;
var height = pct_y(4.5)*1.2;

var team_array = TEAM_array;
var player_count = array_length(TEAM_array.players);

for(var i=0;i<player_count;i++)
	{
	var off_pos = sep*i;
	
	var ref_pointer = TEAM_array.players[i];
	var memberID = ref_pointer.memberID;

	var entrant_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");
	var firstName = entrant_pointer.firstName;
	var lastName = entrant_pointer.lastName;
	var entrant_name = firstName+" "+lastName;
	
	draw_text_height_middled(xx,yy+off_pos,entrant_name,sep,height,1,undefined,undefined,fa_center);
	draw_line_pixel(xx-(ww*0.375),yy+off_pos+sep,ww*0.75,1,c_gray,0.8);
	
	
	if click_region_released_clamp_array(ww,yy,off_pos,ww,sep,hh,mb_left,c_yellow,sub,i,undefined,undefined)
		{
		array_push(event_entrant_array,ref_pointer); // add back to entrant list
		array_delete(TEAM_array.players,i,1); // remove from team list

		i--;
		player_count --;
		}
	}

// draw circles
	

if androidBack
screen_goto_prev();
}