function element_event_setup_teams(xx,width) {

// draw teams
var yy = header_ypos_end;
var ww = app_width*width;
var hh = app_height-yy;

var header_hh = pct_y(10);

draw_line_pixel(xx,yy,1,app_height,c_gray,0.8); // dividing line

#region team list submenu
var sort_index = teamlist_index;
var header_arr = ["Team\n1","Team\n2","Team\n3","Team\n4","Team\n5","Team\n6"];
var offset = offsetArray[offsetScroll.teamsUnderline];
var header = draw_screen_header_submenu(offset,sort_index,xx,ww,1.5,header_arr);
if (header != undefined)
	{
	teamlist_index = header;
	scr_surface_rebuild_struct("body");
	}
#endregion

#region draw circles
var size = array_length(header_arr);
var region_sep = ww/size;
var rr = py(0.4);
var hsep = rr*2.6;
var yy = header_ypos_end+py(9);

for(var n=0;n<size;n++)
	{
	var xpos = xx+px(1.5)+(n*region_sep);
	var team_size = array_length(setup_team_struct[n].players);

	for(var i=0;i<team_size;i++)
		{
		var xoff = i*hsep;
		draw_circle_color(xpos+xoff,yy,rr,c_white,c_white,false);
		}
	}
#endregion

#region draw teams

var xpos = ww*0.5;
var yy = 0;
var sep = pct_y(11.5);
var height = sep*0.5;
var sub = submenu;
	
var team_array = setup_team_struct[teamlist_index];
var player_count = array_length(setup_team_struct[teamlist_index].players);
	
if surface_set_struct("body",0,app_width*0.45)
	{
	for(var i=0;i<player_count;i++)
		{
		var off_pos = sep*i;
	
		var ref_pointer = setup_team_struct[teamlist_index].players[i];
		var memberID = ref_pointer.memberID;

		var entrant_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");
		var firstName = entrant_pointer.firstName;
		var lastName = entrant_pointer.lastName;
		var entrant_name = firstName+" "+lastName;
	
		// entrant name
		draw_text_height_middled(xpos,yy+off_pos,entrant_name,sep,height,1,undefined,undefined,fa_center);
		}

	for(var i=0;i<5;i++)
		{
		var off_pos = sep*i;
		draw_line_pixel(xpos-(ww*0.375),yy+off_pos+sep,ww*0.75,1,c_gray,0.8);
		}
		
	surface_reset_target();
	}
	
var yy = header_ypos_end+header_submenu_height;

surface_draw_struct("body",0,xx,yy,1);	
#endregion
	
// click
for(var i=0;i<player_count;i++)
	{
	var off_pos = sep*i;
	
	if click_region_released_clamp_array(xx,yy,off_pos,ww,sep,hh,mb_left,c_yellow,sub,i,undefined,undefined)
		{
		var ref_pointer = setup_team_struct[teamlist_index].players[i];
		var memberID = ref_pointer.memberID;

		var entrant_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");
		var firstName = entrant_pointer.firstName;
		var lastName = entrant_pointer.lastName;
		var entrant_name = firstName+" "+lastName;
	
		array_push(event_entrant_array,ref_pointer); // add back to entrant list
		array_delete(setup_team_struct[teamlist_index].players,i,1); // remove from team list
		
		var curr_sort = META_data.memberSort;
		scr_memberlist_sort(event_entrant_array,member_sort.abc);
		scr_memberlist_sort(event_entrant_array,curr_sort);
		
		scr_surface_rebuild_struct("scrollVert");
		scr_surface_rebuild_struct("body");

		active_event.entrantNum --;
		i--;
		player_count --;
		}
	}

#region clicked next
var submit = active_event.entrantNum > 1;
xx += px(0.5);
var ww = app_width*width*0.98;
var hh = py(10);
var height = hh*0.5;
var yy = app_height-hh-py(1);
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Next",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	screen_change(screen.eventReview);
	}
#endregion
}