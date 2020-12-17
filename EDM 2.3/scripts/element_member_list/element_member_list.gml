function element_overlay_memberlist_draw(xx,yy,ww,offset_pos,surf_hh,sep,height,source_array) {
	
var size = array_length(source_array);
var rows = surf_hh/sep; // number of rows per surface

var total_height = size*sep; // how long the list is
var surf_needed = (total_height/surf_hh); // how many surfaces are needed
for(var surf_count=0;surf_count<surf_needed;surf_count++)
	{
// don't initialize pages that are offscreen
	var surf_ypos = yy-offset_pos+(surf_count*surf_hh);
	var surf_ypos_end = surf_ypos+surf_hh;		
		
	if (surf_ypos > app_height) || (surf_ypos_end < floor(yy))
	continue;
	
	// width 
	var width_needed = app_width;
	
	// height
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
				
			var ref_pointer = source_array[i];
			var memberID = ref_pointer.memberID;
			var member_favorite = ref_pointer.favorite;

			var member_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");
			var member_first_name = member_pointer.firstName;
			var member_last_name = member_pointer.lastName;
			var member_str = member_first_name+" "+member_last_name;

			var first_initial = string_char_at(member_first_name,1);	
			var last_initial = string_char_at(member_last_name,1);
			var member_initial = first_initial+last_initial;

			var element_num = 5;
			for(var e=0;e<element_num;e++)
			switch e
				{
				// draw favorites icon
				case 0:	var ico_alpha = pick(0.5,1,member_favorite);
						draw_icon_height_centered_color(ico_favorites_star,member_favorite,ww*0.85,off_pos,sep,sep,sep*0.6,c_white,ico_alpha);
						break;
				
				// draw circle for initial
				case 1: var r = sep*0.8*0.5;	
						draw_circle_color(bleed_left+(sep*0.5),off_pos+(sep*0.5),r,header_color,header_color,false);
						break;
		
				// draw initial in circle
				case 2: draw_text_height_middled_color(bleed_left+(sep*0.5),off_pos,capitalize(member_initial),sep,c_white,height,1,undefined,undefined,fa_center);	

				// draw member name
				case 3:	draw_text_height_middled_color(pct_x(14.5),off_pos,member_str,sep,c_black,height*1.2,1); break;
		
				// draw line
				case 4:	var xpos = pct_x(14);
		
						draw_line_pixel(xpos,off_pos+sep,ww-xpos,1,c_gray,0.7);
						break;
				}
			}
		
		surface_reset_target();
		}
	}
}


function element_overlay_memberlist_step(xx,yy,ww,hh,sep,surf_hh,source_array,ref_array,scrollbar_index) {
	
// set offsets
var memberslist_offset = offsetArray[scrollbar_index];
var sub = navbar.hidden;

var rows = hh/sep;

var list_size = array_length(source_array);
var pos_start = floor(memberslist_offset);
var pos_end = min(list_size,ceil(memberslist_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-memberslist_offset;
	var off_pos = off_ind*sep;
	
	var surface_ind = floor(i*sep/surf_hh);
	
//draw_text_height(10,yy+off_pos,string(i)+": "+string(surface_ind),30)

	if click_region_released_clamp_array(ww*0.83,yy,off_pos,ww*0.17,sep,hh,mb_left,false,sub,i,undefined,undefined)
		{
		scr_surface_rebuild_struct("scrollVert",surface_ind);

		source_array[i].favorite = !source_array[i].favorite; // toggle favorite
		app_save;
		}
	else if click_region_released_clamp_array(0,yy,off_pos,ww*0.83,sep,hh,mb_left,true,sub,i,ref_array,undefined)
		{
		if modeDelete
			{
			if canDelete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			canDelete = true;
			}
		else // select member
			{
			var ref_pointer = source_array[i];
			var memberID = ref_pointer.memberID;
			var member_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");
	
			return [member_pointer,ref_pointer,i];
			}
		}
	}

// scrolling
funct_screen_scrolling(0,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);

return undefined;
}