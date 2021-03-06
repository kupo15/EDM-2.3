function scr_entrant_scrolling(argument0, argument1, argument2) {
	var xx = argument0;
	var yy = argument1;
	var hh = argument2;
	var ww = 500;
	var disp_count = 12;
	var size = ds_grid_height(scores_grid);

	if scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,true,false)
	can_edit_score_scroll = true;

	if (can_edit_score_scroll && scr_mouse_position_room(xx,yy,ww,hh,mb_left,true)) || edit_score_scrolling
	    {
	    var num = 1/ww;
	    edit_score_scrolling_offset = clamp(mouse_xdist*num,-1,1);
	    edit_score_scrolling_offset_end = edit_score_scrolling_offset;
	    edit_score_offset = 0;
    
	    if abs(edit_score_scrolling_offset) > 0.05
	    edit_score_scrolling = true;
	    }
    
	if edit_score_scrolling && mouse_check_button_released(mb_left)
	   {
	   can_edit_score_scroll = false;
	   edit_score_scrolling = false;
	   ds_list_clear(numpad_list);
	   edit_score_pos = 0;
   
	   if edit_score_scrolling_offset > 0.3
	   edit_score_scrolling_offset_end = 1;
	   else if edit_score_scrolling_offset < -0.3
	   edit_score_scrolling_offset_end = -1;
	   else edit_score_scrolling_offset_end = 0;
   
	   edit_score_offset = edit_score_scrolling_offset_end;
   
	   if edit_team_score == noone
	       { // player score
	       var size = ds_list_size(entrant_list);
	       edit_score = (edit_score-edit_score_scrolling_offset_end) mod size;
       
	       if edit_score < 0 
	       edit_score = size-1;
	       }
	   else // team score 
	       {       
	       edit_team_score = (edit_team_score-edit_score_scrolling_offset_end) mod (team_number+1);    
	       if edit_team_score < 0 
	       edit_team_score = team_number;
       
	       edit_team_offset = 0;
	       for(var tt=0;tt<edit_team_score;tt++)
	       edit_team_offset += ds_list_size(team_list[tt]);
	       }
	   }
   
	if edit_score_scrolling_offset != edit_score_scrolling_offset_end
	edit_score_scrolling_offset = lerp(edit_score_scrolling_offset,edit_score_scrolling_offset_end,0.2);



}
