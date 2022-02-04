enum mainTimers {
	
renameEntry,
enumcount
}

function ini_timer(number) {
	
	for(var i=0;i<number;i++)
	timer[i] = -1;
	}

function scr_timer_countdown(_enumcount) {
	
	for(var i=0;i<_enumcount;i++)
	if timer[i] > -1 // if timer is active
	timer[i]-- // countdown
	else timer[i] = -1;
	}

function timer_beep(ind) {
	
	return (timer[ind] == 0);
	}

function timer_reset(ind) {
	
	timer[@ ind] = -1;
	}	
	
function timer_pause(array_ind,ind) {
	
	if (array_ind[ind] != -1)
	array_ind[@ ind]++;
	}