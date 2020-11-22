
function ini_timers(){

for(var i=0;i<timerIndex.enumcount;i++)
timer[i] = -1;
}

function scr_timers() {
	
for(var i=0;i<timerIndex.enumcount;i++)
	{
	// skip timers from counting down
	switch i 
		{
		case timerIndex.vk_switch:
		case timerIndex.scroll_end:
		case timerIndex.flick: continue;
		}
	
	if timer[i] > -1
	timer[i] --;
	}
	
if clickMoved
timer[timerIndex.press_hold] = -1;
	
scr_timer_beep();
}