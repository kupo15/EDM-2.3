function draw_results_teams(page) {
	
	var ysep = 25.2;
	
	var xx = (page*room_width);
	var yy = 285;
	var height = 150;

	draw_text_centered(xx+750,yy,"Team\nResults",height,,,appblue);

	draw_payout_table(xx+730,70,PAYOUT_TABLES.teamPayout[team_number]);
    draw_team_result_tables(xx);
	draw_results_team_buttons(page,xx);
	
	exit;
	
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
	}
	
function draw_payout_table(xx,yy,arr) {

	var size = array_length(arr);
	var ysep = 40;
	var ww = 280;
	var hh = (2+size)*ysep;
	var height = ysep*0.7;
	var header_col = appblue;

	draw_rectangle(xx,yy,xx+ww,yy-ysep+hh,true);
	draw_text_centered(xx,yy,"Payout Chart",height,ww,ysep,header_col);

	yy += ysep;
	draw_line(xx,yy,xx+ww,yy); // header line

	for(var i=0;i<size;i++) {
		
		var str = arr[i];	
			
	    // draw payout slot
		draw_set_halign(fa_left);
	    draw_text_centered(xx+15,yy+(i*ysep),string(i+1)+")",height,,ysep);
    
	    draw_set_halign(fa_right);
	    draw_text_centered(xx+130,yy+(i*ysep),string(str)+" pesos",height,,ysep);
		
		// horizontal line
		draw_line_pixel(xx+20,yy+((i+1)*ysep),ww-40,1,,0.3);
		}
	}

function draw_team_result_tables(xx) {
	
	xx += 20;
	var sep = 32.2;
	var yy = 40;
	var ww = 680;
	var hh = 5*sep;
	
	var labels = ["Front","Back","18 Hole"];
	for(var i=0;i<3;i++) {
		
		var yoff = (hh*i)+(sep*i);
		draw_rectangle(xx,yy+yoff,xx+ww,yy+yoff+hh,true);
		
		draw_set_halign(fa_left);
		draw_text_centered(xx+10,yy+yoff-sep,"Place",sep,,sep*1.3);
		draw_text_centered(xx+330,yy+yoff-sep,labels[i]+" Score",sep,155,sep*1.3);
		draw_text_centered(xx+500,yy+yoff-sep,labels[i]+" Payout",sep,,sep*1.3);
		}
	}
	
function draw_results_team_buttons(page,xx) {
	
	var screenOffset = (page-results_screen)*room_width;
	
	// draw Results
	var xoff = 708;
	var yy = 500;
	var ww = 150;
	var hh = 80;
	var height = 35;

	draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	
	draw_text_centered(xx+xoff,yy,"Results",height,ww,hh);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true) {
		
		android_back = false;
		results_screen_end--;
		
		if (results_screen_end < 0)
		results_screen_end = 0;
		}
		
	// draw low net button	
	xoff += ww+10;

	draw_rectangle_colour(xx+xoff,yy,xx+xoff+ww,yy+hh,c_green,c_green,c_green,c_green,true);
	
	draw_text_centered(xx+xoff,yy,"Low Net",height,ww,hh);
	
	if scr_mouse_position_room_released(xoff+screenOffset,yy,ww,hh,mb_left,true)
	results_screen_end++;
	}