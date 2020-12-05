
function draw_members_list() {



draw_screen_header(headerType.back,headerType.none,"Members");

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