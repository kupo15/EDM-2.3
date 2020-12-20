
goto_draw_debug();

function debug_submenu_names() {

enum_name_submenu[-navbar.enumstart+1+navbar.profileChange] = "profile_change";         
enum_name_submenu[-navbar.enumstart+1+navbar.sidebar] = "sidebar";         
enum_name_submenu[-navbar.enumstart+1+navbar.main] = "main";
enum_name_submenu[-navbar.enumstart+1+navbar.hidden] = "hidden";
enum_name_submenu[-navbar.enumstart+1+navbar.currencyList] = "currencyList";
enum_name_submenu[-navbar.enumstart+1+navbar.eventEntry] = "eventEntry";
enum_name_submenu[-navbar.enumstart+1+navbar.popupEntry] = "entryPopup";
enum_name_submenu[-navbar.enumstart+1+navbar.numpad] = "numpad";
enum_name_submenu[-navbar.enumstart+1+navbar.calendar] = "calendar";
enum_name_submenu[-navbar.enumstart+1+navbar.calendarYearSelect] = "calendarYearSelect";
}

function debug_draw_screens(xx,yy,ind,sep,height) {
	
if screenIndex == screen.appStartup
var str = "startup screen"
else
	{
	var str = script_get_name(drawScreen[screenIndex]);
	str = string_replace(str,"draw_","");
	}

draw_text_height(xx,yy+((debugyoff+0)*sep),"screenIndex: "+string(str),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"submenu: "+string(enum_name_submenu[submenu+(-navbar.enumstart)+1]),height);
draw_text_height(xx,yy+((debugyoff+2)*sep),"submenuPrevious: "+string(submenuPrevious),height);
draw_text_height(xx,yy+((debugyoff+3)*sep),"activeSubmenu: "+string(activeSubmenu),height);
	
debugyoff += 5;
}

function debug_draw_screen_darken(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((debugyoff+0)*sep),"screenDarkenIndex: "+string(screenDarkenIndex),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"screenDarkenAlpha: "+string(screenDarkenAlpha),height);
	
debugyoff += 4;
}

function debug_draw_switch_tabs(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((debugyoff+0)*sep),"switchTabDisp:    "+string(switchTabDisp),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"switchTabDispEnd: "+string(switchTabDispEnd),height);
	
debugyoff += 4;
}

function debug_draw_sidebar_fades(xx,yy,ind,sep,height) {
	
var sind = offsetScroll.courseSortUnderline;

draw_text_height(xx,yy+((debugyoff+0)*sep),"offsetArray:    "+string(offsetArray[sind]),height);
draw_text_height(xx,yy+((debugyoff+1)*sep),"offsetArrayStart: "+string(offsetArrayStart[sind]),height);
draw_text_height(xx,yy+((debugyoff+2)*sep),"offsetArrayEnd: "+string(offsetArrayEnd[sind]),height);
	
debugyoff += 5;
}

function debug_draw_click_highlight(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"highlight_width: "+string(highlight_struct.width)+" ["+string(highlight_struct.width_end)+"]",height);
draw_text_height(xx,yy+((ind+1)*sep),"highlight_height: "+string(highlight_struct.height),height);
draw_text_height(xx,yy+((ind+2)*sep),"highlight_alpha: "+string(highlight_struct.alpha)+" ["+string(highlight_struct.alpha_end)+"]",height);
draw_text_height(xx,yy+((ind+3)*sep),"highlight_index: "+string(highlight_struct.index),height);
draw_text_height(xx,yy+((ind+4)*sep),"highlight_screen: "+string(highlight_struct.activeScreen),height);
draw_text_height(xx,yy+((ind+5)*sep),"activeSubmenu: "+string(activeSubmenu),height);

debugyoff += 7;
}

function debug_draw_strings(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"kvLastString:",height);
draw_text_height(xx,yy+((ind+1)*sep),string(kvLastString),height);

draw_text_height(xx,yy+((ind+2.5)*sep),"stringText: ",height);

var xoff = string_width_height("stringText: ",height);
draw_text_height_middled(xx+xoff,yy+((ind+2.5)*sep),string(debugStringText),sep,text_reduce(debugStringText,x_pct_x(230),height),1);
draw_text_height(xx,yy+((ind+3.5)*sep),"stringxpos: "+string(debugStringXpos),height);
draw_text_height(xx,yy+((ind+4.5)*sep),"stringypos: "+string(debugStringYpos),height);
draw_text_height(xx,yy+((ind+5.5)*sep),"stringWidth: "+string(debugStringWidth),height);
draw_text_height(xx,yy+((ind+6.5)*sep),"stringHeight: "+string(debugStringHeight),height);

var col = pick(c_white,c_red,debugStringScale > 1)
draw_text_height_color(xx,yy+((ind+7.5)*sep),"stringScale: "+string(debugStringScale),col,height);

