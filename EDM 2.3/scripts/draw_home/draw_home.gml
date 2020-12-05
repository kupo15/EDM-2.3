function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

draw_screen_header(headerType.bars,headerType.none,"Home");

var xx = x_pct_x(960);
var yy = y_pct_y(600);
var ww = point_x(36);

draw_rectangle(xx-ww,yy-ww,xx+ww,yy+ww,true);

var xx = 960;
var yy = 600;
var ww = point_x(36);
var col = c_green;

draw_rectangle_color(xx-ww,yy-ww,xx+ww,yy+ww,col,col,col,col,true);

debugyoff = 0;
debug_device_info(20,200,0,30,30);
}