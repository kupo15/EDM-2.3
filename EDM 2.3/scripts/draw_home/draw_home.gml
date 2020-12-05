function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

// draw the 3 bars
draw_screen_header(headerType.bars,headerType.none,"Home");

var xx = x_pct_x(app_width*0.5);
var yy = y_pct_y(app_height*0.5);
var ww = point_x(36);

draw_rectangle(xx-ww,yy-ww,xx+ww,yy+ww,true);

debugyoff = 0;
debug_device_info(20,200,0,30,30);
}