#macro memberListDisplayCount 6

function screen_home() {
	
	var yy = 90;
	var ww = button_ww;
	var sep = button_sep;
	
	draw_set_halign(fa_left);
	
	draw_home_member_list(yy,ww,sep);
	draw_team_list_home(sep);
	
	// buttons
	draw_clear_all_teams_button();
	draw_create_teams_button();
	
	debug_fill_teams();
	}
		
function draw_home_member_list_buttons(yy,sep) {
	
	// new member
	var ww = button_ww-120;
	var xx = 10;
	
	if draw_icon_click(,,xx,yy-sep,ww,sep,appblue) {
		
		edit_member = false;
	    add_member = get_string_async("Enter Member Name","");
	    }
	
	draw_icon(ico_add_member,0,xx,yy-sep,120,sep);
	
	// draw sort
	var ww = 120;
	var xx = 10+button_ww-ww;
	var col = c_yellow;
	
	if draw_icon_click(ico_sort,0,xx,yy-sep,ww,sep)
	MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list,false);
	}
	
function draw_home_member_list(yy,ww,sep) {
	
	var xx = 10;
	var height = 45;
	var scrollEnum = scrollbarIndex.homeMemberList;

	// outline
	draw_set_alpha(0.7);
	draw_rectangle_color(xx,yy-sep,xx+ww,room_height,c_gray,c_gray,c_gray,c_gray,false);
	draw_set_alpha(1);
	
	draw_home_member_list_buttons(yy,sep);
	scrollbar_set_surface(scrollEnum,ww,room_height-yy);
	
	var surf_xx = 0;
	var surf_yy = 0;
	var offset = scrollbar_get_offset(scrollEnum);
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var ind = (i-offset);
		var yoff = (ind*sep);
		var selected = (list_slot == i);
		var inBounds = (mouse_y > yy);
		var held = selected && mouse_check_button(mb_left) && inBounds;
		
		var memberStruct = list[i];
		var entrantDetails = memberStruct.memberDetails;
		var eventDetails = memberStruct.activeEvent.eventDetails;
		
		var favorite = entrantDetails.favorite;
		var assigned = is_real(eventDetails.teamAssigned);
				
		var name_col = pick(BUTTON_STYLE.textColor,FAVORITE_BUTTON_STYLE.textColor,favorite);	
	    var button_col = pick(BUTTON_STYLE.bgColor,FAVORITE_BUTTON_STYLE.bgColor,favorite);	
		
		// set selected entry
		select_member_in_list(xx,yy+yoff,ww,sep,i,inBounds);
	   		
		draw_sprite_stretched_ext(spr_member_button_9slice,held,surf_xx,surf_yy+yoff,ww,button_hh,button_col,1); // draw button
		draw_member_name(surf_xx+15,surf_yy+yoff,memberStruct,height,name_col,,sep,false,false,true);
		}
		
	scrollbar_draw_surface(scrollEnum,xx,yy);
		
	memberlist_release_actions(list_slot);	
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarIndex.homeMemberList);
	
	if mouse_check_button_released(mb_left) || (abs(global.mouse_ydist) > mouseCanClickDist) {
		
		list_slot = undefined;
		timer_reset(mainTimers.renameEntry);
		}
	}
	
function select_member_in_list(xx,yy,ww,hh,ind,inBounds) {
	
	if !inBounds
	exit;
	
	if scr_mouse_position_room_pressed(xx,yy,ww,hh,,,false) {
			
		list_slot = ind; // store clicked entry
		timer[mainTimers.renameEntry] = round(room_speed*0.65);
		}
	}
	
function debug_fill_teams() {
	
	var memberList = MEMBERS_LIST.list;
	
	if dev_mode && keyboard_check_pressed(vk_space) {
	
		// loop through each team
		for(var i=0;i<teams_max;i++) {
			
			team_index = i;
			
			while (array_length(TEAM_LIST[i].members) < teamMemberMax) {

				if (array_length(memberList) == 0)
				break;
				
				var memberStruct = memberList[0];
				memberlist_add_to_team(0,memberStruct);
				}
			}
		}
	}