function draw_profile_member_groups_draw(xx,yy,ww,offset_pos,surf_hh,sep,height,source_array) {

var size = array_length(source_array);
var rows = surf_hh/sep;

var total_height = size*sep; // how long the list is
var surf_needed = (total_height/surf_hh); // how many surfaces are needed
for(var surf_count=0;surf_count<surf_needed;surf_count++)
	{
	var height_needed = surf_hh;

	if surf_count+1 == ceil(surf_needed)
	var height_needed = frac(surf_needed)*surf_hh;
	
	// don't initialize pages that are offscreen
	var surf_ypos = yy-offset_pos+(surf_count*surf_hh);
	var surf_ypos_end = surf_ypos+surf_hh;		
		
	if (surf_ypos > app_height) || (surf_ypos_end < floor(yy))
	continue;
	
	if surface_set_struct("scrollVert",surf_count,undefined,height_needed) // if you can build the surface
		{
		var start_ind = surf_count*rows;
		var pos_start = max(0,floor(start_ind));
		var pos_end = min(size,ceil(start_ind+rows));
		
		for(var i=pos_start;i<pos_end;i++)
			{
			var off_ind = i;
			var off_pos = (off_ind*sep)-(surf_hh*surf_count);
	
			var venue_id = source_array[i];
	
			var group_pointer = database_get_pointer(ROOT_data_struct.profiles,venue_id,"venueID");
			var venue_name = group_pointer.dispName;
			var logo_img = group_pointer.logoID;
	
			var element_num = 3;
			for(var e=0;e<element_num;e++)
			switch e
				{
				// venu name
				case 0: draw_text_height_middled_color(pct_x(14),yy+off_pos,venue_name,sep,c_black,height*1.2,1); break;	
		
				// draw line
				case 1:	draw_line_pixel(pct_x(14),yy+off_pos+sep,app_width,1,c_gray,0.7); break;
		
				// venu logo
				case 2: if sprite_exists(logo_img)
						draw_icon_height_centered_color(logo_img,0,pct_x(1.5),yy+off_pos,sep,sep,sep*0.6,c_white,1);
				
						break;
				}
			}
		
		surface_reset_target();	
		}
	}
}


function draw_profile_member_groups_step(xx,yy,ww,hh,sep,surf_hh,source_array,ref_array,offset,scrollbar_index) {

// set offsets
var sub = navbar.hidden;

var rows = hh/sep;

var list_size = array_length(source_array);
var pos_start = floor(offset);
var pos_end = min(list_size,ceil(offset)+rows);
for(var i=0;i<list_size;i++)
	{
	var off_ind = i-offset;
	var off_pos = off_ind*sep;
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,true,navbar.hidden,i,undefined,undefined,false)
		{		
		var venue_id = source_array[i];
		var group_pointer = database_get_pointer(ROOT_data_struct.profiles,venue_id,"venueID");	
		}
	}

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
}