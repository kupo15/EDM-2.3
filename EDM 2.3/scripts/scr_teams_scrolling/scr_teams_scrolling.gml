function scr_teams_scrolling(argument0, argument1, argument2) {
	if edit_score != noone || edit_team_score != noone || select_blind_team != noone
	exit;

	var xx = argument0;
	var yy = argument1;
	var ww = argument2;
	var hh = 600;
	var disp_count = 1;

	//if team_number < disp_count
	//exit;
	team_scroll_speed -= fric*sign(team_scroll_speed);
 

	// scroll
	if scr_mouse_position_room_pressed(0,yy,room_width,hh,mb_left,false,false)
	team_scroll_offset_start = team_scroll_offset;

	if scr_mouse_position_room(0,yy,room_width,hh,mb_left,false)
	    {
	    var num = 0.004;
	    var amt = (global.mouse_ydist*num);
	    team_scroll_speed = amt;
	    team_scroll_offset = team_scroll_offset_start-amt;
    
	    if abs(team_scroll_offset-team_scroll_offset_start) > 0.05
	    scrolling = true;
	    }
	//else
	//team_scroll_offset += team_scroll_speed;


	team_scroll_offset = clamp(team_scroll_offset,0,team_number+1-disp_count);
      
	draw_set_color(c_gray);
	funct_draw_scrollbar(xx,yy,3,0,team_number+1,30,team_scroll_offset,178,0);
	draw_set_color(c_black);



}
