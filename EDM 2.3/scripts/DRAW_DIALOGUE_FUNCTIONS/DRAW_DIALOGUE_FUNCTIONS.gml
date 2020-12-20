
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

