function screen_missing_handicap_index() {
	
	var xx = room_width*0.5;
	var yy = 60;
	var height = 60;
	
	draw_set_halign(fa_center);
	draw_text_height(xx,yy,"Missing Handicap Index",height);
	
	draw_set_halign(fa_left);
	
	screen_missing_handicap_index_content();
	screen_missing_handicap_index_buttons();
	}
	
function screen_missing_handicap_index_buttons() {

	draw_create_teams_button(true);
	}
	
function screen_missing_handicap_index_content() {
	
	var xx = 50;
	var yy = 100;
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		
		
		}
	}