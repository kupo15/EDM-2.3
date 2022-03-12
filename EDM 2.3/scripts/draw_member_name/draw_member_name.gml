function draw_member_name(xx,yy,memberStruct,height,col=c_black,ww=undefined,hh=undefined,showMarker=true,showHandicap=false,lastFirst=false) {

	var eventDetails = memberStruct.activeEvent.eventDetails;
	var memberDetails = memberStruct.memberDetails;
	
	var name = pick(memberDetails.lastName+", "+memberDetails.firstName,memberDetails.fullName,!lastFirst);
	
	var str = "";
	if (eventDetails.blindTeam != undefined) // if blind draw
	str += "*";
			
	if eventDetails.noTeam // if no team
	str += "`";
        
	str += string(name);
	
	// draw name
	draw_text_centered(xx+5,yy,str,height,ww,hh,col);
		
	// tee
	var teeName = memberDetails.teeColor;
	var teeStruct = TEE_DATA[$ teeName];
	var str_ww = string_width_height(str+"  ",height);

	if showMarker
	draw_sprite_ext(ico_tee_marker,0,xx+str_ww+5,yy+(hh*0.5),1,1,0,teeStruct.color,1);
	
	// draw handicap
	var str = pick(eventDetails.courseHandicap,"N/A",eventDetails.courseHandicap==undefined);
	
	if showHandicap {
		
		draw_set_font(fn_italic);
		draw_text_centered(xx+5+str_ww+15,yy,str,height*0.92,ww,hh,col);
		
		draw_set_font(fn_normal);
		}
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