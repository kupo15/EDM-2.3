function screen_member_handicap_card() {

	draw_handicap_card_header();
	draw_handicap_card_contents();
	}
	
function draw_handicap_card_header() {
	
	var xx = 0;
	var yy = 150;
	
	draw_line_pixel(xx,yy,room_width,1);
		
	// draw date
	var xx = 900;
	var height = 35;
	var month = funct_convert_month(current_month,false);
	var date_str = month+" "+string(current_day)+", "+string(current_year);

	draw_set_font(fn_italic);
	draw_text_centered(xx,yy-height,date_str,height,,,c_gray);
	
	draw_set_font(fn_normal);

	var memberStruct = MEMBERS_LIST.list[manageMemberIndex];
	var memberDetails = memberStruct.memberDetails;

	// draw index
	var xx = 0;
	var height = 40;

	draw_set_halign(fa_left);
	draw_text_centered(xx+15,yy-height,"Index: "+string(memberDetails.handicapIndex),height);
	
	// draw name
	var xx = room_width*0.5;
	var yy = 105;
	var height = 70;

	draw_set_halign(fa_center);
	draw_text_height(xx,yy,memberDetails.fullName,height);
	
	draw_set_halign(fa_left);
	
	// draw logo
	var size = 90;
	var xx = 0;
	var yy = 0;
	
	draw_sprite_stretched(spr_logo,0,xx,yy,size,size);
	}

function draw_handicap_card_contents() {
	
	
	}