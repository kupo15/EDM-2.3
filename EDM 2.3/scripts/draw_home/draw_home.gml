function draw_undefScreen() {
draw_home();

draw_text_height(20,app_height-50,"Undefined Screen",40);
}


function draw_home() {

draw_screen_header(headerType.bars,headerType.none,"Hustle");

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