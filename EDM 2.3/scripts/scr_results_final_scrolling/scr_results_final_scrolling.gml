enum scrollbarIndex {
	
none = -1,
resultsOverview,
resultsLowNet,
manageMemberList,
enumCount,
}

function Scrollbar(_name,scrollEnum,_scrollWidth=20) constructor {
	
	name = _name;
	enumInd = scrollEnum;
	scrollWidth = _scrollWidth;
	scrolling = false;
	
	offset = 0;
	offsetStart = 0;
	offsetEnd = 0;
	}

function ini_scrollbars() {
	
	scrollbarArray[scrollbarIndex.manageMemberList] = new Scrollbar("manageMemberList",scrollbarIndex.manageMemberList);
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
	exit;
	
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
	exit;
		
	var num = 1/sep;
	var amt = (global.mouse_ydist*num);
		
	scrollStruct.offset = clamp(scrollStruct.offsetStart-amt,0,size-displayCount);
    
	if (abs(scrollStruct.offset-scrollStruct.offsetStart) > 0.01) {
			
		scrollbar_disp_end = 1;
		scrolling = true;
		}   
	}

function scr_results_final_scrolling(xx,yy,ww,sep,scrollEnum) {

	var hh = 406;
	var disp_count = 10;
	var size = array_length(FINAL_EVENT_RESULTS.entrantResults);

	if (size-1 < disp_count) || (close_enough_timer != -1)
	exit;

	draw_set_color(c_gray);
	funct_draw_scrollbar(xx-5,yy,disp_count,0,size,20,results_final_offset,sep,0);
	draw_set_color(c_black);

	if results_scrolling
	exit;

	// scroll
	if scr_mouse_position_room_pressed(xx-30,yy,ww+30,hh,mb_left,false,false) {
		
		results_final_offset_start = results_final_offset;
		scrollbarActive = scrollEnum;
		}
	else if mouse_check_button_released(mb_left)
	scrollbarActive = scrollbarIndex.none;

	if (scrollbarActive == scrollEnum) && mouse_check_button(mb_left) {
		
	    var num = 1/sep;
	    var amt = (global.mouse_ydist*num);
		
	    results_final_offset = clamp(results_final_offset_start-amt,0,size-disp_count);
    
	    if (abs(results_final_offset-results_final_offset_start) > 0.01) {
			
			scrollbar_disp_end = 1;
		    scrolling = true;
			}
	    }     
	}
