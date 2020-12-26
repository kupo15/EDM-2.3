function draw_event_setup_review() {

// main header
surface_bundle_header(headerType.back,headerType.none,"Review Teams");

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

// draw teams
var xx = px(2);
var yy = 0;
var ww = px(99);

var sep = py(11);
var height = sep*0.5;
var hh = 6*sep;

var blind_xx = px(54);
var entry_xx = px(77);
var waive_xx = px(90.3);
var button_ww = px(6.5);
var buffer = px(4);

if surface_set_struct("body",undefined,undefined,py(75))
	{		
	// draw team info
	var col = header_color;

	draw_text_height_color(px(2),yy,header_arr[teamlist_index],col,height*0.8); // team number

	var labels = ["Blind Team","Entry Fee","Waive Fee"];
	var col = c_black;

	draw_text_height(blind_xx,yy,labels[0],height*0.95,undefined,undefined,fa_center);
	draw_text_height(entry_xx,yy,labels[1],height*0.95,undefined,undefined,fa_center);
	draw_text_height(waive_xx,yy,labels[2],height*0.95,undefined,undefined,fa_center);

	// draw player info
	var element_num = 5;
	var player_num = array_length(TEAM_array.players);
	for(var e=0;e<element_num;e++)
	for(var n=0;n<player_num;n++)
		{
		var yoff = n*sep;
		
		var player_pointer = TEAM_array.players[n];
		var name = player_pointer.dispName;
		var blind = player_pointer.blind;
		var no_team = player_pointer.noTeam;

		var blind_str = pick(blind,"n/a",blind == undefined);

		switch e
			{
			case 0: draw_text_height_middled(px(3)-xx,yy+yoff,name,sep,height,1); break; // player name
			case 1: draw_text_height_middled(blind_xx,yy+yoff,blind_str,sep,height,1,undefined,undefined,fa_center); break; // blind team
			case 2: draw_text_height_middled(entry_xx,yy+yoff,no_team,sep,height,1,undefined,undefined,fa_center); break; // entry fee
			case 3: draw_text_height_middled(waive_xx,yy+yoff,no_team,sep,height,1,undefined,undefined,fa_center); break; // waived fee
			case 4: draw_line_pixel(px(4),yy+yoff+sep,ww-px(5),1,c_lt_gray,1); break; // line
			}
		}
		
	surface_reset_target();
	}
	
	
var xx = px(0.5);
var ypos = subheader_ypos_end+py(1); //0

surface_draw_struct("body",0,xx,ypos,1);

// 
var submit = true;
var col = pick(c_gray,header_color,submit);

if element_shared_finished_draw(col,"Start Event",submit)
	{
	teamlist_index = 0;
	scrollbar_set(offsetScroll.teamsUnderline,0,true);

	//scr_event_struct_setup();
	array_push(ACTIVE_data,active_event); // save to root struct
	
	screen_change(screen.eventEntry);
	
	app_save;
	}

if androidBack
screen_goto_prev();
}