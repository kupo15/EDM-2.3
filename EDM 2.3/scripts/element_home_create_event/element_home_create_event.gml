function element_home_create_event() {

var hh = py(15);
var xx = px(1);
var yy = app_height-hh-py(1);
var ww = app_width-xx-xx;
var height = py(15);
var col = header_color;

element_create_event = {
	
	button: {
		xx: xx,
		yy: yy,
		ww: ww,
		hh: hh,
		color: col,
		sub: navbar.hidden,
		},

	}
}

function element_home_create_event_draw() {

var button = element_create_event.button;
var xx = button.xx;
var yy = button.yy;
var ww = button.ww;
var hh = button.hh;
var sub = button.sub;
var button_col = button.color;

var str = "Create an Event";
var height = py(7);

click_button_draw(xx,yy,str,height,c_white,ww,hh,button_col,true,false,sub);
}

function element_home_create_event_step() {
	
var button = element_create_event.button;
var xx = button.xx;
var yy = button.yy;
var ww = button.ww;
var hh = button.hh;
var sub = button.sub;

return click_region_released(xx,yy,ww,hh,true,sub,1);
}