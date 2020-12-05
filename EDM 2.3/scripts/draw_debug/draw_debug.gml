function goto_draw_debug() {};

function draw_debug() {
	
if os_type == os_android
exit;

var win_ww = window_get_width();
var win_hh = window_get_height();
	
var xx = -375;
var yy = 10;
var sep = 30;
var height = 30;

debugyoff = 0;

draw_set_colour(c_white);
draw_set_halign(fa_left);

debug_draw_screens(xx,yy,debugyoff,sep,height);
//debug_draw_screen_darken(xx,yy,debugyoff,sep,height);

draw_text_height(xx,yy+((debugyoff+0)*sep),"courseStruct: "+string(pick("active","undefined",course_struct == undefined)),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"scoreStruct: "+string(pick("active","undefined",score_struct == undefined)),height);

draw_text_height(xx,yy+((debugyoff+3)*sep),"workingStruct: "+string(pick("active","undefined",workingStruct == undefined)),height);
draw_text_height(xx,yy+((debugyoff+4)*sep),"activeStruct: "+string(pick("active","undefined",activeStruct == undefined)),height);

draw_text_height(xx,yy+((debugyoff+6)*sep),"course_index: "+string(course_index),height);
draw_text_height(xx,yy+((debugyoff+7)*sep),"score_index: "+string(score_index),height);
//draw_text_height(xx,yy+((debugyoff+8)*sep),"stat_index: "+string(stat_index),height);
//draw_text_height(xx,yy+((debugyoff+9)*sep),"stat_tee_index: "+string(stat_tee_index),height);

//draw_text_height(xx,yy+((debugyoff+10)*sep),"index_trend_offset: "+string(offsetArray[offsetScroll.indexOffset]),height);

debugyoff = 14;
//debug_draw_click_highlight(xx,yy,debugyoff,sep,height);
//debug_draw_vk(xx,yy,debugyoff,sep,height);
debug_draw_strings(xx,yy,debugyoff,sep,height);
//debug_draw_textbox(xx,yy,debugyoff,sep,height);
//debug_draw_sidebar_fades(xx,yy,debugyoff,sep,height);
//debug_draw_switch_tabs(xx,yy,debugyoff,sep,height);
//debug_draw_modes(xx,yy,debugyoff,sep,height);
//debug_draw_textbox_cursor(xx,yy,debugyoff,sep,height);	
//debug_draw_scrollbars(xx,yy,debugyoff,sep,height);	
//debug_device_info(xx,yy,debugyoff,sep,height);	
//draw_text_height(xx,yy+((debugyoff+0)*sep),"numpad_value: "+string(numpad_value),height);
//debug_draw_calendar(xx,yy,debugyoff,sep,height);
	
//draw_text_height(xx,yy+(25*sep),"search results "+string(ds_list_size(searchedList)),height);
//draw_text_height(xx,yy+((debugyoff+0)*sep),"Resolution: "+string(win_ww)+"x"+string(win_hh),height); // resolution
	

// right side
var xx = 550;

debug_draw_mouse(xx,yy,25,sep,height);

// draw elements
/*var size = ds_list_size(deleteList);
for(var i=0;i<size;i++)
draw_text_height(xx,yy+(i*sep),deleteList[| i],height);
	
yy += (size+1)*sep;*/

// draw prev screen stack
var size = ds_list_size(prevScreenStack);

// draw current screen
var str = script_get_name(drawScreen[screenIndex]);
str = string_replace(str,"draw_","");

draw_text_height(xx,yy+(0*sep),string(str),height);

// draw dividing line
draw_line(xx,yy+sep,xx+200,yy+sep);

// draw prev screens
for(var i=0;i<size;i++)
	{
	var arr = prevScreenStack[| size-i-1];
	var _screen = arr[0];
	var _sub = arr[1];
	
	var str = script_get_name(drawScreen[_screen]);

	draw_text_height(xx,yy+((i+1)*sep),str+" - "+string(enum_name_submenu[-navbar.enumstart+1+_sub]),height);
	}
		
draw_set_colour(c_black);
}

