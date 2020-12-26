function element_teams_popup_entry_draw() {

// teams label
//draw_text_height(px(2),0,"Entrants:",height);
var ww = app_width*0.5;

var team_num = array_length(active_event.teams);


var height = py(4);

var button_sep = ww/6;
var button_ww = button_sep*0.9;
var button_hh = height*2;

var xx = (button_sep-button_ww)*0.5;
var yy = py(1);

for(var i=0;i<team_num;i++)
	{
	var off_pos = i*button_sep;
	
	var col = c_black;
	draw_roundrect_color(xx+off_pos,yy,xx+off_pos+button_ww,yy+button_hh,col,col,true);
	click_button(xx+off_pos,yy,"Team "+string(i+1),height,c_black,button_ww,button_hh,undefined,true,true,navbar.enumstart);
	}

// team list
var xx = px(6);
var yy = py(13);
var sep = py(10);
var height = sep*0.5;

var players_list = active_event.teams[teamlist_index].players;
var team_size = array_length(players_list);
for(var i=0;i<team_size;i++)
	{
	var off_ind = i;
	var off_pos = off_ind*sep;
			
	var entrant_pointer = players_list[i];
	var name = entrant_pointer.dispName;
	var front = entrant_pointer.frontScore;
	var back = entrant_pointer.backScore;
	var front_str = pick(front,"-",front == "");
	var back_str = pick(back,"-",back == "");
	
	var col = pick(c_black,header_color,i==teammate_index);

	draw_text_height_middled_color(px(2),yy+off_pos,string(off_ind+1)+".",sep,col,height,1); // draw entrant number
	draw_text_height_middled_color(xx,yy+off_pos,name,sep,col,height,1); // draw entrant name
	
	draw_text_height_middled_color(px(40),yy+off_pos,front_str,sep,col,height,1,undefined,undefined,fa_center); // draw front nine
	draw_text_height_middled_color(px(45),yy+off_pos,back_str,sep,col,height,1,undefined,undefined,fa_center); // draw back nine
			
	draw_line_pixel(px(4),yy+off_pos+sep,ww-px(10),1,c_gray,1);
	}
}

function element_teams_popup_entry_step() {

// team header
var team_num = array_length(active_event.teams);

var ww = app_width*0.5;
var height = py(4);

var button_sep = ww/6;
var button_ww = button_sep*0.9;
var button_hh = height*2;

var xx = (button_sep-button_ww)*0.5;
var yy = py(1)+header_ypos_end;

for(var i=0;i<team_num;i++)
	{
	var off_pos = i*button_sep;
	
	if click_region_released(xx+off_pos,yy,button_ww,button_hh,true,submenu,1)
		{
		teammate_index = 0;
		teamlist_index = i;
		score_nine_index = 0;
		
		numpad_value = PLAYER_array[teammate_index].frontScore;
		scr_surface_rebuild_struct("overlay");
		break;
		}
	}
	
// draw highlighted team
var xpos = xx+(teamlist_index*button_sep);

draw_rectangle_pixel(xpos,yy,button_ww,button_hh,header_color,false,0.3);	


// team list
var xx = px(6);
var yy = py(13)+header_ypos_end;
var sep = py(10);

var players_list = active_event.teams[teamlist_index].players;
var team_size = array_length(players_list);
for(var i=0;i<team_size;i++)
	{
	var off_ind = i;
	var off_pos = off_ind*sep;
					
	if click_region_released(0,yy+off_pos,ww,sep,true,submenu,1)
		{
		teammate_index = i;
		score_nine_index = 0;
		
		numpad_value = PLAYER_array[teammate_index].frontScore;
		
		scr_surface_rebuild_struct("overlay");
		break;
		}
	}
	
// draw highlighted player
var offset = offsetArray[offsetScroll.entryPlayerIndex];
var ypos = yy+(offset*sep);

draw_rectangle_pixel(0,ypos,ww,sep,c_white,false,0.25);

#region clicked finished
var submit = true; // active_event.entrantNum > 1;
var xx = px(0.5);
var ww = app_width*0.5*0.98;
var hh = py(10);
var height = hh*0.6;
var yy = app_height-hh-py(1);
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,submenu) && submit
	{
	androidBack = true;
	}
#endregion
}