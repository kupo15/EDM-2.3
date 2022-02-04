function scr_main_timer_beep() {
	
	if timer_beep(mainTimers.renameEntry) {
		
	    edit_member_slot = list_slot+member_scroll_offset;
	    list_slot = noone;
	    edit_member = true;
	    add_member = get_string_async("Edit Member Name",member_list[| edit_member_slot]);
	    }
	}