debugyoff += 8;
}

function debug_draw_vk(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"vk_active: "+string(kvActive),height);
draw_text_height(xx,yy+((ind+1)*sep),"keyboard_string:",height);
draw_text_height(xx,yy+((ind+2)*sep),"'"+keyboard_string+"'",height,fn_italic);
	
debugyoff += 4;
}

function debug_draw_textbox(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"textboxIndex: "+string(textboxIndex),height);
draw_text_height(xx,yy+((ind+1)*sep),"texStringLength: "+string(textboxStringLength),height);
draw_text_height(xx,yy+((ind+2)*sep),"texStringWidth: "+string(textboxStringWidth),height);
draw_text_height(xx,yy+((ind+3)*sep),"texStringScale: "+string(textboxStringScale),height);
	
debugyoff += 5;
}

function debug_draw_textbox_cursor(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"cursPosStart: "+string(cursorPosStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"cursorPos: "+string(cursorPos),height);
draw_text_height(xx,yy+((ind+2)*sep),"cursorHoverPos: "+string(cursorHoverPos),height);
draw_text_height(xx,yy+((ind+3)*sep),"cursorXposOff: "+string(cursorXposOff),height);

debugyoff += 5;
}

function debug_draw_scrollbars(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"scrollbar_spd: "+string(scrollbar_speed[0]),height);
draw_text_height(xx,yy+((ind+1)*sep),"scrollbarIndexScrolling: "+string(scrollbarIndexScrolling),height);
draw_text_height(xx,yy+((ind+2)*sep),"canFlick: "+string(canFlick),height);

debugyoff += 4;
}

function debug_draw_modes(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"mode_new_member: "+string(mode_new_member),height);
draw_text_height(xx,yy+((ind+1)*sep),"modeDelete: "+string(modeDelete),height);
	
debugyoff += 3;
}

function debug_draw_calendar(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"monthOffsetStart: "+string(monthOffsetStart),height);
draw_text_height(xx,yy+((ind+1)*sep),"monthOffset: "+string(monthOffset),height);
draw_text_height(xx,yy+((ind+2)*sep),"monthOffsetEnd: "+string(monthOffsetEnd),height);

draw_text_height(xx,yy+((ind+4)*sep),"dayOffset: "+string(dayOffset),height);
draw_text_height(xx,yy+((ind+5)*sep),"dayOffsetEnd: "+string(dayOffsetEnd),height);
draw_text_height(xx,yy+((ind+6)*sep),"daySelectSpan: "+string(daySelectSpan),height);

draw_text_height(xx,yy+((ind+8)*sep),"yearParse: "+string(yearParse),height);
draw_text_height(xx,yy+((ind+9)*sep),"monthParse: "+string(monthParse),height);
draw_text_height(xx,yy+((ind+10)*sep),"dayParse: "+string(dayParse),height);

draw_text_height(xx,yy+((ind+12)*sep),"dateSelectDay: "+string(dateSelectDay),height);
draw_text_height(xx,yy+((ind+13)*sep),"dateSelectMonth: "+string(dateSelectMonth),height);
draw_text_height(xx,yy+((ind+14)*sep),"dateSelectYear: "+string(dateSelectYear),height);

debugyoff += 16;
}

function debug_draw_mouse(xx,yy,ind,sep,height) {
	
//draw_text_height(xx,yy+((ind+0)*sep),"canClickPressed: "+string(canClickPressed),height); // can click
//draw_text_height(xx,yy+((ind+1)*sep),"canClick: "+string(canClick),height); // can click
//draw_text_height(xx,yy+((ind+2)*sep),"clickMoved: "+string(clickMoved),height); // can click
draw_text_height(xx,yy+((ind+3)*sep),"MouseStart: "+string(mouse_xstart)+" , "+string(mouse_ystart),height); // mouse ystart
draw_text_height(xx,yy+((ind+4)*sep),"Mouse Distance: "+string(mouse_xdist)+" , "+string(mouse_ydist),height); // mouse distances
draw_text_height(xx,yy+((ind+5)*sep),"Mouse Coor: "+string(mouse_x)+" , "+string(mouse_y),height); // mouse coor
draw_text_height(xx,yy+((ind+7)*sep),"Mouse Coor%: "+string(mouse_x/room_width*100)+" , "+string(mouse_y/room_height*100),height); // mouse coor
	
if mouse_check_button(mb_middle)
	{
	draw_rectangle_color(mouse_xpos,mouse_ypos,mouse_x,mouse_y,c_black,c_black,c_black,c_black,true);
	draw_text_height(xx,yy+((ind+6)*sep),"Region Size: ["+string(abs(mouse_xpos-mouse_x))+" , "+string(abs(mouse_ypos-mouse_y))+"]",height); // mouse coor
	draw_text_height(xx,yy+((ind+8)*sep),"Region Size %: ["+string(abs(mouse_xpos-mouse_x)/room_width*100)+" , "+string(abs(mouse_ypos-mouse_y)/room_height*100)+"]",height); // mouse coor
	}

debugyoff += 9;
}

