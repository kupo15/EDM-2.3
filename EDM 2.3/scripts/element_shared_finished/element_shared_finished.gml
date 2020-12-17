function element_shared_finished() {

	element_finished = {
	
	button: {
		xx: 0,
		yy: app_height-header_height,
		ww: app_width,
		hh: header_height,
		sub: navbar.hidden,
		},
		
	header: {
		height: header_height*0.5,
		str: "Finished",
		},
	}
}

function element_shared_finished_draw(button_col,submit) {
	
var button = element_finished.button;
var xx = button.xx;
var yy = button.yy;
var ww = button.ww;
var hh = button.hh;

var header = element_finished.header;
var height = header.height;
var str = header.str;

if click_button(xx,yy,str,height,c_white,ww,hh,button_col,false,false,navbar.hidden) && submit
return true;
else
return
false;
}