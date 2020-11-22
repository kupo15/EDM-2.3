
function draw_dialogue_box(xx,yy,ww,hh,col,sub) {

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);

return click_region_released(xx,yy,ww,hh,true,sub);
}

function draw_textbox(xx,yy,ww,hh,rounded) {

/// @param xx
/// @param yy
/// @param width
/// @param height
/// @param [round]


if argument[4] == undefined
rounded = false;

var col = make_color_rgb(232,236,255);
var col = c_white;

if rounded
draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
else
draw_rectangle_color(xx,yy,xx+ww,yy+hh,col,col,col,col,false);

}


function draw_numpad(variable) {

var xx = element_numpad.xx;
var yy = element_numpad.yy+(numpad_yoff*381);
var vsep = element_numpad.vsep;
var hsep1 = element_numpad.hsep1;

// draw number button background
var col = c_white;
draw_rectangle_color(xx,yy,room_width,room_height,col,col,col,col,false);

// draw dark button background
var col = make_color_rgb(247,247,247);
draw_rectangle_color(xx,yy,xx+(1*hsep1),room_height,col,col,col,col,false);

var hsep2 = element_numpad.hsep2;
draw_rectangle_color(xx,yy+(3*vsep),xx+105+(1*hsep2),room_height,col,col,col,col,false);
draw_rectangle_color(xx+hsep1+(2*hsep2),yy+(3*vsep),room_width,room_height,col,col,col,col,false);

// draw lines
var col = make_color_rgb(237,237,237);
for(var i=0;i<3;i++)
	{
	draw_line_color(0,yy+((i+1)*vsep),room_width,yy+((i+1)*vsep),col,col); // hor lines
	draw_line_color(hsep1+(i*hsep2),yy,hsep1+(i*hsep2),room_height,col,col); // vert lines
	}
	
var height = element_numpad.height;
var yoff = (vsep-height)*0.5;

draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(0*vsep),"/",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(1*vsep),"x",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(2*vsep),"+",height);
draw_text_height(xx+(hsep1*0.5),yy+yoff+(3*vsep),"-",height);

for(var i=0;i<3;i++)
for(var n=0;n<3;n++)
	{
	if click_button(xx+hsep1+(i*hsep2),yy+(n*vsep),(n*3)+i+1,height,c_black,hsep2,vsep,undefined,true,false,submenu)
	variable += string((n*3)+i+1);
	}

// draw 00
if click_button(xx+hsep1+(0*hsep2),yy+(3*vsep),"00",height,c_black,hsep2,vsep,undefined,true,false,submenu)
variable += "00";

// draw 0
if click_button(xx+hsep1+(1*hsep2),yy+(3*vsep),"0",height,c_black,hsep2,vsep,undefined,true,false,submenu)
variable += "0";

// delete
if draw_button_backspace(ico_backspace,0,xx+(1*hsep1)+(2*hsep2),yy+(3*vsep),hsep2,vsep,30,1,submenu)
	{
	var length = string_length(variable);
	variable = string_delete(variable,length,1);
	}

return variable;
}

function draw_numpad_golf(variable) {

var xx = element_numpad.xx;
var yy = element_numpad.yy+(numpad_yoff*441);

var hh = 380;
var vsep = element_numpad.vsep;
var hsep1 = element_numpad.hsep1;
var hsep2 = element_numpad.hsep2;

// draw number button background
var col = c_white;
draw_rectangle_color(xx,yy,xx+(3*hsep2),yy+hh,col,col,col,col,false);

// draw dark button background
var col = make_color_rgb(240,240,240);
draw_rectangle_color(xx+(3*hsep2),yy,app_width,yy+hh,col,col,col,col,false);

//draw_rectangle_color(xx,yy+(3*vsep),xx+105+(1*hsep2),yy+hh,col,col,col,col,false);
//draw_rectangle_color(xx+hsep1+(2*hsep2),yy+(3*vsep),app_width,yy+hh,col,col,col,col,false);

// draw lines
var col = make_color_rgb(230,230,230);
for(var i=0;i<3;i++)
	{
	draw_line_color(0,yy+((i+1)*vsep),app_width,yy+((i+1)*vsep),col,col); // hor lines
	draw_line_color(((i+1)*hsep2),yy,((i+1)*hsep2),yy+hh,col,col); // vert lines
	}
	
var height = element_numpad.height;
var yoff = (vsep-height)*0.5;

draw_set_color(c_gray);
draw_set_halign(fa_center);
//draw_text_height(xx+(hsep1*0.5)+(hsep2*3),yy+yoff+(2*vsep),"+",height);

for(var i=0;i<3;i++)
for(var n=0;n<3;n++)
	{
	if click_button(xx+(i*hsep2),yy+(n*vsep),(n*3)+i+1,height,c_black,hsep2,vsep,undefined,true,false,submenu)
	variable += string((n*3)+i+1);
	}

// draw 00
if click_button(xx+(0*hsep2),yy+(3*vsep),"00",height,c_black,hsep2,vsep,undefined,true,false,submenu)
variable += "00";

// draw 0
if click_button(xx+(1*hsep2),yy+(3*vsep),"0",height,c_black,hsep2,vsep,undefined,true,false,submenu)
variable += "0";

// delete
if draw_button_backspace(ico_backspace,0,xx+(0*hsep1)+(3*hsep2),yy+(3*vsep),hsep1,vsep,30,1,submenu)
	{
	var length = string_length(variable);
	variable = string_delete(variable,length,1);
	}
	
// next
//if draw_button_backspace(ico_backspace,0,xx+(0*hsep1)+(3*hsep2),yy+(2*vsep),hsep1,vsep,30,1,submenu)
	{
	//var length = string_length(variable);
	//variable = string_delete(variable,length,1);
	}

return variable;
}