
goto_draw_debug();

function debug_submenu_names() {

enum_name_submenu[-navbar.enumstart+1+navbar.profileChange] = "profile_change";         
enum_name_submenu[-navbar.enumstart+1+navbar.sidebar] = "sidebar";         
enum_name_submenu[-navbar.enumstart+1+navbar.main] = "main";
enum_name_submenu[-navbar.enumstart+1+navbar.hidden] = "hidden";
enum_name_submenu[-navbar.enumstart+1+navbar.coursebar] = "coursebar";
enum_name_submenu[-navbar.enumstart+1+navbar.locationbar] = "locationbar";
enum_name_submenu[-navbar.enumstart+1+navbar.popupEntry] = "entryPopup";
enum_name_submenu[-navbar.enumstart+1+navbar.teebar] = "teebar";
enum_name_submenu[-navbar.enumstart+1+navbar.year_select] = "year_select";
enum_name_submenu[-navbar.enumstart+1+navbar.parbar] = "parbar";
enum_name_submenu[-navbar.enumstart+1+navbar.scorebar] = "scorebar";
enum_name_submenu[-navbar.enumstart+1+navbar.numpad] = "numpad";
enum_name_submenu[-navbar.enumstart+1+navbar.calendar] = "calendar";
enum_name_submenu[-navbar.enumstart+1+navbar.calendarYearSelect] = "calendarYearSelect";
}

function debug_draw_screens(xx,yy,ind,sep,height) {
	
var str = script_get_name(drawScreen[screenIndex]);
str = string_replace(str,"draw_","");

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
	
draw_text_height(xx,yy+((ind+0)*sep),"highlight_width: "+string(click_highlight_width)+" ["+string(click_highlight_width_end)+"]",height);
draw_text_height(xx,yy+((ind+1)*sep),"highlight_height: "+string(click_highlight_height),height);
draw_text_height(xx,yy+((ind+2)*sep),"highlight_alpha: "+string(click_highlight_alpha)+" ["+string(click_highlight_alpha_end)+"]",height);
draw_text_height(xx,yy+((ind+3)*sep),"highlight_index: "+string(click_highlight_index),height);
draw_text_height(xx,yy+((ind+4)*sep),"highlight_screen: "+string(click_highlight_screen),height);
draw_text_height(xx,yy+((ind+5)*sep),"activeSubmenu: "+string(activeSubmenu),height);

debugyoff += 7;
}

function debug_draw_strings(xx,yy,ind,sep,height) {
	
draw_text_height(xx,yy+((ind+0)*sep),"kvLastString:",height);
draw_text_height(xx,yy+((ind+1)*sep),string(kvLastString),height);

draw_text_height(xx,yy+((ind+2.5)*sep),"stringText:",height);
draw_text_height_middled(xx+130,yy+((ind+2.5)*sep),string(debugStringText),sep,text_reduce(debugStringText,230,height),1);
draw_text_height(xx,yy+((ind+3.5)*sep),"stringxpos: "+string(debugStringXpos),height);
draw_text_height(xx,yy+((ind+4.5)*sep),"stringypos: "+string(debugStringYpos),height);
draw_text_height(xx,yy+((ind+5.5)*sep),"stringHeight: "+string(debugStringHeight),height);

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
draw_text_height(xx,yy+((ind+1)*sep),"mode_delete: "+string(mode_delete),height);
	
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
	
draw_text_height(xx,yy+((ind+0)*sep),"canClickPressed: "+string(canClickPressed),height); // can click
draw_text_height(xx,yy+((ind+1)*sep),"canClick: "+string(canClick),height); // can click
draw_text_height(xx,yy+((ind+2)*sep),"clickMoved: "+string(clickMoved),height); // can click
draw_text_height(xx,yy+((ind+3)*sep),"MouseStart: "+string(mouse_xstart)+" , "+string(mouse_ystart),height); // mouse ystart
draw_text_height(xx,yy+((ind+4)*sep),"Mouse Distance: "+string(mouse_xdist)+" , "+string(mouse_ydist),height); // mouse distances
draw_text_height(xx,yy+((ind+5)*sep),"Mouse Coor: "+string(mouse_x)+" , "+string(mouse_y),height); // mouse coor
	
if mouse_check_button(mb_middle)
	{
	draw_rectangle_color(mouse_xpos,mouse_ypos,mouse_x,mouse_y,c_black,c_black,c_black,c_black,true);
	draw_text_height(xx,yy+((ind+6)*sep),"Region Size: ["+string(abs(mouse_xpos-mouse_x))+" , "+string(abs(mouse_ypos-mouse_y))+"]",height); // mouse coor
	}

debugyoff += 5;
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

draw_text_height(xx,yy+((ind+4)*sep),"window xpos: "+string(window_get_x),height);
draw_text_height(xx,yy+((ind+5)*sep),"window ypos: "+string(window_get_y),height);

draw_text_height(xx,yy+((ind+6)*sep),"app width: "+string(app_width),height);
draw_text_height(xx,yy+((ind+7)*sep),"app height: "+string(app_height),height);
draw_text_height(xx,yy+((ind+8)*sep),"DPI_X: "+string(DPI_X),height);
draw_text_height(xx,yy+((ind+9)*sep),"DPI_Y: "+string(DPI_Y),height);
draw_text_height(xx,yy+((ind+10)*sep),"canvas_width: "+string(canvas_width),height);
draw_text_height(xx,yy+((ind+11)*sep),"canvas_height: "+string(canvas_height),height);
//draw_text_height(xx,yy+((ind+10)*sep),"DPI_X_CONVERT: "+string(DPI_X_CONVERT),height);
//draw_text_height(xx,yy+((ind+11)*sep),"DPI_Y_CONVERT: "+string(DPI_Y_CONVERT),height);

debugyoff += 13;
}

goto_draw_debug();
