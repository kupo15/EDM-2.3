function draw_season_ranking_simple() {
	// draw date duplicate setting
	var xx = 10;
	var yy = 200;
	var ww = 200;
	var hh = 80;

	draw_sprite(spr_blind_draw,0,xx,yy);
	draw_text(xx+60,yy-10,"Duplicate Date");

	if settings_date_duplicate
	draw_sprite(spr_blind_draw,2,xx,yy);

	// if clicking duplicate date
	if scr_mouse_position_room_released(xx,yy,250,50,mb_left,true)
		{
		settings_date_duplicate = !settings_date_duplicate; // toggle setting
		ini_settings_save();
		}

	// draw delete season
	var xx = 20;
	var yy = 500;
	var ww = 200;
	var hh = 80;

	draw_set_color(c_black);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	draw_set_halign(fa_left);
	var str = "Delete Season";
	var _col = c_black;
	if !season_delete_safty
	_col = c_red;

	draw_text_colour(xx+10,yy+15+fn_off-10,str,_col,_col,_col,_col,1);
	draw_text_transformed(xx+55,yy+35,"(tap twice)",0.6,0.6,0);

	// delete season data
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true)
	    {
	    if !season_delete_safty
	    scr_season_ranking_delete_data();
	    else
	    season_delete_safty = false;
	    }
	else if mouse_check_button_released(mb_left)
	season_delete_safty = true;  


	var xx = 512;
	var yy = 60;
	var rows = 13;
	var hsep = 40;
	var ww = 520;
	var hh = rows*hsep;

	draw_set_halign(fa_center);
	draw_rectangle(xx-230,yy+10,xx+290,yy+hh+90,true);

	if season_ranking_grid[# 0,0] == undefined
	exit;

	var rank_hh = ds_grid_height(season_ranking_grid);
	var rank_ww = ds_grid_width(season_ranking_grid);
	var limit = min(rows,rank_hh)
	for(var i=0;i<limit;i++)
	    {
	    var col = c_black;
	    var value = season_offset+i;
	    draw_set_halign(fa_left);
	    draw_text(xx-220,yy+(i*hsep),season_ranking_grid[# 0,value]); // name
    
		var sum = ds_grid_get_sum(season_ranking_grid,1,value,rank_ww-1,value);
	    if sum < 0
	    col = c_red;
    
	    draw_set_halign(fa_right);
	    draw_text_colour(xx+270,yy+(i*hsep),string(sum)+" pesos",col,col,col,col,1); // pesos
	    }
    
	if rank_hh < rows
	exit;    
    
	// scroll
	if scr_mouse_position_room_pressed(xx-230,yy+10,ww,hh+80,mb_left,false,false)
	season_offset_start = season_offset;

	if scr_mouse_position_room(xx-230,yy+10,ww,hh+80,mb_left,false)
	    {
	    var num = 0.05;
	    var amt = (mouse_ydist*num);
	    season_offset = season_offset_start-amt;
	    season_offset = clamp(season_offset,0,rank_hh-rows);
    
		// alpha to display scrollbar
	    if abs(season_offset-season_offset_start) > 0.01
	    scrollbar_disp_end = 1;
	    }

    
	draw_set_color(c_gray);
	funct_draw_scrollbar(xx-230,yy+10,rows,0,rank_hh,15,season_offset,hsep,0);
	draw_set_color(c_black);



}
