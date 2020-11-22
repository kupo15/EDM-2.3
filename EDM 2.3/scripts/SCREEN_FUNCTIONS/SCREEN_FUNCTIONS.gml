function ini_screen_changeGOTO() {
};
enumGOTO();

function ini_screen_change() {

prev_screen_stack = ds_list_create();
	
drawScreen[screen.home] = draw_home;
drawScreen[screen.blank7] = undefined;
drawScreen[screen.blank8] = undefined

drawScreen[screen.help_info] = undefined;
drawScreen[screen.settings] = undefined;
drawScreen[screen.enumcount] = draw_undefScreen;

drawScreen[screen.edit_date] = draw_date_edit_calendar;	
}

function screen_change(ind,clear) {
/// @param screenIndex
/// @param [clear]

if argument[1] == undefined
clear = false;

ds_list_push(prev_screen_stack,screenIndex); // add current screen to the stack

// change to new screen
if (drawScreen[ind] == 0) || (drawScreen[ind] == undefined)
screenIndex = screen.enumcount;
else
screenIndex = ind;

// clear the prev screen stack
if clear
ds_list_clear(prev_screen_stack);

screen_goto_actions();
}

function screen_goto_prev(subIndex) {
/// @param [submen]

if argument[0] != undefined
submenu = subIndex;

click_highlight_screen = screenIndex;

if ds_list_empty(prev_screen_stack)
	{
	screenIndex = screen.home;
	db("stack empty");
	}
else
screenIndex = ds_list_pop(prev_screen_stack);

screen_goto_actions();
}

function screen_goto_actions() {

vk_hide();

switch screenIndex
	{
	// change to hidden
	case screen.score_view:
	case screen.score_card: submenu = navbar.hidden; break;	
	
	// edit tees
	case screen.edit_tees: submenu = navbar.numpad; break;
		
	//case screen.receiptCreate: click_textbox_set(receipt_price,0,kbv_type_numbers); break;
	
	//case screen.friendsProfile: mode_new_member = false; break;
	}	
	
searched_name = "";
transitionReady = 0;
}