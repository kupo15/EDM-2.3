
function draw_members_list() {
	

// set offsets
var scrollbar_index = offsetScroll.membersOffset;
var memberslist_offset = offsetArray[scrollbar_index];
var memberslist_offset_start = offsetArrayStart[scrollbar_index];
var source_array = MEMBER_list;


//cs(js(source_array));
//sm("")

var xx = bleed_left;
var yy = header_height+header_submenu_height;
var height = y_pct_y(75);
var sep = y_pct_y(200);
var ww = app_width;
var hh = app_height-yy;

var rows = hh/sep;
var col = make_color_rgb(232,237,255);
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
	var member_favorite = ref_pointer.favorite;

	var member_pointer = MEMBER_database[memberID];
	var member_first_name = member_pointer.firstName;
	var member_last_name = member_pointer.lastName;
	var member_str = member_first_name+" "+member_last_name;

	var first_initial = string_char_at(member_first_name,1);	
	var last_initial = string_char_at(member_last_name,1);	

	draw_icon_member_initial(bleed_left,yy+off_pos,first_initial+last_initial,c_white,sep,header_color,height);	
	draw_text_height_middled(pct_x(14),yy+off_pos,member_str,sep,height,1,false,fn_bold); // draw member name
	
	draw_icon_height(ico_bookmarked,member_favorite,pct_x(90),yy+off_pos,sep*0.3,1); // draw favorites
	
	draw_line_pixel(pct_x(14),yy+off_pos+sep,app_width,1,c_gray,0.7); // draw line
	
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.hidden,i,source_array,undefined)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // select member
		    {
				
			// change screen
//			screen_change(screen.score_view,navbar.hidden);		
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
var header = draw_screen_header_submenu(offset,sort_index,"A-Z","Favorites");
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