function draw_menu() {
	
draw_set_font(fn_name);
draw_set_halign(fa_center);

// draw preferences
var pref_xx = 970;
var pref_yy = 15;
if pref_phase = false
	{
	draw_sprite(spr_preferences,0,pref_xx,pref_yy);
	if edit_score = noone && edit_team_score = noone
	if scr_mouse_position_room_released(pref_xx,pref_yy,40,40,mb_left,true)
	pref_phase = 1;
	}
else
	{// return button
	draw_sprite(spr_back,0,950,15);
	}

var ysep = sprite_get_height(spr_member_button)+2;

if pref_phase == 1
draw_preferences();
else if pref_phase == 2
draw_season_ranking();
else if phase = 0
	{
	if list_type = 1
	draw_favorites_list(ysep);
	else
	draw_member_list(ysep);
	draw_team_list(ysep);
	draw_create_teams_button();
	}
else if phase = 1
draw_teams();
else if phase > 1
draw_results();



}
