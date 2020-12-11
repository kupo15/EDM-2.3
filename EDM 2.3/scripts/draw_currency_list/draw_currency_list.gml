function draw_currency_list() {

if submenu != navbar.currencyList
exit;

// set offsets
var scrollbar_index = offsetScroll.currencyOffset;
var offsetvar = offsetArray[scrollbar_index];
var offsetvar_start = offsetArrayStart[scrollbar_index];
var source_array = currency_array;
var sub = navbar.currencyList;

var yy = header_ypos_end;
var height = pct_y(6);
var sep = pct_y(16.5);
var ww = app_width;
var hh = app_height-yy;

var rows = hh/sep;
var box_hh_end = app_height;

draw_rectangle_pixel(0,yy,app_width,app_height,c_white,false);

var return_val = undefined;

var element_num = 3;

var list_size = array_length(source_array);
var pos_start = floor(offsetvar);
var pos_end = min(list_size,ceil(offsetvar)+rows);
for(var e=0;e<element_num;e++)
for(var i=0;i<list_size;i++)
	{
	var off_ind = i-offsetvar;
	var off_pos = off_ind*sep;
	
	var currency_pointer = source_array[i];
	var currency_name = currency_pointer.dispName;
	var currency_iso = currency_pointer.isoCode;
	
	switch e
		{
		// venu name
		case 0: draw_text_height_middled_color(pct_x(15),yy+off_pos,"- "+currency_name,sep,c_black,height*1.2,1); break;	
		
		// draw line
		case 1:	draw_line_pixel(pct_x(10),yy+off_pos+sep,app_width,1,c_gray,0.7); break;
		
		// symbol
		case 2: draw_text_height_middled_color(pct_x(5),yy+off_pos,currency_iso,sep,c_black,height*1.2,1); break;
		}
		
	if (e+1) != element_num
	continue;
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,sub,i,undefined,undefined,false)
	return_val = i;
	}

#region scrolling
var xx = 0;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion

if androidBack
submenu = navbar.hidden;

return return_val;
}