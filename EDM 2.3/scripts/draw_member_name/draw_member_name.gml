function draw_member_name(xx,yy,struct,height,ww=undefined,hh=undefined) {

	var eventDetails = struct.eventDetails;
	var eventScores = struct.eventScores;
	var memberDetails = struct.memberDetails;
	
	var name = memberDetails.fullName;
	
	var str = "";
	if (eventDetails.blindTeam != undefined) // if blind draw
	str += "*";
			
	if eventDetails.noTeam // if no team
	str += "`";
        
	str += string(name);
	
	// draw name
	draw_text_centered(xx+5,yy,str,height,ww,hh);
	
	var str_ww = string_width_height(str+"  ",height);
	
	// tee
	var teeName = memberDetails.teeColor;
	var teeStruct = TEE_DATA[$ teeName];

	draw_sprite_ext(ico_tee_marker,0,xx+str_ww+2,yy+(hh*0.5),1,1,0,teeStruct.color,1);
	//draw_circle_color(xx+str_ww,yy+(hh*0.5),7,teeStruct.color,teeStruct.color,teeName=="white");
	}
	
function get_entrant_by_id(ind) {
	
	var memberId = entrant_list[ind];
	var memberDetails = memberId.memberDetails;
	
	return memberDetails.fullName;
	}
	
function draw_value(value,defaultStr) {
	
	if (value == "")
	return defaultStr;
	
	return value;
	}