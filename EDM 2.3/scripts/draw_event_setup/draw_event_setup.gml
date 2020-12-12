
function draw_event_setup() {

draw_screen_header(headerType.back,headerType.none,"Event Setup");

var sep = pct_y(9.5);

// draw teams
var xx = pct_x(50);
var yy = header_ypos_end;
var ww = app_width*0.5;
var hh = app_height-yy;

var header_hh = pct_y(10);

draw_rectangle_pixel(xx,yy,ww,hh,c_white,false); // white background

// sub header
var sort_index = subheader_member;
var offset = offsetArray[offsetScroll.memberProfileUnderline];
var header = draw_screen_header_submenu(offset,sort_index,app_width*0.5,"Details","Stats","Groups");
if (header != undefined)
subheader_member = header;

if androidBack
screen_goto_prev();
}