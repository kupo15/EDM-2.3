function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

draw_screen_header(headerType.trash,headerType.dots,"Home");


//exit;
debugyoff = 0;
debug_device_info(20,200,0,30,30);
}