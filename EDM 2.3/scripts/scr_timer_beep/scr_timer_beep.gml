
function scr_timer_beep(){

// press hold timer
if timer[timerIndex.press_hold] == 0
delete_list_enable();

if timer[timerIndex.app_start] == 5
app_setup_set();

if timer[timerIndex.app_start] == 0
screenIndex = screen.membersList;
	
}

function scr_timer_highlight_action(ind) {

if transitionReady != 2
exit;

var active_ind = click_highlight_action;

click_highlight_alpha = 0;
click_highlight_alpha_end = 0;
click_highlight_action = undefined;	
transitionReady = 0;

return active_ind == ind;
}