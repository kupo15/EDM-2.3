draw_set_font(fn_normal);
draw_set_color(c_black);
draw_set_halign(fa_left);
application_surface_draw_enable(false);

debug_submenu_names();
ini_shared();

app_load;
ini_create();
ini_config(room_width,room_height);

//room_speed = 1

