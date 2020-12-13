function element_overlay_memberlist_draw(xx,yy,ww,hh,sep,height,source_array) {
	
var element_num = 5;
for(var e=0;e<element_num;e++)
for(var i=0;i<array_length(source_array);i++)
	{
	var off_ind = i-memberslist_offset;
	var off_pos = off_ind*sep;
	
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

	switch e
		{
		// draw favorites icon
		case 0:	var ico_alpha = pick(0.5,1,member_favorite);
				draw_icon_height_centered_color(ico_bookmarked,member_favorite,ww*0.85,yy+off_pos,sep,sep,sep*0.7,c_white,ico_alpha);
				break;
				
		// draw circle for initial
		case 1: var r = sep*0.8*0.5;	
				draw_circle_color(bleed_left+(sep*0.5),yy+off_pos+(sep*0.5),r,header_color,header_color,false);
				break;
		
		// draw initial in circle
		case 2: draw_text_height_middled_color(bleed_left+(sep*0.5),yy+off_pos,capitalize(member_initial),sep,c_white,height,1,undefined,undefined,fa_center);	

		// draw member name
		case 3:	draw_text_height_middled_color(pct_x(14.5),yy+off_pos,member_str,sep,c_black,height*1.2,1); break;
		
		// draw line
		case 4:	var xpos = pct_x(14);
		
				draw_line_pixel(xpos,yy+off_pos+sep,ww-xpos,1,c_gray,0.7);
				break;
		}
		
	}
}



function element_overlay_memberlist_step(xx,yy,ww,hh,sep,source_array,ref_array,scrollbar_index) {
	
// set offsets
var memberslist_offset = offsetArray[scrollbar_index];
var memberslist_offset_start = offsetArrayStart[scrollbar_index];
var sub = navbar.hidden;

var rows = hh/sep;
var box_hh_end = app_height;

var list_size = array_length(source_array);
var pos_start = floor(memberslist_offset);
var pos_end = min(list_size,ceil(memberslist_offset)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-memberslist_offset;
	var off_pos = off_ind*sep;
	
	var ref_pointer = source_array[i];
	var memberID = ref_pointer.memberID;
	var member_pointer = database_get_pointer(MEMBER_database,memberID,"memberID");

	if click_region_clamp_set(ww*0.83,yy,off_pos,ww*0.17,sep,hh,noone,false,undefined,sub,i)
	&& click_region_pressed(ww*0.83,yy+off_pos,ww*0.17,sep,false,sub)
		{
		canClick = false;
		canClickPressed = true;
		clickMoved = true;

		source_array[i].favorite = !source_array[i].favorite; // toggle favorite
		app_save;
		}
	else if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,sub,i,ref_array,undefined)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select member
		return [member_pointer,ref_pointer,i];
		}
	}

// scrolling
funct_screen_scrolling(0,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);

return undefined;
}