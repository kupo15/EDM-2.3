
function draw_currency_list() {

if submenu != navbar.currencyList
exit;

var sub = navbar.currencyList;
var scrollbar_index = offsetScroll.currencyOffset;
var offsetvar = offsetArray[scrollbar_index];
var source_array = currency_array;
var ref_array = undefined;

var xx = 0;
var yy = header_ypos_end;
var ww = app_width;
var hh = app_height-yy;
var sep = py(16.5);
var height = py(6);
var offset_pos = offsetvar*sep
var ypos = yy-offset_pos;
var surf_hh = app_height;

element_currency_list_draw(xx,yy,ww,offset_pos,surf_hh,sep,height,source_array);

// draw surface
draw_rectangle_pixel(0,yy,app_width,app_height,c_white,false);

surface_draw_struct("scrollVert",-1,0,yy,1,offset_pos,surf_hh);

return element_currency_list_step(xx,yy,ww,hh,sep,surf_hh,source_array,ref_array,offsetvar,scrollbar_index,sub);
}
