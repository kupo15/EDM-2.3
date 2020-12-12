function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

draw_clear(c_lt_gray);

// ongoing events
var xx = pct_x(1);
var yy = pct_y(22);
var ww = app_width-xx-xx;
var hh = pct_y(40);

var col = c_white;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

if click_region_released(xx,yy,ww,hh,true,navbar.hidden,1)
{}

// header
draw_screen_header(headerType.bars,headerType.none,"Hustle");

var xx = app_width*0.5;
var yy = pct_y(22);
var height = pct_y(7);

draw_text_height(xx,yy,"Active Events",height,undefined,undefined,fa_center);

#region create even button
var hh = pct_y(15);
var height = pct_y(7);
var xx = pct_x(1);
var yy = app_height-hh-pct_y(1);
var ww = app_width-xx-xx;
var col = header_color;

if click_button(xx,yy,"Create an Event",height,c_white,ww,hh,col,true,false,navbar.hidden)
screen_change(screen.eventSetup);

#endregion

exit;
debugyoff = 0;
debug_device_info(20,200,0,30,30);
}