function draw_results_teams() {
	
	var xx = 50+(1*room_width)-(results_screen*room_width);
	var yy = 13;
	var ysep = 25.2;

	draw_set_halign(fa_center);
	draw_text_ext_colour(xx+805,yy+170,"Team\nResults",60,-1,c_blue,c_blue,c_blue,c_blue,1);

	draw_set_font(fn_name);
	draw_set_color(c_black);
	draw_set_halign(fa_left);

	// draw payout table
	var num = team_number; // ds_list_size(entrant_list)-1; // number of players
	var payout_max = array_length_2d(team_pay_table,num); // the last pay slot

	draw_rectangle(xx+700,yy,xx+700+200,yy+20+((payout_max+1)*ysep),true);
	draw_text(xx+700+10,yy+fn_off-10,"Payout Chart");

	for(var i=0;i<payout_max;i++)
	    {
	    draw_set_halign(fa_left);
	    draw_text(xx+700+5,yy+ysep+(i*ysep)+fn_off-10,string(i+1)+")");
    
	    draw_set_halign(fa_right);
	    draw_text(xx+700+200-5,yy+ysep+(i*ysep)+fn_off-10,string(team_pay_table[num,i])+" pesos");
	    }   
    
	// Draw Standings
	var ww = 665;
	var hh = ((teams_max+1)*ysep)+3;
	var size = ds_grid_height(team_score_front_grid);

	for(var n=0;n<3;n++)
	    {  
	    draw_set_alpha(0.3);
	    draw_rectangle_colour(xx,yy-5,xx+ww,yy+hh+3,c_black,c_black,c_black,c_black,true);
	    draw_set_alpha(1);
	    draw_line_width(xx,yy+ysep-5,xx+ww,yy+ysep-5,2);
    
	    draw_set_halign(fa_left);
	    var str1 = "Front Score";
	    var str2 = "Front Payout";
	    var grid_id = team_score_front_grid;
    
	    if n = 1
	       {
	       str1 = "Back Score";
	       str2 = "Back Payout";
	       grid_id = team_score_back_grid;
	       }
	    else if n = 2
	       {
	       str1 = "18 Hole Score";
	       str2 = "18 Hole Payout";
	       grid_id = team_score_total_grid;
	       }
       
	    // draw ranked    
	    var rank_pos = 0;
	    var rank = 1;
	    var rank_count = 0;
	    var rank_disp;
    
	    draw_set_halign(fa_left);
	    for(var i=0;i<size;i++) // loop through leaderboard
	       {
	       if grid_id[# 2,i] == rank
	       rank_count ++;
	       else // end draw rank
	          {
	          var off_pos = rank_pos;
	          if rank_count > 1
	              {
	              rank_disp = string(i-rank_count+1);
	              draw_line(xx+50,yy+20+ysep+(off_pos*ysep),xx+50,yy+ysep+((off_pos+rank_count)*ysep)); // draw tied line
	              }
	          else
	          rank_disp = i;
               
	          draw_text_transformed(xx+10,yy+ysep+(off_pos*ysep)+fn_off-10,rank_disp,1,1,0); // draw rank
	          rank_count = 1; // reset rank count
	          rank_pos = i; // update rank position
	          rank ++;
	          }
          
	          // last slot
	          if i+1 == ds_grid_height(grid_id) // if last index
	              {
	              var off_pos = rank_pos;
	              if rank_count > 1
	                  {
	                  rank_disp = string(i-rank_count+2);
	                  draw_line(xx+30,yy+ysep+20+(off_pos*ysep),xx+30,yy+ysep+((off_pos+rank_count)*ysep));
	                  }
	              else
	              rank_disp = i+1;
                   
	              draw_text_transformed(xx+10,yy+ysep+(off_pos*ysep)+fn_off-10,rank_disp,1,1,0); // draw rank
	              }
	        } 
        
           
	    draw_set_halign(fa_left);
	    draw_text(xx+5,yy-5+fn_off-10,"Place");
	    draw_text(xx+5+200,yy-5+fn_off-10,str1); // score
	    draw_text(xx+5+200+200,yy-5+fn_off-10,str2); // payout
    
	    for(var i=0;i<size;i++)
	        {
	        draw_text(xx+70,yy+ysep+(i*ysep)+fn_off-10,"Team "+string(grid_id[# 0,i])); // team name
        
	        draw_set_halign(fa_right);
	        draw_text(xx+5+300,yy+ysep+(i*ysep)+fn_off-10,grid_id[# 1,i]); // front 9 score
	        draw_text(xx+5+250+300,yy+ysep+(i*ysep)+fn_off-10,string(grid_id[# 3,i])+" pesos"); // front 9 payout
        
	        draw_set_halign(fa_left);
	        }
        
	    yy += 7*ysep+25;
	    }        
   
	// draw Next Results
	var xx = 720+(1*room_width)-(results_screen*room_width);
	var yy = 500;
	var ww = 150;
	var hh = 80;

	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	draw_rectangle_colour(xx+ww+5,yy,xx+ww+ww,yy+hh,c_green,c_green,c_green,c_green,true);

	draw_set_halign(fa_left);
	draw_text(xx+25,yy+30+fn_off-10,"Results");
	draw_text(xx+ww+25,yy+30+fn_off-10,"Low Net");

	if edit_score == noone && edit_team_score == noone
	    {
	    if (android_back || scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,true))
			{
			android_back = false;
		    results_screen_end --;
		
			if results_screen_end < 0
			results_screen_end = 0;
			}
	    else if scr_mouse_position_room_released(xx+ww+5,yy,ww,hh,mb_left,true)
	    results_screen_end ++;
	    }



}
