
function ini_shared(){

device_mouse_dbclick_enable(false);
draw_set_circle_precision(64);

ini_screen_change();
ini_timers();
ini_highlight_vars();
ini_cursor_vars();

// custom vk
numpad_value = "";

// searching lists
searching = false;
searched = false;
searchedIndex = undefined;
returnedSearch = undefined;
searched_name = "";
searchedList = array_create(0);
searchedMap = ds_map_create();

// delete list entries
can_delete = false;
mode_delete = false;
mode_delete_list_id = noone;
deleteList = ds_list_create();

// structs
structUndoStack = ds_list_create();
workingStruct = undefined;
activeStruct = undefined;

undoMap = ds_map_create();

mode_new_member = false;

transitionReady = 0;
androidBack = false;

submenu = navbar.main;
submenuPrevious = submenu;
activeSubmenu = submenu;

screenIndex = screen.home;

textboxIndex = noone;
datePointer = noone;

// virtual keyboard
kvStatus = false;
kvActive = false;
kvHeight = 0;
kvLastString = "";
kvInputString = "";

// mouse
canClick = true;
canClickPressed = true;
clickMoved = false;

mouse_xstart = 0;
mouse_ystart = 0;

mouse_xdist = 0;
mouse_ydist = 0;

mouse_xprev = 0;
mouse_yprev = 0;

mouse_xpos = 0;
mouse_ypos = 0;

// switch tabs
switchTabNum = 5;
switchTabDisp = array_create(switchTabNum,0);
switchTabDispEnd = array_create(switchTabNum,0);

// debug
debugStringXpos = 0;
debugStringYpos = 0;
debugStringHeight = 0;

dateSelectDay = 0;
dateSelectMonth = 0;
dateSelectYear = 0;
daySelectSpan = 0;

calendarAlpha = 0;
calendarAlphaEnd = 0;

// for current viewed month
dayParse = 0;
monthParse = 0;
yearParse = 0;

var temp = date_create_datetime(1970,1,1,1,1,1);
scr_set_date_offsets(temp);

alpha_lerp = 0;
alpha_lerp_end = 0;

debug_reset = false;

// submenus
submenu_menu_xpos = -side_menu_width-30;
submenu_menu_xpos_disp = submenu_menu_xpos;
	
darken_screen = false;
screenDarkenAlpha = 0;
screenDarkenIndex = 0;

// offsets
navbar_yoff = 1;
navbar_yoff_start = 1;

monthOffset = 0;
monthOffsetStart = 0;
monthOffsetEnd = 0;

yearSelectOffset = 0;

// for 3 column calendar
dayOffset = 0;
dayOffsetStart = 0;
dayOffsetEnd = 0;

year_offset = 0;
year_offset_start = 0;
year_offset_end = 0;
	
headerDeleteOffsetDisp = 0;
headerDeleteOffset = 0;

// variables
scrollbar_num = 3;
scrollbar_disp = array_create(scrollbar_num,0);
scrollbar_disp_end = array_create(scrollbar_num,0);
scrollbar_speed = array_create(scrollbar_num,0);

scrollbarIndex = noone;
scrollbarIndexScrolling = noone;

canFlick = true;
debugFlickSpeed = 0;




}