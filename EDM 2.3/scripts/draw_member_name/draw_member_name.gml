function draw_member_name(xx,yy,struct,height,ww=undefined,hh=undefined) {

	var round_stats = struct.roundStats;
	var name = struct.name;
	
	var str = "";
	if (round_stats.blindTeam != undefined) // if blind draw
	str += "*";
			
	if round_stats.noTeam // if no team
	str += "`";
        
	str += string(name);
	
	draw_text_centered(xx+5,yy,str,height,ww,hh);
	
	var str_ww = string_width_height(str+"  ",height);
	
	// tee
	var teeName = struct.teeColor;
	var teeStruct = TEE_DATA[$ teeName];

	draw_sprite_ext(ico_tee_marker,0,xx+str_ww,yy+(hh*0.5),1,1,0,teeStruct.color,1);
	//draw_circle_color(xx+str_ww,yy+(hh*0.5),7,teeStruct.color,teeStruct.color,teeName=="white");
	}
	
function get_entrant_by_id(ind) {
	
	var memberId = entrant_list[ind];
	
	return memberId.name;
	}
	
function draw_value(value,defaultStr) {
	
	if (value == "")
	return defaultStr;
	
	return value;
	}