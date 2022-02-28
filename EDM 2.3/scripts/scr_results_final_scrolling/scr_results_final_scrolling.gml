enum scrollbarIndex {
	
none = -1,
resultsOverview,
resultsLowNet,
manageMemberList,
enumCount,
}

function Scrollbar(scrollEnum,_scrollWidth=20) constructor {
	
	enumInd = scrollEnum;
	scrollWidth = _scrollWidth;
	scrolling = false;
	
	offset = 0;
	offsetStart = 0;
	offsetEnd = 0;
	}

function ini_scrollbars() {
	
	scrollbarArray[scrollbarIndex.resultsOverview] = new Scrollbar(scrollbarIndex.resultsOverview);
	scrollbarArray[scrollbarIndex.manageMemberList] = new Scrollbar(scrollbarIndex.manageMemberList);
	}
	
function scrollbar_get_offset(_enum) {
	
	var struct = scrollbarArray[_enum];
	
	return struct.offset;
	}

function scrollList(xx,yy,ww,yy2,sep,arrList,scrollEnum,drawBar=true,canClick=true) {
	
	var hh = yy2-yy;
	var displayCount = hh/sep;
	var size = array_length(arrList);

	// no scrolling if size of list is less than what can be displayed
	if (size-1 < displayCount) || !canClick
	return arrList;
	
	var scrollStruct = scrollbarArray[scrollEnum];
	var offset = scrollStruct.offset;

	if drawBar
	funct_draw_scrollbar(xx-5,yy,displayCount,0,size,20,offset,sep,0);

	// set active scrollbar
	if scr_mouse_position_room_pressed(xx,yy,ww,hh,,false,false) {
		
		scrollStruct.offsetStart = offset;
		scrollbarActive = scrollEnum;
		}
	else if mouse_check_button_released(mb_left)
	scrollbarActive = scrollbarIndex.none;
	
	if (scrollbarActive != scrollEnum) || !mouse_check_button(mb_left)
	return arrList;
		
	var num = 1/sep;
	var amt = (global.mouse_ydist*num);
		
	scrollStruct.offset = clamp(scrollStruct.offsetStart-amt,0,size-displayCount);
    
	if (abs(scrollStruct.offset-scrollStruct.offsetStart) > 0.01) {
			
		scrollbar_disp_end = 1;
		scrolling = true;
		}  
		
	return arrList;
	}
