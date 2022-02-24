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

	for(var n=0;n<3;n++)
	    {  
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
	var sep = 28;
	var yy = 30;
	var ww = 680;
	var hh = 6*sep;
	
	var labels = ["Front","Back","18 Hole"];
	var sortKey = ["frontRank","backRank","totalRank"];
	var scoreKey = ["teamNetFront","teamNetBack","teamNetTotal"];
	var payoutKey = ["frontWinnings","backWinnings","allHolesWinnings"];
	for(var i=0;i<3;i++) {
		
		var yoff = (hh*i)+(sep*i);
		draw_rectangle(xx,yy+yoff,xx+ww,yy+yoff+hh,true);
		
		draw_set_halign(fa_left);
		draw_text_centered(xx+10,yy+yoff-sep,"Place",sep,,sep*1.3);
		draw_text_centered(xx+330,yy+yoff-sep,labels[i]+" Score",sep,155,sep*1.3);
		draw_text_centered(xx+500,yy+yoff-sep,labels[i]+" Payout",sep,,sep*1.3);
		
		draw_team_results_content(xx,yy+yoff,sep,sortKey[i],scoreKey[i],payoutKey[i]);
		}
	}
	
function draw_team_results_content(xx,yy,sep,sortKey,scoreKey,payoutKey) {
	
	var list = EVENT_RESULTS.teamResults;
	
	array_sort_struct(list,sortKey,true,["teamWinnings"]);
	
	var rankCount = 0;
	var prevRank = 0;
	for(var i=0;i<array_length(list);i++) {
		
		var teamStruct = list[i];
		var teamRank = teamStruct.teamWinnings[$ sortKey];
		
		if (teamRank != prevRank) {
			
			draw_text_centered(xx+10,yy+(i*sep),teamRank,sep*0.8,,sep*1.3); // rank
			
			if (rankCount > 0)
			draw_line_pixel(xx+70,yy-(sep*0.6)+((i-rankCount)*sep),2,(rankCount+0.5)*sep,appblue); // line
			
			prevRank++;
			rankCount = 0;
			}
		else
		rankCount++;
		
		draw_text_centered(xx+80,yy+(i*sep),"Team "+string(i+1),sep,,sep*1.3); // team name
		draw_text_centered(xx+330,yy+(i*sep),teamStruct[$ scoreKey],sep,155,sep*1.3); // score
		
		draw_set_halign(fa_right)
		draw_text_centered(xx+630,yy+(i*sep),string(teamStruct.teamWinnings[$ payoutKey])+" pesos",sep,,sep*1.3); // payout
		
		draw_set_halign(fa_left);
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