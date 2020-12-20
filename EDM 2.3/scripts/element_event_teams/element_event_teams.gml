function element_event_teams(header_arr) {

// draw teams
var xx = px(2);
var yy = 0;
var ww = px(99);

var sep = py(11);
var height = sep*0.5;
var hh = 6*sep;

var gross_xx = px(68.6);
var net_xx = px(90.3);
var button_ww = px(6.5);
var buffer = px(4);

if surface_set_struct("body",undefined,undefined,py(75))
	{		
	// draw team info
	var team_pointer = active_event.teams[teamlist_index];
	var col = header_color;

	draw_text_height_color(px(2),yy,header_arr[teamlist_index],col,height*0.8); // team number

	var labels = ["Front","Back","Gross Skins","Net Skins"];
	var col = c_black;

	draw_text_height(px(44)-xx,yy,labels[0],height*0.95,undefined,undefined,fa_center);
	draw_text_height(px(52)-xx,yy,labels[1],height*0.95,undefined,undefined,fa_center);
	draw_text_height(gross_xx-xx,yy,labels[2],height*0.95,undefined,undefined,fa_center);
	draw_text_height(net_xx-xx,yy,labels[3],height*0.95,undefined,undefined,fa_center);

	// draw background
	var yy = height*0.8;
	var col = c_white;
	draw_roundrect_color(0,yy,ww,yy+hh,col,col,false);
	
	// skins background
	var col = make_color_rgb(244,244,244);
	draw_roundrect_color(gross_xx-buffer-button_ww-xx,yy,ww,yy+hh,col,col,false);	

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
			case 0: draw_text_height_middled(px(3)-xx,yy+yoff,name,sep,height,1); break; // player name
			case 1: draw_text_height_middled(px(44)-xx,yy+yoff,front_str,sep,height,1,undefined,undefined,fa_center); break; // front
			case 2: draw_text_height_middled(px(52)-xx,yy+yoff,back_str,sep,height,1,undefined,undefined,fa_center); break; // back
			case 3: draw_text_height_middled(gross_xx-xx,yy+yoff,gross_skins,sep,height,1,undefined,undefined,fa_center); break; // gross skins
			case 4: draw_text_height_middled(net_xx-xx,yy+yoff,net_skins,sep,height,1,undefined,undefined,fa_center); break; // net skins
			case 5: draw_line_pixel(px(4),yy+yoff+sep,ww-px(5),1,c_lt_gray,1); break; // sep line
			
			case 6: 	
			
				var col = c_lt_gray;
				draw_line_pixel(gross_xx-buffer-button_ww-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				draw_line_pixel(gross_xx-buffer-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				draw_line_pixel(gross_xx+buffer-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				draw_line_pixel(gross_xx+buffer+button_ww-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
		
				draw_line_pixel(net_xx-buffer-button_ww-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				draw_line_pixel(net_xx-buffer-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				draw_line_pixel(net_xx+buffer-xx,yy+yoff+(sep*0.05),1,sep*0.9,col,1);
				
				var col = c_gray;
				draw_line_pixel(gross_xx-buffer-(button_ww*0.6)-xx,yy+yoff+(sep*0.5),button_ww*0.3,py(0.27),col,1);
				draw_plus_button(gross_xx+buffer+(button_ww*0.5)-xx,yy+yoff+(sep*0.5),sep*0.75,col,1);
										
				draw_line_pixel(net_xx-buffer-(button_ww*0.6)-xx,yy+yoff+(sep*0.5),button_ww*0.3,py(0.27),col,1);
				draw_plus_button(net_xx+buffer+(button_ww*0.5)-xx,yy+yoff+(sep*0.5),sep*0.75,col,1);
				break;
			}
		}
		
	surface_reset_target();
	}
	
	
var xx = px(0.5);
var ypos = subheader_ypos_end+py(1); //0

surface_draw_struct("body",0,xx,ypos,1);

var yy = py(32);

element_event_teams_step(xx,yy,ww,sep,gross_xx,net_xx,button_ww,buffer);
}	
	
	
function element_event_teams_step(xx,yy,ww,sep,gross_xx,net_xx,button_ww,buffer) {

var sub = navbar.hidden;
var xoff = px(1.5);

var player_num = array_length(active_event.teams[teamlist_index].players);
for(var n=0;n<player_num;n++)
	{
	var yoff = n*sep;

	if click_region_pressed(gross_xx-buffer-button_ww-xoff,yy+yoff,button_ww,sep,true,sub) // minus 
		{
		scr_surface_rebuild_struct("body");
		PLAYER_array[n].grossSkins--;
		
		if PLAYER_array[n].grossSkins < 0
		PLAYER_array[n].grossSkins = 0;
		}
	else if click_region_pressed(gross_xx+buffer-xoff,yy+yoff,button_ww,sep,true,sub) // plus
		{
		scr_surface_rebuild_struct("body");
		PLAYER_array[n].grossSkins++;
		}
	else if click_region_pressed(net_xx-buffer-button_ww-xoff,yy+yoff,button_ww,sep,true,sub) // minus
		{
		scr_surface_rebuild_struct("body");
		PLAYER_array[n].netSkins--;
		
		if PLAYER_array[n].netSkins < 0
		PLAYER_array[n].netSkins = 0;
		}
	else if click_region_pressed(net_xx+buffer-xoff,yy+yoff,button_ww,sep,true,sub) // plus
		{
		scr_surface_rebuild_struct("body");
		PLAYER_array[n].netSkins++;
		}
	else if click_region_released(xx,yy+yoff,ww*0.56,sep,true,sub,1) // player
		{
		submenu = navbar.eventEntry;
		}
	}
}
