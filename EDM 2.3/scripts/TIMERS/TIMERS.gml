
function ini_timers(num) {

	for(var i=0;i<num;i++)
	timer[i] = -1;
	}

function scr_timers() {
	
	for(var i=0;i<array_length(timer);i++)
		{
		if (timer[i] > -1)
		timer[i]--;
		}
	}