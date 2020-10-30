function draw_slider() {
	//if preference_edit_payout = noone
	//return -1;

	// Low Net Slider
	var xx = 555;
	var yy = 445;
	var ww = 300;
	var hh = 5;

	draw_set_halign(fa_center);
	draw_text(xx-10,yy-30,pref_low_net_num_min+1);
	draw_text(xx+ww+20,yy-30,pref_low_net_num_max+1);
	draw_text_transformed(xx+(ww*0.5),yy+5,"Entrants Slider",0.75,0.75,0);
	draw_rectangle(xx,yy,xx+ww,yy+hh,false);

	var s_ww = 15;
	var s_hh = 20;

	if !keypad_entry
	if scr_mouse_position_room_pressed(xx-50,yy-s_hh,ww+100,s_hh*2,mb_left,false,true)
	    {
	    preference_edit_payout = 0;
	    preference_index = 0;
	    preference_type = 0;
	    slider = true;
	    }
	else if mouse_check_button_released(mb_left)
	slider = false;


	if slider && preference_edit_payout = 0
	    {
	    var val = (((mouse_x-xx)/(ww+0))*(pref_low_net_num_max-pref_low_net_num_min))+pref_low_net_num_min;
	    pref_low_net_num = clamp(val,pref_low_net_num_min,pref_low_net_num_max);
	    }
    
	var slider_location = (pref_low_net_num-pref_low_net_num_min)/(pref_low_net_num_max-pref_low_net_num_min)*ww;
	draw_sprite(spr_slider,0,xx+slider_location,yy+1);

	pref_low_net_num = floor(pref_low_net_num);

    
	// Teams Slider
	var xx = 55;
	var yy = 505;
	var ww = 300;
	var hh = 5;

	draw_set_halign(fa_center);
	draw_text(xx-10,yy-30,pref_team_num_min+1);
	draw_text(xx+ww+20,yy-30,pref_team_num_max+1);
	draw_text_transformed(xx+(ww*0.5),yy+5,"Teams Slider",0.75,0.75,0);
	draw_rectangle(xx,yy,xx+ww,yy+hh,false);

	var s_ww = 15;
	var s_hh = 20;

	if !keypad_entry
	if scr_mouse_position_room_pressed(xx-50,yy-s_hh,ww+100,s_hh*2,mb_left,false,true)
	    {
	    preference_edit_payout = 1;
	    preference_index = 0;
	    preference_type = 0;
	    slider = true;
	    }
	else if mouse_check_button_released(mb_left)
	slider = false;

	if slider && preference_edit_payout == 1
	    {
	    var val = (((mouse_x-xx)/(ww+0))*(pref_team_num_max-pref_team_num_min))+pref_team_num_min;
	    pref_team_num = clamp(val,pref_team_num_min,pref_team_num_max);
	    }
    
	var slider_location = (pref_team_num-pref_team_num_min)/(pref_team_num_max-pref_team_num_min)*ww;
	draw_sprite(spr_slider,0,xx+slider_location,yy+1);

	pref_team_num = floor(pref_team_num);
     
	if slider
	return -1;



}
