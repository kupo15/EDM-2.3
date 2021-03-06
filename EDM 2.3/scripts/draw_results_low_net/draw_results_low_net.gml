function draw_results_low_net() {
	var xx = 50+(2*room_width)-(results_screen*room_width);
	var yy = 30;
	var ysep = 30;


	draw_set_halign(fa_center);
	draw_set_font(fn_name_big);
	draw_text_ext_colour(xx+805,yy+240,"Low Net\nResults",60,-1,c_blue,c_blue,c_blue,c_blue,1);

	draw_set_font(fn_name);
	draw_set_color(c_black);
	draw_set_halign(fa_left);

	var ww = 665;
	var hh = (18*ysep)+10; 
	var scale = 0.85;

	scr_results_low_net_scrolling(xx,yy,ww,hh);

	// if pressed anywhere inside table
	if scr_mouse_position_room_released(xx,yy+60,ww,hh,mb_left,false)
	net_score_tab = (net_score_tab+1) mod 3;

	// if clicked on tab
	for(var i=0;i<3;i++)
	if scr_mouse_position_room_released(xx+(i*260*scale),yy,260*scale,60,mb_left,true)
	net_score_tab = i;
    
	var col = make_colour_rgb(73,14,227);
	//draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false); // table background
	draw_rectangle(xx,yy,xx+ww,yy+hh,true); // table outline

	// draw payout table
	var num = min(ds_list_size(entrant_list)-1,23); // number of players
	var payout_max = array_length_2d(low_net_pay_table,num); // the last pay slot

	draw_rectangle(xx+700,yy,xx+700+200,yy+20+((payout_max+1)*ysep),true);
	draw_text(xx+700+10,yy+fn_off,"Payout Chart");

	for(var i=0;i<payout_max;i++)
	    {
	    draw_set_halign(fa_left);
	    draw_text(xx+700+5,yy+ysep+(i*ysep)+fn_off,string(i+1)+")");
    
	    draw_set_halign(fa_right);
	    draw_text(xx+700+200-5,yy+ysep+(i*ysep)+fn_off,string(low_net_pay_table[num,i])+" pesos");
	    }
    
	// Draw Standings    
	draw_set_halign(fa_left);
	for(var i=0;i<3;i++)
	    {
	    var col = c_black;
	    if net_score_tab = i
	    col = c_white;
    
	    var alph = ((net_score_tab==i)*0.5)+0.5;
	    draw_sprite_ext(sprite16,0,xx+(i*260*scale),yy,scale,1.5,0,col,alph);
	    }

	xx += 5;
	draw_text(xx+10,yy+fn_off,"Front Results");
	draw_text(xx+10+(1*260*scale),yy+fn_off,"Back Results");
	draw_text(xx+10+(2*260*scale),yy+fn_off,"18 Hole Results");


	yy += 2*ysep;
	draw_line_width(xx-5,yy+ysep,xx-5+ww,yy+ysep,3);

	var size = min(ds_grid_height(scores_grid),15);

	var str1 = "Front Score";
	var str2 = "Front Payout";
	var ds_grid = scores_grid_front;

	if net_score_tab = 1
	   {
	   str1 = "Back Score";
	   str2 = "Back Payout";
	   ds_grid = scores_grid_back;
	   }
	else if net_score_tab = 2
	   {
	   str1 = "18 Hole Score";
	   str2 = "18 Hole Payout";
	   ds_grid = scores_grid_total;
	   }

	draw_text(xx,yy-10+fn_off,"Place");
	draw_text(xx+300,yy-10+fn_off,str1); // score
	draw_text(xx+250+220,yy-10+fn_off,str2); // payout

	if !surface_exists(surface)
	surface = surface_create(room_width,room_height);

	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
       
	var offset = net_score_tab;
	var rank = 1;
	var _score;
	var num_display = min(ds_grid_height(scores_grid),15+floor(results_low_net_offset)+1);

	var rank_pos = 0;
	var rank = 1;
	var rank_count = 0;
	var rank_disp;

	draw_set_halign(fa_left);
	for(var i=0;i<ds_grid_height(scores_grid);i++) // loop through leaderboard
	   {
	   if ds_grid[# 6,i] == rank
	   rank_count ++;
	   else // end draw rank
	      {
	      var off_pos = rank_pos-results_low_net_offset;
	      if rank_count > 1
	          {
	          rank_disp = string(i-rank_count+1);
	          draw_line(xx+50,yy+ysep+20+(off_pos*ysep),xx+50,yy+ysep+((off_pos+rank_count)*ysep));
	          }
	      else
	      rank_disp = i;
           
	      draw_text_transformed(xx+3,yy+ysep+(off_pos*ysep)+fn_off,rank_disp,0.9,0.9,0); // draw rank
	      rank_count = 1; // reset rank count
	      rank_pos = i; // update rank position
	      rank ++;
	      }
      
	      // last slot
	      if i+1 = ds_grid_height(scores_grid) // if last index
	          {
	          var off_pos = rank_pos-results_low_net_offset;
	          if rank_count > 1
	              {
	              rank_disp = string(i-rank_count+1);
	              draw_line(xx+50,yy+ysep+20+(off_pos*ysep),xx+50,yy+ysep+((off_pos+rank_count)*ysep));
	              }
	          else
	          rank_disp = i+1;
               
	          draw_text_transformed(xx+3,yy+ysep+(off_pos*ysep)+fn_off,rank_disp,0.9,0.9,0); // draw rank
	          }
	      }  
   
	for(var i=floor(results_low_net_offset);i<num_display;i++)
	    {
	    var off_pos = i-results_low_net_offset;    
	    var name = ds_grid[# 0,i];
	    draw_text(xx+70,yy+ysep+(off_pos*ysep)+fn_off,name); // player name
    
	    draw_set_halign(fa_right);
	    draw_text(xx+400,yy+ysep+(off_pos*ysep)+fn_off,ds_grid[# 1+offset,i]); // front 9 score
    
	    if ds_grid[# 7+offset,i] != 0 
	    draw_text(xx+300+320,yy+ysep+(off_pos*ysep)+fn_off,string(ds_grid[# 7+offset,i])+" pesos"); // front 9 payout
    
	    draw_set_halign(fa_left);
	    }
    
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(0,0,room_width,yy+ysep,false);
	draw_rectangle(0,yy-(2*ysep)+hh,room_width,room_height,false);
	gpu_set_blendmode(bm_normal);
   
	surface_reset_target();
	draw_surface(surface,0,0);
       
	var xx = 720+(2*room_width)-(results_screen*room_width);;
	var yy = 500;
	var ww = 150;
	var hh = 80;

	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	draw_set_halign(fa_left);
	draw_text(xx+15,yy+30+fn_off,"Previous");

	if edit_score == noone && edit_team_score == noone
	    {
	    if (android_back || scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true))
			{
			android_back = false;
		    results_screen_end --;
			}
	    }



}
