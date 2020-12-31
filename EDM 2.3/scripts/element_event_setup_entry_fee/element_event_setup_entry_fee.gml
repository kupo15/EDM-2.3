function element_event_setup_entry_fee(header_arr) {

// draw teams
var xx = px(2);
var yy = 0;
var ww = px(99);

var sep = py(11);
var height = sep*0.5;
var hh = 6*sep;

var blind_xx = px(45);
var lownet_xx = px(70);
var noteam_xx = px(77);
var entry_xx = px(91);

if surface_set_struct("body",undefined,undefined,py(75))
	{		
	// draw team info
	var col = header_color;

	draw_text_height_color(px(2),yy,header_arr[teamlist_index],col,height*0.95); // team number

	var labels = ["Blind Team","Team Fee"];
	var col = c_black;

	draw_text_height(lownet_xx,yy,labels[0],height*0.95,undefined,undefined,fa_center);
	//draw_text_height(lownet_xx,yy,labels[1],height*0.95,undefined,undefined,fa_center);
	//draw_text_height(noteam_xx,yy,labels[2],height*0.95,undefined,undefined,fa_center);
	draw_text_height(entry_xx,yy,labels[1],height*0.95,undefined,undefined,fa_center);
	
	yy += height;

	// draw player info
	var element_num = 6;
	var player_num = array_length(TEAM_array.players);
	for(var e=0;e<element_num;e++)
	for(var n=0;n<player_num;n++)
		{
		var yoff = n*sep;
		
		var player_pointer = TEAM_array.players[n];
		var name = player_pointer.dispName;
		var blind = player_pointer.blind;
		var low_net = player_pointer.lownetEvent;
		var no_team = player_pointer.noTeam;		
		var entry = player_pointer.entryFee;

		if blind == undefined
		var blind_str = "-";
		else
		var blind_str = "T"+string(blind+1);
		
		var payout_table = active_event.payoutTable.entry;
		var low_net_str = string(low_net*payout_table.lowNet)+" "+PROFILE_data.currency.isoCode;
		var team_fee = string(payout_table.teams)+" "+PROFILE_data.currency.isoCode;
		var skin_str = string(payout_table.skins)+" "+PROFILE_data.currency.isoCode;

		var team_str = pick("Yes","Waived",no_team);

		switch e
			{
			case 0: draw_text_height_middled(px(3)-xx,yy+yoff,name,sep,height,1); break; // player name
			case 1: draw_text_height_middled(lownet_xx,yy+yoff,blind_str,sep,height,1,undefined,undefined,fa_center); break; // blind team
			//case 2: draw_text_height_middled(lownet_xx,yy+yoff,low_net_str,sep,height,1,undefined,undefined,fa_center); break; // low net entry
			case 3: draw_text_height_middled(entry_xx,yy+yoff,team_str,sep,height,1,undefined,undefined,fa_center); break; // team entry
			//case 4: draw_text_height_middled(entry_xx,yy+yoff,skin_str,sep,height,1,undefined,undefined,fa_center); break; // entry fee
			case 5: draw_line_pixel(px(4),yy+yoff+sep,ww-px(5),1,c_lt_gray,1); break; // line
			}
		}
		
	surface_reset_target();
	}
	
	
var xx = px(0.5);
var ypos = subheader_ypos_end;

surface_draw_struct("body",0,xx,ypos,1);

element_event_setup_entry_fee_step(xx,ypos);
}

function element_event_setup_entry_fee_step(xx,yy) {
	
var sep = py(11);
var height = sep*0.5;
var hh = 6*sep;

var lownet_xx = px(61);
var noteam_xx = px(70);
var entry_xx = px(85);

var blind_xx = lownet_xx;

var rebuild = false;

yy += height;

var blind_sep = px(5.3)*1.2;
var blind_height = sep*0.9;
var blind_yoff = (sep-blind_height)*0.5;

var player_num = array_length(TEAM_array.players);
for(var n=0;n<player_num;n++)
	{
	var yoff = n*sep;
		
	var player_pointer = TEAM_array.players[n];
	var blind = player_pointer.blind;
	
	if assigning_blind == n
		{
		var team_num = array_length(active_event.teams);
		
		draw_rectangle_pixel(blind_xx,yy+yoff,team_num*blind_sep,sep,c_white,false,1);
		
		for(var i=0;i<team_num;i++)
			{
			var col = pick(c_black,c_gray,i==teamlist_index);
			draw_rectangle_color(blind_xx+(i*blind_sep),yy+yoff+blind_yoff,blind_xx+blind_height+(i*blind_sep),yy+yoff+blind_height+blind_yoff,col,col,col,col,true);
			
			if click_button(blind_xx+(i*blind_sep),yy+yoff+blind_yoff,i+1,height,col,blind_height,blind_height,undefined,false,true,submenu)
			if col == c_black
				{
				TEAM_array.players[n].blind = i;
				assigning_blind = undefined;	
				rebuild = true;
				}
			else
				{
				assigning_blind = undefined;
				rebuild = true;
				}
			}
		}

	if (assigning_blind == undefined)
	if click_region_released(lownet_xx,yy+yoff,px(25),sep,true,submenu,1) // blind
		{
		if blind == undefined
		assigning_blind = n;
		else
			{
			TEAM_array.players[n].blind = undefined;
			rebuild = true;
			}
		
		break;
		}
	else if click_region_released(entry_xx,yy+yoff,px(14),sep,true,submenu,1) // no team
		{
		player_pointer.noTeam = !player_pointer.noTeam;
		rebuild = true;
		break;
		}
	}
	
if rebuild	
scr_surface_rebuild_struct("body");

}