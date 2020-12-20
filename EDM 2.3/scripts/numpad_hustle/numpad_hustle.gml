
function numpad_hustle_draw(xx,yy,ww) {
/// @param xx
/// @param yy
/// @param [ww]

if argument[2] == undefined
ww = element_numpad.ww;
	
var numpad_yoff = 1-offsetArray[offsetScroll.numpadYoff];

var xscale = 1; //ww/element_numpad.baseWidth;
var yscale = 1; //ww/element_numpad.baseWidth;
var hh = element_numpad.hh*yscale;
var vsep = element_numpad.vsep*yscale;
var hsep1 = element_numpad.hsep1*xscale;
var hsep2 = element_numpad.hsep2*xscale;

// draw number button background
var col = c_white;
draw_rectangle_pixel(xx,yy,3*hsep2,hh,col,false,1);

// draw dark button background
var col = make_color_rgb(240,240,240);
draw_rectangle_pixel(xx+(3*hsep2),yy,hsep1,hh,col,false,1);

//draw_rectangle_color(xx,yy+(3*vsep),xx+105+(1*hsep2),yy+hh,col,col,col,col,false);
//draw_rectangle_color(xx+hsep1+(2*hsep2),yy+(3*vsep),ww,yy+hh,col,col,col,col,false);

// draw lines
var col = make_color_rgb(230,230,230);
for(var i=0;i<3;i++)
	{
	draw_line_pixel(xx,yy+((i+1)*vsep),ww,1,col,1); // hor lines
	draw_line_pixel(xx+((i+1)*hsep2),yy,1,hh,col,1); // vert lines
	}
	
var height = element_numpad.height;
var yoff = (vsep-height)*0.5;

draw_set_color(c_gray);
draw_set_halign(fa_center);
//draw_text_height(xx+(hsep1*0.5)+(hsep2*3),yy+yoff+(2*vsep),"+",height);

for(var i=0;i<3;i++)
for(var n=0;n<3;n++)
click_button(xx+(i*hsep2),yy+(n*vsep),(n*3)+i+1,height,c_black,hsep2,vsep,undefined,true,false,navbar.enumstart)

// 0
click_button(xx+(1*hsep2),yy+(3*vsep),"0",height,c_black,hsep2,vsep,undefined,true,false,navbar.enumstart)

// backspace
draw_button_backspace(ico_backspace,0,xx+(2*hsep2),yy+(3*vsep),hsep2,vsep,height*0.6,1,navbar.enumstart);

// draw par buttons
height *= 1.4;

//click_button(xx+(0*hsep1)+(3*hsep2),yy+(0*vsep),"par\n72",height,c_black,hsep1,vsep,undefined,true,false,navbar.enumstart)
//
//click_button(xx+(0*hsep1)+(3*hsep2),yy+(1*vsep),"par\n71",height,c_black,hsep1,vsep,undefined,true,false,navbar.enumstart)
//
//click_button(xx+(0*hsep1)+(3*hsep2),yy+(2*vsep),"par\n70",height,c_black,hsep1,vsep,undefined,true,false,navbar.enumstart)
//
//click_button(xx+(0*hsep1)+(3*hsep2),yy+(3*vsep),"par\n69",height,c_black,hsep1,vsep,undefined,true,false,navbar.enumstart)
}

function numpad_hustle_step(variable,xx,yy,ww) {

var xscale = 1//element_numpad.baseWidth/app_width*ww/element_numpad.baseWidth;
var yscale = 1//element_numpad.baseHeight/app_height*ww/element_numpad.baseWidth;
var hh = element_numpad.hh*yscale;
var vsep = element_numpad.vsep*yscale;
var hsep1 = element_numpad.hsep1*xscale;
var hsep2 = element_numpad.hsep2*xscale;

var height = element_numpad.height*yscale;
var yoff = (vsep-height)*0.5;

for(var i=0;i<3;i++)
for(var n=0;n<3;n++)
	{
	if click_region_released(xx+(i*hsep2),yy+(n*vsep),hsep2,vsep,true,submenu,1)
	variable += string((n*3)+i+1);
	}

// draw 00
//if click_button(xx+(0*hsep2),yy+(3*vsep),"00",height,c_black,hsep2,vsep,undefined,true,false,submenu)
//variable += "00";

// draw 0
if click_region_released(xx+(1*hsep2),yy+(3*vsep),hsep2,vsep,true,submenu,1)
variable += "0";

// delete
if click_region_released(xx+(2*hsep2),yy+(3*vsep),hsep2,vsep,true,submenu,1)
	{
	var length = string_length(variable);
	variable = string_delete(variable,length,1);
	}
	
// draw par buttons
height *= 1.4;

//if click_region_released(xx+(0*hsep1)+(3*hsep2),yy+(0*vsep),hsep1,vsep,true,submenu,1)
//variable = "72";
//
//if click_region_released(xx+(0*hsep1)+(3*hsep2),yy+(1*vsep),hsep1,vsep,true,submenu,1)
//variable = "71";
//
//if click_region_released(xx+(0*hsep1)+(3*hsep2),yy+(2*vsep),hsep1,vsep,true,submenu,1)
//variable = "70";
//
//if click_region_released(xx+(0*hsep1)+(3*hsep2),yy+(3*vsep),hsep1,vsep,true,submenu,1)
//variable = "69";



// next
//if draw_button_backspace(ico_backspace,0,xx+(0*hsep1)+(3*hsep2),yy+(2*vsep),hsep1,vsep,30,1,submenu)
	{
	//var length = string_length(variable);
	//variable = string_delete(variable,length,1);
	}

return variable;
}