function element_teams_popup_entry() {

if submenu != navbar.eventEntry && submenu != navbar.numpad
exit;

var numpad_yoff = 1-offsetArray[offsetScroll.numpadYoff];
var ww = app_width*0.5;
var surf_hh = app_height-header_ypos_end;
var num_xx = app_width-element_numpad.ww;
var num_yy = surf_hh-element_numpad.hh;
var num_ww = app_width-num_xx;

var front = PLAYER_array[teammate_index].frontScore;
var back = PLAYER_array[teammate_index].backScore;

if surface_set_struct("overlay",0,undefined,surf_hh)
	{
	// draw background
	var col = make_color_rgb(255,227,215);
	draw_clear(col);
			
	element_teams_popup_entry_draw();		
			
	// draw entry info	
	var xx = px(52);
	var height = py(5);
	
	draw_text_height(xx,0,"ENTER SCORE:",height);
	
	draw_text_height(xx,height,PLAYER_array[teammate_index].dispName,height*1.5);
	
	// draw scores
	var yy = py(20);
	
	draw_text_height(num_xx+(num_ww*0.25),yy,"Front Nine",height,undefined,undefined,fa_center);
	draw_text_height(num_xx+(num_ww*0.75),yy,"Back Nine",height,undefined,undefined,fa_center);
	
	draw_line_pixel(num_xx+(num_ww*0.5),yy+py(2),1,py(7),c_gray,1);
	
	// score	
	var front_str = pick(front,"-",front=="");
	var back_str = pick(back,"-",back=="");
	
	draw_text_height(num_xx+(num_ww*0.25),yy+height,front_str,height,undefined,undefined,fa_center);
	draw_text_height(num_xx+(num_ww*0.75),yy+height,back_str,height,undefined,undefined,fa_center);
			
	// draw numpad
	numpad_hustle_draw(num_xx,num_yy);
	
	draw_line_pixel(num_xx,0,1,surf_hh,c_gray,1);
	draw_line_pixel(num_xx,num_yy,ww,1,c_gray,1);
	
	surface_reset_target();
	}
	
// darken screen
draw_rectangle_pixel(0,0,app_width,app_height,c_black,false,0.4);

surface_draw_struct("overlay",0,0,header_ypos_end,1);

var _score = pick(front,back,score_nine_index==1);
numpad_value = numpad_hustle_step(_score,num_xx,app_height-element_numpad.hh,ww);

switch score_nine_index
	{
	case 0: PLAYER_array[teammate_index].frontScore = numpad_value; break;
	case 1: PLAYER_array[teammate_index].backScore = numpad_value; break;
	}

//switch score_nine_index
//	{
//	case 0: PLAYER_array[teammate_index].frontScore = numpad_value; break;
//	case 1: PLAYER_array[teammate_index].backScore = numpad_value; break;
//	}
	

element_teams_popup_entry_step();

// score entry step
var button_ww = num_ww*0.5;
var button_hh = py(12.6);
var offset = offsetArray[offsetScroll.nineScoreUnderline];
var xx = num_xx+(offset*button_ww)+(button_ww*0.25);
var yy = py(41);

draw_rectangle_pixel(xx,yy,button_ww*0.5,py(0.5),header_color,false,0.5);

for(var i=0;i<2;i++)
if click_region_released(num_xx+(i*button_ww),py(36.2),button_ww,button_hh,true,submenu,1)
	{
	score_nine_index = i;	
	numpad_value = pick(front,back,i==1)
	break;
	}	
	

// pressed done on keypad
if numpad_next
	{
	score_nine_index++;
	
	if score_nine_index == 2
		{
		var team_size = array_length(TEAM_array);

		if teammate_index+1 < team_size
		teammate_index++;
		else
			{
			var teams = array_length(active_event.teams);
			if teamlist_index+1 < teams
				{
				teamlist_index++;
				teammate_index = 0;
				score_nine_index = 0; // set to front
				}
			}
		}
	}
	

// clickout
if click_region_released(0,0,app_width,header_ypos_end,false,submenu,1)
	{
	submenu = navbar.hidden;
	scr_surface_free_struct("overlay");
	}
}