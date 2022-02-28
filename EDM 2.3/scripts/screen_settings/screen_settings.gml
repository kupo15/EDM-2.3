
function screen_settings() {

	draw_set_halign(fa_left);
	
	var xx = 40;
	var yy = 150;
	var ww = 300;
	var hh = 100;
	
	var arr = ["Settings","Payout Tables","Manage Members","Event History"];
	var arrEnum = [screenEnum.preferences,screenEnum.payoutSettings,screenEnum.manageMembers,screenEnum.seasonRank];
	
	for(var i=0;i<array_length(arr);i++) {
		
		var xoff = ww*1.1*(i mod 3);
		var yoff = floor(i/3)*hh*1.25;
		
		draw_rectangle(xx+xoff,yy+yoff,xx+xoff+ww,yy+yoff+hh,true);
		draw_text_centered(xx+xoff,yy+yoff,arr[i],35,ww,hh);
	
		if scr_mouse_position_room_released(xx+xoff,yy+yoff,ww,hh,mb_left,true)
		screen_change(arrEnum[i]);
		}
		
	// draw version number
	draw_set_halign(fa_left);
	draw_text_height_color(10,590,"Version: "+string(GM_version),c_black,20);
	}
	
function draw_preferences() {
	
	// close enough preference
	var xx = 40;
	var yy = 140;
	var ww = 600;
	var hh = 65;
	var height = 30;
	var alpha = 0.3+(0.7*SETTINGS.closeEnough);

	// picture
	draw_sprite_ext(spr_close_enough,0,xx,yy,0.11,0.11,0,c_white,alpha);
	
	draw_set_halign(fa_left);
	draw_text_centered(xx+60,yy,"Close Enough Animation",height,,hh);

	var str = pick("on","off",!SETTINGS.closeEnough);
	draw_text_centered(xx+420,yy,str,height,,hh);
	
	// clicked on close enough
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true) {
		
		SETTINGS.closeEnough = !SETTINGS.closeEnough; // toggle
		save_program;
		}
		
	// tees
	var yy = 280;
	var ww = 250;

	draw_text_centered(xx,yy,"Course Tees",40,250,50);
	draw_tee_data_list(xx,yy+50,ww);
	}
	
function draw_tee_data_list(xx,yy,ww,highlight=undefined,canPress=true) {
		
	var alpha = draw_get_alpha();
	var result = undefined;
	var sep = 40;
	var line_gap = ww*0.1;
	
	for(var i=0;i<array_length(TEE_DATA.teeOrder);i++) {
		
		var name = TEE_DATA.teeOrder[i];
		var selected = (highlight == name);

		draw_tee_marker(xx,yy+(i*sep),sep,name,alpha);		
		draw_line_pixel(xx+line_gap,yy+sep+(i*sep),ww-line_gap,1,c_black,0.3*alpha);
		
		if selected
		draw_icon(,,xx,yy+(i*sep),ww,sep,appblue,0.3*alpha);
		
		if scr_mouse_position_room_released(xx,yy+(i*sep),ww,sep,mb_left,true,true,canPress)
		result = name;
		}
		
	return result;
	}
	
function draw_tee_marker(xx,yy,sep,teeColor,alpha=draw_get_alpha()) {
	
	var struct = TEE_DATA[$ teeColor];
		
	draw_sprite_ext(ico_tee_marker,0,xx+20,yy+(sep*0.5),1,1,0,struct.color,alpha);
		
	draw_text_centered(xx+45,yy,teeColor,30,,sep,,alpha); // tee color
	draw_text_centered(xx+140,yy,struct.rating+" / "+struct.slope,30,,sep,,alpha); // rating and slope
	}

	