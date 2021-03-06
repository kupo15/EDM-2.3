function draw_results_final() {

	var ysep = 33;
	var row = 12;
	var xx = 50+(0*room_width)-(results_screen*room_width);
	var yy = 50;
	var ww = 970;
	var hh = (ysep*row)+10;


	draw_set_halign(fa_left);
	draw_set_color(c_black);
	draw_set_font(fn_name_big);
	draw_text_colour(xx,-30,"RESULTS",c_blue,c_blue,c_blue,c_blue,1);

	draw_set_font(fn_name);
	draw_set_halign(fa_center);
	//draw_text(xx,yy,"Team");
	draw_text_ext_transformed(xx+35+300,yy-ysep+fn_off+5,"Team\nWinnings",27,-1,0.8,0.8,0);
	draw_text_ext_transformed(xx+35+300+100,yy-ysep+fn_off+5,"Low Net\nWinnings",27,-1,0.8,0.8,0);
	draw_text_ext_transformed(xx+35+300+100+90,yy-ysep+fn_off+5,"Gross\nSkins",27,-1,0.8,0.8,0);
	draw_text_ext_transformed(xx+35+300+100+80+75,yy-ysep+fn_off+5,"Net\nSkins",27,-1,0.8,0.8,0);
	draw_text_ext_transformed(xx+35+300+100+100+100+30,yy-ysep+fn_off+5,"Win\nTotal",27,-1,0.8,0.8,0);
	draw_text_ext_transformed(xx+35+300+100+100+80+115,yy-ysep+fn_off+5,"Entry\nFee",27,-1,0.8,0.8,0);
	if no_net_skins || no_gross_skins
	   {
	   if no_net_skins
	   var str_s = " No Net\nSkins";
	   else if no_gross_skins
	   var str_s = " No Gross\nSkins";
   
	   if no_net_skins && no_gross_skins
	   var str_s = "No\nSkins";
   
	   var entr_col = make_color_rgb(98,145,242);
	   draw_text_ext_transformed_colour(xx+35+300+100+100+80+115+55,yy-ysep+10,str_s,27,-1,0.65,0.65,0,entr_col,entr_col,entr_col,entr_col,1);
	   }
      
	draw_text_ext_transformed(xx+35+300+100+100+80+130+130,yy-ysep+fn_off+5,"Net\nWinnings",27,-1,0.8,0.8,0);


	yy += ysep;
	scr_results_final_scrolling(xx,yy,ww);
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);

	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);

	var team_size = 1;
	for(var i=0;i<team_number+1;i++)
	    {
	    var off_pos = i-results_final_offset;
	    team_size += ds_list_size(team_list[i])-1;
    
	    draw_set_halign(fa_center);
	    var col = make_color_rgb(98,145,242);
		var team_str = "T\ne\na\nm\n\n";
		if tourney_type
		team_str = "G\nr\no\nu\np\n\n";
	    draw_text_ext_colour(xx-25,yy+5+((team_size-4)*ysep)+(off_pos*ysep)+fn_off-5,(string(team_str)+string(i+1)),17,-1,col,col,col,col,1); // team number
       
	    draw_line(0+(0*room_width)-(results_screen*room_width),yy+5+(team_size*ysep)+(off_pos*ysep),xx+ww,yy+5+(team_size*ysep)+(off_pos*ysep));
	    }

	// calculate entry fee
	var _entry = 0;
	for(var i=0;i<ds_grid_height(scores_grid);i++) // loop through grid
	_entry += scores_grid[# 11,i]+((no_net_skins+no_gross_skins)*10);
    
	// draw leaderboard
	var num = min(ds_grid_height(scores_grid),row+floor(results_final_offset)+1);
	for(var i=floor(results_final_offset);i<num;i++)
	   {
	   var off_pos = i-results_final_offset;
	   var off_ind = i; //+floor(results_final_offset);
      
	   draw_set_halign(fa_left);
	   scr_mouse_position_room(xx+20,yy+(off_pos*ysep),ww-20,ysep,noone,true); // highlight row
      
	   var name = scores_grid[# 0,off_ind];
	   var str = "";
	   if scores_grid[# 5,off_ind] != noone // blind
	   str = "*";
	   if scores_grid[# 19,off_ind] // no team
	   str += "`";
   
	   str += name;
   
	   var col = c_black;
	   if scores_grid[# 23,off_ind] < 0
	   col = c_red;
   
	   // entry fee color
	   var entr_col = c_black;
   
	  // if team_number == 0 // only one team
	   //entr_col = c_orange; // make_color_rgb(255,248,153); // yellowish
   
	   if (scores_grid[# 5,off_ind] != noone)+scores_grid[# 19,off_ind] = 1 // only one
	   entr_col = make_color_rgb(98,145,242); // blue
   
	   // blind color
	   var blind_col = make_color_rgb(98,145,242);
   
	   draw_text(xx+35,yy+fn_off-5+(off_pos*ysep),str); // draw name
	   draw_text(xx+35+280,yy+fn_off-5+(off_pos*ysep),scores_grid[# 16,off_ind]); // Team Winning
   
	   if scores_grid[# 5,off_ind] != noone
	   draw_text_transformed_colour(xx+35+280+28,yy+fn_off+0+(off_pos*ysep),"+"+string(scores_grid[# 20,off_ind]),0.8,0.8,0,blind_col,blind_col,blind_col,blind_col,1); // Blind Winning
	   draw_text(xx+35+280+100,yy+fn_off-5+(off_pos*ysep),scores_grid[# 17,off_ind]); // Low Net Winning
	   draw_text(xx+35+300+100+80,yy+fn_off-5+(off_pos*ysep),scores_grid[# 21,off_ind]); // gross skins
	   draw_text(xx+35+300+100+80+65,yy+fn_off-5+(off_pos*ysep),scores_grid[# 22,off_ind]); // net skins
	   draw_text(xx+35+300+100+100+85+30,yy+fn_off-5+(off_pos*ysep),scores_grid[# 10,off_ind]); // win total
	   draw_text_colour(xx+35+300+100+100+80+100,yy+fn_off-5+(off_pos*ysep),scores_grid[# 11,off_ind],entr_col,entr_col,entr_col,entr_col,1); // entry fee
	   if no_net_skins || no_gross_skins
	       {
	       draw_sprite_ext(spr_crossout,0,xx+35+300+100+100+80+100,yy+5+(off_pos*ysep),0.8,0.8,0,c_white,0.9);
	       draw_text_colour(xx+35+300+100+100+80+100+55,yy+fn_off-5+(off_pos*ysep),scores_grid[# 11,off_ind]+((no_net_skins+no_gross_skins)*10),entr_col,entr_col,entr_col,entr_col,1); // win total
	       }
   
	   draw_set_halign(fa_right);
	   //scores_grid[# 23,i] = scores_grid[# 12,i]+((no_net_skins+no_gross_skins)*10); // grand total
	  // draw_text(xx+ww-5-110,yy+fn_off-5+(off_pos*ysep),scores_grid[# 23,off_ind]);
	   draw_text_colour(xx+ww-5,yy+fn_off-5+(off_pos*ysep),string(scores_grid[# 12,off_ind]+(no_net_skins+no_gross_skins)*10)+" pesos",col,col,col,col,1); // net win
	   }

	gpu_set_blendmode(bm_subtract);
	draw_rectangle(0,0,xx+ww,yy,false);
	draw_rectangle(0,yy+hh-5,xx+ww,yy+hh+400,false);
	gpu_set_blendmode(bm_normal);
   
	surface_reset_target();
	draw_surface(surface,0,0);

	draw_set_halign(fa_left);
	draw_text(xx+210,yy+hh+fn_off,"Totals:");
	draw_text(xx+35+280,yy+hh+fn_off,ds_grid_get_sum(scores_grid,16,0,16,ds_grid_height(scores_grid)-1)); // Team Winning
	draw_text(xx+35+280+100,yy+hh+fn_off,ds_grid_get_sum(scores_grid,17,0,17,ds_grid_height(scores_grid)-1)); // Low Net Winning
	draw_text(xx+35+300+100+70,yy+hh+fn_off,ds_grid_get_sum(scores_grid,21,0,21,ds_grid_height(scores_grid)-1)); // gross skins
	draw_text(xx+35+300+100+80+50,yy+hh+fn_off,ds_grid_get_sum(scores_grid,22,0,22,ds_grid_height(scores_grid)-1)); // net skins
	draw_text(xx+35+300+100+100+85+10,yy+hh+fn_off,ds_grid_get_sum(scores_grid,10,0,10,ds_grid_height(scores_grid)-1)); // win total
	draw_text(xx+35+300+100+100+80+100,yy+hh+fn_off,abs(_entry)); // entry fee


	// draw Next Results
	var xx = 720+(0*room_width)-(results_screen*room_width);
	var yy = 545;
	var ww = 150;
	var hh = 50;

	draw_rectangle_colour(xx-700+30,yy-45,xx-700+30+ww,yy+hh-15,c_green,c_green,c_green,c_green,true); // start over
	if !global.save_loaded
	draw_rectangle_colour(xx-700+45+ww,yy,xx-700+45+ww+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	draw_rectangle_colour(xx+ww+5,yy-45,xx+ww+ww,yy+hh-15,c_green,c_green,c_green,c_green,true);

	if mouse_check_button_pressed(mb_left) && !scr_mouse_position_room_pressed(xx-700+30,yy-45,ww,hh+30,mb_left,true,false)
	clear_all_safty = true;

	var col = c_black;
	if !clear_all_safty
	col = c_red;

	draw_text_colour(xx-700+35,yy-50,"Start Over",col,col,col,col,1);
	draw_text_transformed(xx-700+35+30,yy+30-40,"(tap twice)",0.6,0.6,0);
	if !global.save_loaded
	draw_text(xx-700+25+ww+27,yy+fn_off,"Edit Scores");
	draw_text(xx+ww+35,yy+fn_off-20,"Next");


	if edit_score == noone && edit_team_score == noone && close_enough_timer == -1
	    {
	    if scr_mouse_position_room_released(xx-700+30,yy-45,ww,hh+30,mb_left,true)
	        {
	        if !clear_all_safty
	            {
	            file_delete("results.ini");
	            scr_reset_bracket();
	            }
	        else
	        clear_all_safty = false;
	        }
	    else if mouse_check_button_released(mb_left)
	    clear_all_safty = true;
     
	    if !global.save_loaded && scr_mouse_position_room_released(xx-700+45+ww,yy,ww,hh,mb_left,true)
	    phase = 1;
	    else if scr_mouse_position_room_released(xx+ww+5,yy-45,ww,hh+30,mb_left,true)
	    results_screen_end ++;
	    }
    
	if close_enough_timer == -1
	exit;

	var off = ((room_speed*5)-close_enough_timer);
	var alph_off = off;
	var alph = sin((alph_off/100)-50.09);

	var xx = 870;
	var yy = 200;
	var ww = 150;
	var hh = 80;

	if off < 128
	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,1);

	else if off == 128 && !close_enough_skip
	close_enough_pause = true;

	if close_enough_pause == 1
	alph = 1;

	draw_set_alpha(alph)
	draw_sprite_ext(background0,0,0,0,2,2,0,c_white,alph);
	draw_sprite(spr_close_enough,0,150,0);
	draw_set_font(fn_name_big);
	draw_set_halign(fa_left);

	var text_off = game_time-picture_timer_start;

	// skip or next
	if scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,false)
	    {
	    close_enough_pause = false;
	    picture_timer_start = game_time-text_off;
	   // close_enough_timer = 196;
	    close_enough_skip = true;
	    }
	/*else if scr_mouse_position_room_pressed(0,0,room_width,room_height,mb_left,false,false)
	    {
	    close_enough_skip = true;
	    close_enough_pause = false;
	    picture_timer_start = game_time-text_off;
	    }*/

	if close_enough_pause
	text_off = min(text_off,280);

	draw_text_ext(600+(off*0.2),400,("\"-It's close\n      enough...\""),60,-1);

	// finished with picture
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	draw_set_font(fn_name);
	draw_text(xx+15,yy+30+fn_off,"Details");
	draw_set_alpha(1);

	if alph <= 0
	close_enough_timer = -1;



}
