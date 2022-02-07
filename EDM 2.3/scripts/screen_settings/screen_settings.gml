
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
	}
	