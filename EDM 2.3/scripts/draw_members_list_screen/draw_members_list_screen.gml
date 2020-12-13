function draw_members_list_screen() {
	
var scrollbar_index = offsetScroll.membersOffset;
var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height;
var ww = app_width;
var hh = app_height-yy;
var sep = pct_y(16);
var height = pct_y(5.2);

// build surface
//element_overlay_memberlist_draw(xx,yy,ww,hh,sep,height,MEMBER_list);

// header
if surface_set(surfaces.header)
	{
	element_header_draw(headerType.back,headerType.plus,"Members");
	element_header_delete_draw();
	surface_reset_target();
	}
	
// draw surface
surface_draw(surfaces.header,0,0,1);


// click //

// header
element_header_step();
element_header_delete_step();

// body
//element_overlay_memberlist_step(xx,yy,ww,hh,sep,MEMBER_list,MEMBER_list,scrollbar_index);


if androidBack
screen_goto_prev();

exit
	
var selection = draw_members_list_overlay(xx,yy,ww,hh,sep,height,MEMBER_list,MEMBER_list,scrollbar_index);
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


var sort_index = META_data.memberSort;
var header_arr = ["A-Z","Favorites"];
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,ww,1,header_arr);
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


	

}