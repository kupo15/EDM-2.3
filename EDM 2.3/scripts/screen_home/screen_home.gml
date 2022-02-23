function screen_home() {
	
	var ysep = sprite_get_height(spr_member_button)+2;
	
	draw_member_list(ysep);
	draw_team_list_home(ysep);
	
	// buttons
	draw_clear_all_teams_button();
	draw_create_teams_button();
	
	debug_fill_teams();
	}
	
function debug_fill_teams() {
	
	if dev_mode && keyboard_check_pressed(vk_space) {
	
		// loop through each team
		for(var i=0;i<teams_max;i++) {
			
			team_index = i;
			
			while (array_length(TEAM_LIST[i].members) < 4) {

				var memberStruct = MEMBERS_LIST.list[0];
				memberlist_add_to_team(0,memberStruct);
				}
			}
		}
	}