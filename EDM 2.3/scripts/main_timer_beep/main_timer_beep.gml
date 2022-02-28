function scr_main_timer_beep() {
	
	if timer_beep(mainTimers.renameEntry) {
		
		member_edit_name(MEMBERS_LIST.list[list_slot+member_scroll_offset]);
	    }
	}