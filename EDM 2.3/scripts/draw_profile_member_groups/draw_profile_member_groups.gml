function draw_profile_member_groups_draw() {

// set offsets
var scrollbar_index = offsetScroll.groupsOffset;
var groupslist_offset = offsetArray[scrollbar_index];
var groupslist_offset_start = offsetArrayStart[scrollbar_index];
var source_array = workingStruct.groups;

var yy = subheader_ypos_end;
var height = y_pct_y(75);
var sep = y_pct_y(200);
var ww = app_width;
var hh = app_height-yy;

var rows = hh/sep;
var box_hh_end = app_height;

var list_size = array_length(source_array);
var pos_start = floor(groupslist_offset);
var pos_end = min(list_size,ceil(groupslist_offset)+rows);
for(var i=0;i<list_size;i++)
	{
	var off_ind = i-groupslist_offset;
	var off_pos = off_ind*sep;
	
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
}


function draw_profile_member_groups_step() {

// set offsets
var scrollbar_index = offsetScroll.groupsOffset;
var groupslist_offset = offsetArray[scrollbar_index];
var groupslist_offset_start = offsetArrayStart[scrollbar_index];
var source_array = workingStruct.groups;
var sub = navbar.hidden;

var yy = subheader_ypos_end;
var sep = y_pct_y(200);
var ww = app_width;
var hh = app_height-yy;
var rows = hh/sep;

var list_size = array_length(source_array);
var pos_start = floor(groupslist_offset);
var pos_end = min(list_size,ceil(groupslist_offset)+rows);
for(var i=0;i<list_size;i++)
	{
	var off_ind = i-groupslist_offset;
	var off_pos = off_ind*sep;
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,true,navbar.hidden,i,undefined,undefined,false)
		{		
		var venue_id = source_array[i];
		var group_pointer = database_get_pointer(ROOT_data_struct.profiles,venue_id,"venueID");	
		}
	}

#region scrolling
var xx = 0;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion
}