/// @description  draw_numpad_entry(xx,yy,default_num);
/// @param xx
/// @param yy
/// @param default_num
function draw_numpad_entry(argument0, argument1, argument2) {

	if !keypad_entry
	return -1;

	var xx = argument0;
	var yy = argument1;
	var def_num = argument2;
	var sep = 100;
	var ww = 3*sep;
	var hh = 4*sep+80;
	var cent = sep*0.5;
	var row = -1;
	var size = ds_list_size(numpad_list);

	draw_set_halign(fa_center);
	draw_set_font(fn_keyboard);
	draw_set_color(c_black);

	// click out / cancel
	if android_back || (!scr_mouse_position_room(xx,yy-80,ww,hh,noone,true) && mouse_check_button_released(mb_left))
	    {
	    ds_list_clear(numpad_list);
	    keypad_entry = false;
	    return -2;
	    }

	draw_rectangle_colour(xx,yy-80,xx+(3*sep),yy+(4*sep),c_white,c_white,c_white,c_white,false); // draw background
	draw_line(xx,yy,xx+ww,yy);
	draw_rectangle(xx,yy-80,xx+(3*sep),yy+(4*sep),true); // draw background outline

	for(var i=0;i<9;i++) // row (x)
	    {    
	    if (i mod 3) == 0
	    row ++;
    
	    // draw_rectangle_colour(xx+((i mod 3)*sep),yy+(row*sep),xx+(((i mod 3)+1)*sep),yy+((row+1)*sep),c_white,c_white,c_white,c_white,true);
	    draw_sprite(spr_key_circles,0,xx+7+((i mod 3)*sep),yy+12+(row*sep));
    
	    var num = 7+(i mod 3) - (row*3);
	    draw_text(xx+cent+((i mod 3)*sep),yy-25+cent+(row*sep),num); // draw numpad numbers

    
	    if scr_mouse_position_room_released(xx+((i mod 3)*sep),yy+(row*sep),sep,sep,mb_left,true)
	    if size < 3
	    ds_list_add(numpad_list,num);
	    }
    
	draw_sprite(spr_keyboard,0,xx+5+(2*sep),yy-80+10); // backspace

	draw_sprite(spr_key_circles,0,xx+sep+7,yy+12+(3*sep));
	draw_sprite(spr_key_circles,0,xx+7,yy+12+(3*sep));
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
	if size = 0
	   {
	   num = def_num;
	   }
	else
	   {
	   if size > 0
	   num += numpad_list[| size-1];
    
	   if size > 1
	   num += numpad_list[| size-2]*10;
   
	   if size > 2
	   num += numpad_list[| size-3]*100;
	   }
    
	draw_set_font(fn_keyboard_entry);
	draw_text(xx+sep,yy-80,num); // draw result

	// Enter Keypad
	if scr_mouse_position_room(xx+(2*sep),yy+(3*sep),sep,sep,noone,true) && mouse_check_button_released(mb_left)
	   {
	   var sfx = irandom(2);
	   audio_play_sound(asset_get_index("snd_tap"+string(sfx)),0,false);
   
	   ds_list_clear(numpad_list);
	   keypad_entry = false;
	   return num;
	   }

	return -1;



}
