#macro fric 0.009
#macro flick_max 0.5
#macro flick_window 5

enum scrollbarIndex {
	
none = -1,
eventRunning,
resultsOverview,
resultsLowNet,
manageMemberList,
enumCount,
}

function Scrollbar(scrollEnum,_scrollWidth=20) constructor {
	
	enumInd = scrollEnum;
	scrollWidth = _scrollWidth;
	scrolling = false;
	scrollingSpeed = 0;
	
	offset = 0;
	offsetStart = 0;
	offsetEnd = 0;
	}

function ini_scrollbars() {
	
	scrollbarArray[scrollbarIndex.resultsOverview] = new Scrollbar(scrollbarIndex.resultsOverview);
	scrollbarArray[scrollbarIndex.manageMemberList] = new Scrollbar(scrollbarIndex.manageMemberList);
	scrollbarArray[scrollbarIndex.resultsLowNet] = new Scrollbar(scrollbarIndex.resultsLowNet);
	scrollbarArray[scrollbarIndex.eventRunning] = new Scrollbar(scrollbarIndex.eventRunning);
	}
	
function scrollbar_get_offset(_enum) {
	
	var struct = scrollbarArray[_enum];
	
	return struct.offset;
	}
	
function scrollbar_apply_friction() {
	
	for(var i=0;i<array_length(scrollbarArray);i++) {
		
		var struct = scrollbarArray[i];
		
		struct.scrollingSpeed -= fric*sign(struct.scrollingSpeed);

		if (abs(struct.scrollingSpeed) < fric)
		struct.scrollingSpeed = 0;
		}
	}
	
function scrollbar_set_value(scrollEnum,val) {
	
	var struct = scrollbarArray[scrollEnum];
	struct.offset = val;
	}

function scrollbar(xx,yy,ww,yy2,sep,arrList,scrollEnum,drawBar=true,canClick=true) {
	
	var hh = yy2-yy;
	var displayCount = hh/sep;
	var size = array_length(arrList);

	// no scrolling if size of list is less than what can be displayed
	if (size-1 < displayCount) || !canClick {
		
		scrollbarActive = scrollbarIndex.none;
		return arrList;
		}
	
	var scrollStruct = scrollbarArray[scrollEnum];
	var offset = scrollStruct.offset;

	// draw scrollbar
	if drawBar
	funct_draw_scrollbar(xx-5,yy,displayCount,0,size,20,offset,sep,0);

	// set active scrollbar
	if scr_mouse_position_room_pressed(xx,yy,ww,hh,,false,false) {
		
		scrollStruct.offsetStart = offset;
		scrollbarActive = scrollEnum;
		}
	else if mouse_check_button_released(mb_left)
	scrollbarActive = scrollbarIndex.none;
	
	if (scrollbarActive == scrollEnum) {
		
		var num = 1/sep;
		var amt = (global.mouse_ydist*num);
		
		var flick_amt = (mouse_y-global.mouse_yprev);
		var flick_speed = clamp(abs(flick_amt)*num,num,flick_max);
				
		scrollStruct.scrollingSpeed = flick_speed*sign(flick_amt) // set the flicking speed
		scrollStruct.offset = clamp(scrollStruct.offsetStart-amt,0,size-displayCount);
    
		if (abs(scrollStruct.offset-scrollStruct.offsetStart) > 0.01) {
			
			scrollbar_disp_end = 1;
			scrolling = true;
			}  
		}
	else // flick
	scrollStruct.offset -= scrollStruct.scrollingSpeed;
	
	// test when you hit the end of the list
	var offset_test = scrollStruct.offset;
	scrollStruct.offset = clamp(scrollStruct.offset,0,size-displayCount);	

	// if hit the end
	if (offset_test != scrollStruct.offset)
	scrollStruct.scrollingSpeed = 0; // stop speed
	
	return arrList;
	}