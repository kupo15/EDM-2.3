function draw_members_list_screen() {
	
// body
var member = draw_memberslist();

// header
surface_bundle_header(headerType.back,headerType.plus,"Members");

// subheader
var sort_index = META_data.memberSort;
var header_arr = ["A-Z","Favorites"];
var offset = offsetArray[offsetScroll.memberSortUnderline];
var header = draw_screen_header_submenu(offset,sort_index,0,app_width,1,header_arr);
if (header != undefined)
		{
		scr_surface_rebuild_struct("scrollVert");
		scr_memberlist_sort(header);
		app_save;
	
		// jump to top
		if META_data.memberSort == member_sort.favorite
		scrollbar_set(offsetScroll.membersOffset,0,true);
		}


// clicked on member
if member != undefined
		{
		var member_pointer = member[0];
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