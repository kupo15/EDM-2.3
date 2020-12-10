
draw_screens();

mouse_xprev = mouse_x;
mouse_yprev = mouse_y;

if os_type == os_android
exit;

// draw kv popup overlay
kvHeight = y_pct_y(400*kvActive*(submenu != navbar.numpad));
var col = c_blue;

draw_set_alpha(0.4);
draw_rectangle_color(0,app_height+1,app_width,app_height+1-kvHeight,col,col,col,col,false);
draw_set_alpha(1);