function element_currency_list_draw(xx,yy,ww,offset_pos,surf_hh,sep,height,source_array) {

var size = array_length(source_array);
var rows = surf_hh/sep;

var total_height = size*sep; // how long the list is
var surf_needed = (total_height/surf_hh); // how many surfaces are needed
for(var surf_count=0;surf_count<surf_needed;surf_count++)
	{	
	// don't initialize pages that are offscreen
	var surf_ypos = yy-offset_pos+(surf_count*surf_hh);
	var surf_ypos_end = surf_ypos+surf_hh;		
		
	if (surf_ypos > app_height) || (surf_ypos_end < floor(yy))
	continue;

	// width needed
	var width_needed = app_width;

	// height needed
	var height_needed = surf_hh;
		
	if surf_count+1 == ceil(surf_needed)
	var height_needed = frac(surf_needed)*surf_hh;
	
	if surface_set_struct("scrollVert",surf_count,width_needed,height_needed) // if you can build the surface
		{
		var start_ind = surf_count*rows;
		var pos_start = max(0,floor(start_ind));
		var pos_end = min(size,ceil(start_ind+rows));
		
		for(var i=pos_start;i<pos_end;i++)
			{
			var off_ind = i;
			var off_pos = (off_ind*sep)-(surf_hh*surf_count);
	
			var currency_pointer = source_array[i];
			var currency_name = currency_pointer.dispName;
			var currency_iso = currency_pointer.isoCode;
	
			var element_num = 3;
			for(var e=0;e<element_num;e++)
			switch e
				{
				// venu name
				case 0: draw_text_height_middled_color(pct_x(15),off_pos,"- "+currency_name,sep,c_black,height*1.2,1); break;	
		
				// draw line
				case 1:	draw_line_pixel(pct_x(10),off_pos+sep,app_width,1,c_gray,0.7); break;
		
				// symbol
				case 2: draw_text_height_middled_color(pct_x(5),off_pos,currency_iso,sep,c_black,height*1.2,1); break;
				}
			}
			
		surface_reset_target();
		}
	}
}

function element_currency_list_step(xx,yy,ww,hh,sep,surf_hh,source_array,ref_array,offsetvar,scrollbar_index,sub) {

var rows = hh/sep;

var list_size = array_length(source_array);
var pos_start = floor(offsetvar);
var pos_end = min(list_size,ceil(offsetvar)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-offsetvar;
	var off_pos = off_ind*sep;
		
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,true,sub,i,undefined,undefined,false)
	return i;
	}

funct_screen_scrolling(0,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);

if androidBack
submenu = navbar.hidden;

return undefined;
}