function debug_draw_device_testing(xx,yy,ind,sep,height) {
	
var device_pointer = deviceTest.devices[deviceTestIndex];	
	
draw_text_height(xx,yy+((ind+0)*sep),"Device Testing: ["+string(deviceTestIndex)+"]",height);
draw_text_height(xx,yy+((ind+1)*sep),device_pointer.deviceName+": "+string(device_pointer.resWidth)+" x "+string(device_pointer.resHeight),height);
draw_text_height(xx,yy+((ind+2)*sep),"DPI: "+string(device_pointer.dpiX),height);

debugyoff += 3;
}

function debug_device_info(xx,yy,ind,sep,height) {
	
draw_set_halign(fa_left);
//draw_rectangle(50,250,250,450,true);

var ww = display_get_width();
var hh = display_get_height();

draw_text_height(xx,yy+((ind+0)*sep),"display: "+string(ww)+" x "+string(hh),height);

var ww = window_get_width();
var hh = window_get_height();

draw_text_height(xx,yy+((ind+1)*sep),"window: "+string(ww)+" x "+string(hh),height);

var ww = surface_get_width(application_surface);
var hh = surface_get_height(application_surface);

draw_text_height(xx,yy+((ind+2)*sep),"app surf: "+string(ww)+" x "+string(hh),height);

var ww = display_get_gui_width();
var hh = display_get_gui_height();

draw_text_height(xx,yy+((ind+3)*sep),"gui window: "+string(ww)+" x "+string(hh),height);
draw_text_height(xx,yy+((ind+4)*sep),"app_width/height: "+string(app_width)+" x "+string(app_height),height);
draw_text_height(xx,yy+((ind+5)*sep),"window xpos: "+string(window_get_x),height);
draw_text_height(xx,yy+((ind+6)*sep),"window ypos: "+string(window_get_y),height);

draw_text_height(xx,yy+((ind+8)*sep),"DPI_X: "+string(DPI_X),height);
draw_text_height(xx,yy+((ind+9)*sep),"DPI_Y: "+string(DPI_Y),height);
//draw_text_height(xx,yy+((ind+10)*sep),"DPI_X_CONVERT: "+string(DPI_X_CONVERT),height);
//draw_text_height(xx,yy+((ind+11)*sep),"DPI_Y_CONVERT: "+string(DPI_Y_CONVERT),height);

//draw_text_height(xx,yy+((ind+10)*sep),"canvas_width: "+string(canvas_width),height);
//draw_text_height(xx,yy+((ind+11)*sep),"canvas_height: "+string(canvas_height),height);

debugyoff += 13;
}

function debug_draw_active_surfaces(xx,yy,ind,sep,height) {

// header
draw_text_height(xx,yy+(ind*sep),"Surface List",height);

var keys = variable_struct_get_names(surface_struct);
var size = array_length(keys);
for(var n=0;n<size;n++)
	{
	var name = keys[n];
	var surf_array = surface_struct[$ name];
	
	var num = array_length(surf_array);
	for(var i=0;i<num;i++)
		{
		var off_pos = ind+i+n+1;
		
		var surf = surf_array[i].surfID;
		var surf_active = surface_exists(surf);
		var str = pick("Active","Disabled",!surf_active);
	
		draw_text_height(xx,yy+(off_pos*sep),string(name)+"["+string(i)+"]: "+string(str),height);
	
		if surf_active
			{
			var ww = surface_get_width(surf);
			var hh = surface_get_height(surf);
		
			draw_text_height(xx+px(26),yy+(off_pos*sep),string(ww)+" x "+string(hh),height);
			}
			
		debugyoff++;
		}	
	}

debugyoff += 2;	

//cs(js(surface_struct))
//sm("")
}

function debug_draw_project_variables(xx,yy,ind,sep,height) {

draw_text_height(xx,yy+((ind+0)*sep),"active_event: "+string(active_event != undefined),height);
draw_text_height(xx,yy+((ind+1)*sep),"event_entrant_array: "+string(array_length(event_entrant_array)),height);
	
debugyoff += 3;
}

function debug_draw_screen_navigation(xx,yy,ind,sep,height) {

// draw prev screen stack
var size = ds_list_size(prevScreenStack);

// draw current screen
if screenIndex == screen.appStartup
var str = "appStartup";
else
	{
	var str = script_get_name(drawScreen[screenIndex]);
	str = string_replace(str,"draw_","");
	}

draw_text_height(xx,yy+(0*sep),string(str),height);

//draw_text_height(xx+x_pct_x(320),yy+(0*sep),string(fps_real),height);

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
	
debugyoff += 3+size;
}

goto_draw_debug();
