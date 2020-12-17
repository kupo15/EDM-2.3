function draw_members_list_screen() {
	
var scrollbar_index = offsetScroll.membersOffset;
var memberslist_offset = offsetArray[scrollbar_index];

var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height; // 360
var ww = app_width;
var hh = app_height-yy;
var sep = pct_y(16);
var height = pct_y(5.2);
var off_pos = memberslist_offset*sep
var ypos = yy-off_pos;
var surf_hh = app_height;


// build surface
// header
if surface_set_struct("header")
	{
	element_header_draw(headerType.back,headerType.plus,"Members");
	surface_reset_target();
	}
	

// body
element_overlay_memberlist_draw(xx,yy,ww,off_pos,surf_hh,sep,height,MEMBER_list); /// *********

// draw surface //

// body
surface_draw_struct("scrollVert",-1,0,yy,1,off_pos,surf_hh); ///***************

// header
surface_draw_struct("header",-1,0,0,1);

element_header_delete_draw();

var sort_index = META_data.memberSort;
var header_arr = ["A-Z","Favorites"];
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,ww,1,header_arr);
if (header != undefined)
		{
		scr_surface_rebuild_struct("scrollVert");
		scr_memberlist_sort(header);
		app_save;
	
		// jump to top
		if META_data.memberSort == member_sort.favorite
			{
			offsetArray[scrollbar_index] = 0;
			offsetArrayStart[scrollbar_index] = 0;
			}
		}


// header
element_header_step();
element_header_delete_step();

// body
var selection = element_overlay_memberlist_step(xx,yy,ww,hh,sep,surf_hh,MEMBER_list,MEMBER_list,scrollbar_index); /////*********
if selection != undefined
		{
		var member_pointer = selection[0];
		var memberID = member_pointer.memberID;
		
		subheader_member = 0; // info
		member_index = database_member_get_index(memberID);			
						
		scr_member_groups_sort(member_pointer.groups,true);
						
		// assign struct
		member_struct = member_pointer;
		workingStruct = struct_copy(member_struct);			
						
		screen_change(screen.memberProfileView,navbar.hidden);
		}

if androidBack
screen_goto_prev();
}