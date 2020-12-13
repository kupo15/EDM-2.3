function element_home_active_event() {


element_active_event = {
	
	button: {
		xx: px(1),
		yy: py(22),
		ww: px(98),
		hh: py(30),
		color: c_white,
		sub: navbar.hidden,
		},
		
	header: {
		xx: app_width*0.5,
		yy: pct_y(22),
		height: pct_y(7),
		str: "Active Events",
		},
	}
}

function element_home_active_event_draw() {

var button = element_active_event.button;
var xx = button.xx;
var yy = button.yy;
var ww = button.ww;
var hh = button.hh;
var col = button.color;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	

xx = xx+(ww*0.5);
var height = pct_y(7);

draw_text_height(xx,yy,"Active Events",height,undefined,undefined,fa_center);
}

function element_home_active_event_step() {
	
var button = element_active_event.button;
var xx = button.xx;
var yy = button.yy;
var ww = button.ww;
var hh = button.hh;
var sub = button.sub;

return click_region_released(xx,yy,ww,hh,true,sub,1);
}