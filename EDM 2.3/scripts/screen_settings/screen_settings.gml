
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
	var xx = 950;
	var yy = 140;
	var ww = 60;

	draw_sprite_ext(spr_close_enough,0,xx,yy,0.1,0.1,0,c_white,0.3+(0.7*settings_close_enough));

	// clicked on close enough
	if scr_mouse_position_room_released(xx-10,yy,ww,ww,mb_left,true)
		{
		settings_close_enough = !settings_close_enough; // toggle
		ini_settings_save();
		}

	var str = "on";
	if !settings_close_enough
	str = "off";
	draw_set_halign(fa_center);
	draw_text_transformed(xx+20,yy+50,str,0.5,0.5,0);

	// season ranking screen
	var xx = 530;
	var yy = 500;
	var ww = 180;
	var hh = 80;

	draw_set_halign(fa_center);
	draw_text(xx+85,yy+20+fn_off-15,"Season");
	draw_text_transformed(xx+85,yy+20+38+fn_off-10,"Ranking",0.6,0.6,0);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	// clicked on Season Ranking GOTO
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    season_ranking_load();
	    pref_phase = screenEnum.seasonRank;
	    }
        
	// back out of preferences
	if (android_back || scr_mouse_position_room_released(950,15,60,60,mb_left,true))
	    {
	    pref_phase = screenEnum.homeScreen;
    
	    if phase > 1 // results screen
	    scr_calculate_results();
	    }
	}
	