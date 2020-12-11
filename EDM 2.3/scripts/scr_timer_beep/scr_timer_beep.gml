
function scr_timer_beep(){

// press hold timer
if timer[timerIndex.press_hold] == 0
delete_list_enable();

if timer[timerIndex.app_start] == 5
app_setup_set();

if timer[timerIndex.app_start] == 0
screenIndex = screen.home;
	
}

function scr_timer_highlight_action(ind) {

if transitionReady != 2
exit;

var active_ind = highlight_struct.action;

highlight_struct.alpha = 0;
highlight_struct.alpha_end = 0;
highlight_struct.action = undefined;	
transitionReady = 0;

return active_ind == ind;
}