
function draw_members_list() {
	

// set offsets
var scrollbar_index = offsetScroll.membersOffset;
var memberslist_offset = offsetArray[scrollbar_index];
var memberslist_offset_start = offsetArrayStart[scrollbar_index];
var source_array = MEMBER_list;

var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height;
var height = pct_y(5.2);
var sep = pct_y(16);
var ww = app_width*0.5;
var hh = app_height-yy;
var rows = hh/sep;
var box_hh_end = app_height;

var list_size = array_length(source_array);
var pos_start = floor(memberslist_offset);
var pos_end = min(list_size,ceil(memberslist_offset)+rows);

var element_num = 5;
for(var e=0;e<element_num;e++)
for(var i=pos_start;i<pos_end;i++)
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
				draw_icon_height_centered_color(ico_bookmarked,member_favorite,pct_x(87),yy+off_pos,sep,sep,sep*0.7,c_white,ico_alpha);
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
		case 4:	var xx = pct_x(14);
		
				draw_line_pixel(xx,yy+off_pos+sep,ww-xx,1,c_gray,0.7);
				break;
		}
	
	if (e+1) != element_num
	continue;
	
	if click_region_clamp_set(pct_x(83),yy,off_pos,pct_x(17),sep,hh,noone,false,undefined,navbar.hidden,i)
	&& click_region_pressed(pct_x(83),yy+off_pos,pct_x(17),sep,false,navbar.hidden)
		{
		canClick = false;
		canClickPressed = true;
		clickMoved = true;

		source_array[i].favorite = !source_array[i].favorite; // toggle favorite
		app_save;
		}
	else if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.hidden,i,source_array,undefined)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select member
		    {				
			subheader_member = 0; // info
			member_index = database_member_get_index(memberID);			
						
			scr_member_groups_sort(member_pointer.groups,true);
						
			// assign struct
			member_struct = member_pointer;
			workingStruct = struct_copy(member_struct);			
						
			screen_change(screen.memberProfileView,navbar.hidden);		
			}
		}
	}


#region scrolling
var xx = 0;
var sub = navbar.hidden;

funct_screen_scrolling(xx,yy,ww,hh,sep,list_size,rows,scrollbar_index,sub);
#endregion

draw_screen_header(headerType.back,headerType.plus,"Members");

var sort_index = META_data.memberSort;
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,ww,"A-Z","Favorites");
if (header != undefined)
	{
	scr_memberlist_sort(header);
	app_save;
	
	// jump to top
	if META_data.memberSort == member_sort.favorite
		{
		offsetArray[scrollbar_index] = 0;
		offsetArrayStart[scrollbar_index] = 0;
		}
	}

if androidBack
screen_goto_prev();
}