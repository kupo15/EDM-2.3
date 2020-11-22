function draw_app_locked() {
	
	
draw_set_font(fn_name_big);
draw_set_color(c_black);
draw_text(200,200,"This app is locked\ncontact the developer to access");
   
if scr_mouse_position_room_pressed(0,0,300,150,mb_left,true,false)
alarm[0] = 3*room_speed;
else
if mouse_check_button_released(mb_left)
alarm[0] = -1;

}