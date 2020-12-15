function element_header_delete_draw() {

var xx = 0;
var yy = bleed_top;
var ww = app_width;
var hh = header_height;
var del_col = make_color_rgb(0,137,123); // delete header color
var alpha = offsetArray[offsetScroll.headerDeleteAlpha];

if alpha < 0.1
exit;

draw_rectangle_pixel(xx,yy,ww,hh,del_col,false,alpha);

// draw xout
var size = header_height*0.3;
var thick = pct_x(0.26);

var xoff = (hh-size)*0.8;
var yoff = (hh-size)*0.5;

var xpos = xx+xoff;
var ypos = yy+yoff;

draw_menu_xout(xpos,ypos,size,size,thick,c_white,alpha);


// draw trash icon
var xx = pct_x(88);
var height = header_height*0.55;
var col = c_white;

draw_icon_height_centered_color(ico_trash3,0,xx,yy,hh,hh,height,col,alpha); // trash icon


// number of items selected
var count = 0;
var size = ds_list_size(deleteList);

for(var i=0;i<size;i++)
count += deleteList[| i];

var xx = pct_x(13);

var height = header_height*0.44;
var str = string(count)+" selected";

draw_text_height_middled_color(xx,yy,str,hh,c_white,height,alpha); // draw number of items to delete
}

function element_header_delete_step() {
	
if !modeDelete
exit;
	
// clicked on xout
var xx = 0;
var yy = bleed_top;
var ww = pct_x(10);
var hh = header_height;

if click_region_released(xx,yy,ww,hh,true,submenu,1)
	{
	modeDelete = false;
	androidBack = false;
	}	
	
// clicked on trash
var xx = pct_x(88);

if click_region_released(xx,yy,hh,hh,true,submenu,1)
	{
	delete_list_delete_array(deleteList,modeDeleteListId);
	scr_surface_rebuild();

	return true;
	}
	
return false;
}













