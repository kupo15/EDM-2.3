
function screen_settings() {

	draw_set_halign(fa_left);
	
	var xx = 40;
	var yy = 120;
	var ww = 300;
	var hh = 150;
	var height = 38;
	
	var arr = ["Settings","Payout Tables","Manage Members","Event History","Manage Courses"];
	var arrEnum = [screenEnum.preferences,screenEnum.payoutSettings,screenEnum.manageMembers,screenEnum.seasonRank,screenEnum.manageCourses];
	
	for(var i=0;i<array_length(arr);i++) {
		
		var xoff = ww*1.1*(i mod 3);
		var yoff = floor(i/3)*hh*1.25;
		
		draw_rectangle(xx+xoff,yy+yoff,xx+xoff+ww,yy+yoff+hh,true);
		draw_text_centered(xx+xoff,yy+yoff,arr[i],height,ww,hh);
	
		if scr_mouse_position_room_released(xx+xoff,yy+yoff,ww,hh,mb_left,true)
		screen_change(arrEnum[i]);
		}
		
	// draw version number
	draw_set_halign(fa_left);
	draw_text_height_color(10,590,"Version: "+string(GM_version),c_black,20);
	}
	
function draw_preferences() {
	
	// header
	var xx  = room_width*0.5;
	var yy = 80;
	var height = 65;
	
	draw_set_halign(fa_center);
	draw_text_height(xx,yy,"Settings",height);
	
	// content
	var xx = 40;
	var yy = 140;
	var ww = 600;
	var hh = 65;
	var height = 30;

	var yy = close_enough_setting(xx,yy,ww,hh,height);
	
	// sound
	draw_text_centered(xx,yy,"Sound",height,,hh);
	
	var str = pick("on","off",!SETTINGS.soundOn);
	draw_text_centered(xx+520,yy,str,height,,hh);
	
	draw_line_pixel(xx,yy+hh,ww,1,,0.5);
	
	// clicked
	if scr_mouse_position_room_released(xx,yy,ww,hh) {
		
		SETTINGS.soundOn = !SETTINGS.soundOn; // toggle
		save_program;
		}
	}
	
function close_enough_setting(xx,yy,ww,hh,height) {
	
	// picture
	var alpha = 0.3+(0.7*SETTINGS.closeEnough);

	draw_sprite_ext(spr_close_enough,0,xx,yy,0.11,0.11,0,c_white,alpha);
	
	draw_set_halign(fa_left);
	draw_text_centered(xx+60,yy,"Close Enough Animation",height,,hh);

	var str = pick("on","off",!SETTINGS.closeEnough);
	draw_text_centered(xx+520,yy,str,height,,hh);
	
	draw_line_pixel(xx,yy+hh,ww,1,,0.5);
	
	// clicked on close enough
	if scr_mouse_position_room_released(xx,yy,ww,hh) {
		
		SETTINGS.closeEnough = !SETTINGS.closeEnough; // toggle
		save_program;
		}
		
	return yy+hh;
	}
		