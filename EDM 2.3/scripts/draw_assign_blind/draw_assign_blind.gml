function draw_assign_blind() {
	if select_blind_team == noone
	exit;

	var ind = select_blind_team;
	var xx = 160;
	var yy = 150;
	var ww = 580;
	var hh = 300;
	var hsep = 70;
	var vsep = 70;
	var sep = hsep+20;

	// click out/cancel
	if android_back || (!scr_mouse_position_room_released(xx,yy,ww,hh,noone,true) && mouse_check_button_released(mb_left) && !global.clicked)
	   {
	   select_blind_team = noone;
	   exit;
	   }

	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_text(xx+120,yy-15,"Select Blind Team");

	var get_team = scores_grid[# 4,ind];
	for(var i=0;i<team_number+1;i++)
	    {
	    var tot_size = ds_list_size(team_list[i])+ds_list_size(blind_list[i]);
	    var gray_out = (get_team == i) || (tot_size == 5) // team list size isn't maxed out
    
	    var alph = 0.4+(!gray_out*0.6);
	    draw_set_alpha(alph);
	    draw_rectangle(xx+30+(i*sep),yy+120,xx+30+hsep+(i*sep),yy+120+vsep,true);
	    draw_text(xx+50+(i*sep),yy+95,i+1);
    
	    if !gray_out && scr_mouse_position_room_released(xx+30+(i*sep),yy+120,hsep,hsep,mb_left,true)
	        {
	        scores_grid[# 5,ind] = i; // assign blind team
	        ds_list_add(blind_list[i],scores_grid[# 0,ind]); 
	        select_blind_team = noone;
	        break;
	        }
	    }
    
	draw_set_alpha(1);



}
