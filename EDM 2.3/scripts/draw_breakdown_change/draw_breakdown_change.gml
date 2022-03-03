/*function draw_breakdown_change() {
	var xx = 100;
	var yy = 50;
	var ww = 800;
	var hh = 530;

	// For Submit button at end
	var xx_old = xx;
	var yy_old = yy;
	var ww_old = ww;
	var hh_old = hh;

	var ysep = 35;
	var size = ds_list_size(numpad_list);  
	var tot_winnings = string(season_ranking_grid[# season_breakdown_edit_x,season_breakdown_edit_y])+CURRENCY_SYMBOL;

	draw_set_color(c_black);

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy,ww,hh,noone,true) && mouse_check_button_released(mb_left))
	    {
	    season_breakdown_edit_x = noone;
	    season_breakdown_edit_y = noone;
	    ds_list_clear(numpad_list);
	    exit;
	    }

	var col = make_colour_rgb(255,227,215);
	draw_rectangle_colour(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

	draw_set_halign(fa_left);
	draw_text(xx+15,yy+20+fn_off,"EDIT WINNINGS:");

	draw_set_font(fn_keyboard);

	// edit player's score
	draw_text(xx+15,yy+30+30,season_ranking_grid[# 0,season_breakdown_edit_y]); // Draw player's name

	draw_set_font(fn_normal);
	draw_text(xx+40,yy+30+80+20+fn_off,"Total Winnings"); // Front

	draw_text(xx+40+30,yy+30+30+80+30+fn_off,tot_winnings); // Winnings

	var xx = 600;
	var yy = 180;
	var sep = 100;
	var cent = sep*0.5;
	var row = -1;

	draw_set_halign(fa_center);
	draw_set_font(fn_keyboard);

	draw_rectangle_colour(xx,yy-80,xx+(3*sep),yy+(4*sep),c_white,c_white,c_white,c_white,false); // draw background
	draw_line(xx,yy,xx+(3*sep),yy);
	draw_rectangle(xx,yy-80,xx+(3*sep),yy+(4*sep),true); // draw background outline

	for(var i=0;i<9;i++) // row (x)
	    {    
	    if (i mod 3) == 0
	    row ++;
    
	//    draw_rectangle_colour(xx+((i mod 3)*sep),yy+(row*sep),xx+(((i mod 3)+1)*sep),yy+((row+1)*sep),c_white,c_white,c_white,c_white,true);
	    draw_sprite(spr_key_circles,0,xx+7+((i mod 3)*sep),yy+12+(row*sep));  
  
	    var num = 7+(i mod 3) - (row*3);
	    draw_text(xx+cent+((i mod 3)*sep),yy-25+cent+(row*sep),num); // draw numpad numbers

	    if scr_mouse_position_room_released(xx+((i mod 3)*sep),yy+(row*sep),sep,sep,mb_left,true)
	    if size < 3
	    ds_list_add(numpad_list,num);
	    }
    
	// draw 0
	draw_sprite(spr_key_circles,0,xx+sep+7,yy+12+(3*sep));
	draw_sprite(spr_key_circles,0,xx+7,yy+12+(3*sep));
	draw_sprite(spr_keyboard,0,xx+5+(2*sep),yy-80+10); // backspace
	draw_text(xx+cent,yy+20+(3*sep),"+/-"); // draw +/-
	draw_text(xx+cent+sep,yy+20+(3*sep),"0"); // draw 0

	draw_sprite(spr_keyboard,1,xx+3+(2*sep),yy+2+(3*sep)); // enter

	// backspace
	if scr_mouse_position_room_released(xx+(2*sep),yy-80,sep,80,mb_left,true)
	ds_list_delete(numpad_list,size-1);

	// negate score
	if scr_mouse_position_room_released(xx,yy+(3*sep),sep,sep,mb_left,true)
	negate *= -1;

	// add 0
	if scr_mouse_position_room_released(xx+sep,yy+(3*sep),sep,sep,mb_left,true)
	if size < 3
	ds_list_add(numpad_list,0);


	// evaluate
	size = ds_list_size(numpad_list); 

	var num = 0;
	if size = 0 // if nothing in numpad
	num = undefined;
	else
	   {
	   if size > 0
	   num += numpad_list[| size-1];
    
	   if size > 1
	   num += numpad_list[| size-2] *10;
   
	   if size > 2
	   num += numpad_list[| size-3] *100;
	   }
   
	// draw SUBMIT button
	var submit = scr_mouse_position_room_released(xx_old+150,yy_old+hh_old-110-50,220,100+50,mb_left,true);    
	draw_rectangle(xx_old+150,yy_old+hh_old-110-50,xx_old+150+220,yy_old+hh_old-10,true); // button border

	var col = make_colour_rgb(69,117,228);
	var col_str = make_colour_rgb(69,117,228);
	var str = "SUBMIT";
	var pesos_amt = string(num)+CURRENCY_SYMBOL;

	if size == 0
		{
		col_str = c_red;
		str = "CLEAR";
		pesos_amt = tot_winnings;
		}

	draw_text_color(xx_old+255,yy_old+hh_old-90-40,str,col_str,col_str,col_str,col_str,1); // draw submit/clear text
	draw_text_transformed_color(xx_old+250,yy_old+hh_old-90+20,pesos_amt,0.7,0.7,0,col,col,col,col,1); // draw amount text
    
	//
	if num == undefined
	var str = "-";
	else
	var str = num*negate;

	draw_text(xx+sep,yy-80,str); // draw result

	// Enter Keypad
	if scr_mouse_position_room(xx+(2*sep),yy+(3*sep),sep,sep,noone,true) && mouse_check_button_released(mb_left) {
		
	   var sfx = "snd_tap"+string(irandom(2));
	   scr_play_sound(asset_get_index(sfx));
	   
	   submit = true;
	   }

	// Save Score
	if submit
	   {
	   if num != undefined
		   {
		   season_ranking_grid[# season_breakdown_edit_x,season_breakdown_edit_y] = num*negate; // enter peso amount
		   season_ranking_usage_grid[# season_breakdown_edit_x,season_breakdown_edit_y] = true; // enter usage data
	   
		   // if adjustment is 0, change to unused
		   if season_ranking_grid[# 1,season_breakdown_edit_y] == 0 // adjustment column
		   season_ranking_usage_grid[# 1,season_breakdown_edit_y] = false; // set to unused usage
		   }
	   else
		   {
		   season_ranking_grid[# season_breakdown_edit_x,season_breakdown_edit_y] = 0; // clear cell data
		   season_ranking_usage_grid[# season_breakdown_edit_x,season_breakdown_edit_y] = false; // enter usage data
		   }
   
	   var seas_save = season_save;
	   ini_season_ranking_save();
	   season_save = seas_save;
   
	   mouse_clear(mb_left);
	   ds_list_clear(numpad_list);

	   season_breakdown_edit_x = noone;
	   season_breakdown_edit_y = noone;
	   negate = 1;
	   }




}
