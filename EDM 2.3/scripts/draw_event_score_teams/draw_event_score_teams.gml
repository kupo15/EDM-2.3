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
teamlist_index = header;
	
// draw teams
var xx = px(1);
var yy = subheader_ypos_end+py(1); //0
var ww = px(98);

var sep = py(11);
var height = sep*0.6;
var hh = 6*sep;
		
// draw team info
var team_pointer = active_event.teams[teamlist_index];
var col = header_color;

draw_text_height_color(xx+px(2),yy,header_arr[teamlist_index],col,height*0.8); // team number

var labels = ["Front","Back","Gross Skins","Net Skins"];
var col = c_black;

draw_text_height(px(45),yy,labels[0],height*0.8,undefined,undefined,fa_center);
draw_text_height(px(53),yy,labels[1],height*0.8,undefined,undefined,fa_center);
draw_text_height(px(69),yy,labels[2],height*0.8,undefined,undefined,fa_center);
draw_text_height(px(90),yy,labels[3],height*0.8,undefined,undefined,fa_center);

// draw background
yy += height*0.8;
var col = c_white;
draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

// draw player info
var element_num = 7;
var player_num = array_length(team_pointer.players);
for(var e=0;e<element_num;e++)
for(var n=0;n<player_num;n++)
	{
	var yoff = n*sep;
		
	var player_pointer = team_pointer.players[n];
	var name = player_pointer.dispName;
	var front_score = player_pointer.frontScore;
	var back_score = player_pointer.backScore;
	var gross_skins = player_pointer.grossSkins;
	var net_skins = player_pointer.netSkins;
	var blind = player_pointer.blind;
	var no_team = player_pointer.noTeam;
	
	var front_str = pick(front_score,"-",front_score = "");
	var back_str = pick(back_score,"-",back_score = "");
			
	switch e
		{
		case 0: draw_text_height_middled(xx+px(3),yy+yoff,name,sep,height,1,undefined,undefined,fa_center); break; // player name
		case 1: draw_text_height_middled(px(45),yy+yoff,front_str,sep,height,1,undefined,undefined,fa_center); break; // front
		case 2: draw_text_height_middled(px(53),yy+yoff,back_str,sep,height,1,undefined,undefined,fa_center); break; // back
		case 3: draw_text_height_middled(px(69),yy+yoff,gross_skins,sep,height,1,undefined,undefined,fa_center); break; // gross skins
		case 4: draw_text_height_middled(px(90),yy+yoff,net_skins,sep,height,1,undefined,undefined,fa_center); break; // net skins
		case 5: draw_line_pixel(px(5),yy+yoff+sep,ww-px(5),1,c_lt_gray,1); break; // sep line
		
		case 6: 
			// draw gross skins
			draw_icon_height_centered(ico_add_delete,1,px(59),yy+yoff,px(6.5),sep,sep*0.7,1); // minus
			draw_icon_height_centered(ico_add_delete,0,px(72),yy+yoff,px(6.5),sep,sep*0.7,1); // plus
			
			// draw net skins
			draw_icon_height_centered(ico_add_delete,1,px(80),yy+yoff,px(6.5),sep,sep*0.7,1); // minus
			draw_icon_height_centered(ico_add_delete,0,px(92.6),yy+yoff,px(6.5),sep,sep*0.7,1); // plus
			
			break;
		}
	
	if e+1 != element_num
	continue;
	
	
	if click_region_pressed(px(59),yy+yoff,px(6.5),sep,true,submenu) // minus 
		{
		PLAYER_array[n].grossSkins--;
		
		if PLAYER_array[n].grossSkins < 0
		PLAYER_array[n].grossSkins = 0;
		}
	else if click_region_pressed(px(72),yy+yoff,px(6.5),sep,true,submenu) // plus
		{
		PLAYER_array[n].grossSkins++;
		}
	else if click_region_pressed(px(80),yy+yoff,px(6.5),sep,true,submenu) // minus
		{
		PLAYER_array[n].netSkins--;
		
		if PLAYER_array[n].netSkins < 0
		PLAYER_array[n].netSkins = 0;
		}
	else if click_region_pressed(px(92.6),yy+yoff,px(6.5),sep,true,submenu) // plus
		{
		PLAYER_array[n].netSkins++;
		}
	else click_region_released(xx,yy+yoff,ww*0.58,sep,true,submenu,1) // player
		{
		}
	}
		
if androidBack
screen_goto_prev();
}