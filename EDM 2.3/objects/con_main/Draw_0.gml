draw_sprite_ext(background0,0,0,0,2,2,0,c_white,1);

if locked
   {
   draw_set_font(fn_name_big);
   draw_set_color(c_black);
   draw_text(200,200,"This app is locked\ncontact the developer to access");
   
   if scr_mouse_position_room_pressed(0,0,300,150,mb_left,true,false)
   alarm[0] = 3*room_speed;
   else
   if mouse_check_button_released(mb_left)
   alarm[0] = -1;
   exit;
   }

draw_menu();

if mouse_check_button_released(mb_left)
    {
	scrollbar_disp_end = 0;
    scrolling = false;
    results_scrolling = false;
    deleting_member = false;
    }
	

    
    /*
var xx = 10;
var yy = 50;
var ww = 200;
var hh = 400;
var off = keyboard_check(vk_up)*300;

draw_set_halign(fa_left);
draw_text(40,210,"window: "+string(window_get_width())+"x"+string(window_get_height()));
/*draw_text(40,240,"data: "+string(ds_grid_width(season_ranking_grid))+","+string(ds_grid_height(season_ranking_grid)));
draw_text(40,270,"usage: "+string(ds_grid_width(season_ranking_usage_grid))+","+string(ds_grid_height(season_ranking_usage_grid)));
draw_text(40,300,"data: "+string(season_ranking_grid[# 0,0]));
//draw_text(40,50,edit_score_scrolling)
//show_debug_message(mouse_xdist);
  
/*
    
draw_set_color(c_black);
draw_text(40,40,ds_list_size(member_list_save));
draw_text(40,70,ds_list_size(recent_list));
draw_text(40,90,last_entrant_number);
draw_text(40,120,member_scroll_offset);

for(var i=0;i<ds_list_size(member_list);i++)
draw_text(500,110+(i*40),member_list[| i]);

for(var i=0;i<ds_list_size(recent_list);i++)
draw_text(800,110+(i*40),recent_list[| i]);
/*

show_debug_message(mouse_y);

draw_circle(mouse_xstart,mouse_ystart,3,false); // mouse click

if mouse_check_button(mb_left)
draw_line(mouse_xstart,mouse_ystart,mouse_x,mouse_y);*/
/*
draw_text(60,5,edit_team_offset);


/* */
/*  */
