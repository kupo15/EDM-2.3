#macro memberListDisplayCount 6

function draw_member_list(ysep) {
		
	var xx = 40;
	var yy = 0;
	var ww = sprite_get_width(spr_member_button);
	var hh = button_sep*memberListDisplayCount-12;
	
	// draw add member
	button_index = scr_mouse_position_room(xx,yy,ww,button_sep,mb_left,true);

	draw_sprite_ext(spr_member_button,button_index,xx,yy+5,1,1,0,ADD_MEMBER_BUTTON_STYLE.bgColor,1); // button
	draw_text_centered(xx,yy+5,"Add Member",50,button_ww,button_hh,ADD_MEMBER_BUTTON_STYLE.textColor);

	// if clicked
	if scr_mouse_position_room_released(xx,yy,ww,button_sep,mb_left,true) {
	    
	    edit_member = false;
	    add_member = get_string_async("Enter Member Name","");
	    }
	
	// draw background
	yy += button_sep*2;

	draw_set_alpha(0.7);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_gray,c_gray,c_gray,c_gray,false);
	
	draw_set_alpha(1);
	draw_rectangle_colour(xx-30,yy-ysep+5,xx+ww,yy+hh,c_white,c_white,c_white,c_white,true);
	
	// draw sort list
	var arr = MEMBERS_LIST.list;
	var xx = 10;
	var yy = 80;
	var height = 55
	var col = make_colour_rgb(255,227,215);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text_centered(xx+10,yy,"Sort Member List",height,,ysep-10,col);
	
	// pressed
	if scr_mouse_position_room_released(xx,yy,ww+30,ysep-10,mb_left,true)
	MEMBERS_LIST.list = scr_sort_members(arr,false);

	// draw member list
	yy += button_sep-8;
	var xx = 40;
	var list_size = array_length(arr);
	var size = min(list_size,memberListDisplayCount);
	
	funct_draw_scrollbar(xx-5,yy,memberListDisplayCount,0,list_size,20,member_scroll_offset,ysep,0);
	for(var i=0;i<size;i++) // loop through list
	    {
		// set selected entry
	    if scr_mouse_position_room_pressed(xx,yy+(i*ysep),ww,button_sep,mb_left,false,false) {
			
	        list_slot = i; // store clicked entry
	        timer[mainTimers.renameEntry] = round(room_speed*0.65);
	        }
	    else if mouse_check_button_released(mb_left) || (abs(mouse_ydist) > 5)
	    timer_reset(mainTimers.renameEntry);
    	 
		// draw button and members
		var selected = (list_slot == i);
	    var xx_mouse = pick(0,clamp(mouse_xdist,-100,200),selected); // min(0,mouse_xdist);
		button_index = selected && mouse_check_button(mb_left);
		
		// snap within distance
	    if (abs(xx_mouse) < 7)
	    xx_mouse = 0; 
		
		// entry draw
		var index = i+member_scroll_offset;
		var entry = MEMBERS_LIST.list[index];
		var name = entry.name;
		var favorite = entry.favorite;
		var assigned = (entry.teamAssigned != undefined);
		var nameFont = pick(fn_name,fn_name_it,assigned);
	    var name_col = pick(BUTTON_STYLE.textColor,FAVORITE_BUTTON_STYLE.textColor,favorite);	
	    var button_col = pick(BUTTON_STYLE.bgColor,FAVORITE_BUTTON_STYLE.bgColor,favorite);	
		var alph = clamp((xx_mouse)/100,0,1);
				
		// favorite underneath
		var fav_text = pick("Favorite","Remove",favorite);
		var fav_col = pick(c_white,c_white,favorite);
		var bgcol = pick(c_blue,c_yellow,favorite);
		
		draw_set_alpha(alph);
		draw_icon(,,xx,yy+(i*ysep),440-xx,ysep-3,bgcol,alph);
        draw_text_centered(xx+60,yy+(i*ysep),fav_text,40,,ysep-3,fav_col,alph);
		draw_icon(ico_favorite,0,xx-20,yy+(i*ysep),100,ysep-3,,alph);
	
		// member button
		var alph = clamp((100+xx_mouse)/100,0,1);
	    draw_set_alpha(alph);
		
		draw_icon(,,xx,yy+(i*ysep),440-xx,ysep-3,c_red,1-alph);
		draw_icon(ico_trash,0,340,yy+(i*ysep),100,ysep-3,,1-alph);

	    draw_sprite_ext(spr_member_button,button_index,xx+xx_mouse,yy+(i*ysep),1,1,0,button_col,1); // draw button
		
		draw_set_font(nameFont);
	    draw_text_centered(xx+15+xx_mouse,yy+(i*ysep),name,45,,button_hh,name_col); // draw member name
		draw_set_font(fn_name);
		
		// assigned overlay
		if assigned {
			
			draw_icon(,,xx+xx_mouse,yy+(i*ysep),440-xx,ysep-3,c_black,0.7);
			draw_text_centered(xx+360+xx_mouse,yy+(i*ysep),entry.teamAssigned+1,45,,button_hh,,);
			}

	    draw_set_alpha(1);
		          
	    // scrolling
	    if !deleting_member
	        {
	        if scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,false)
	        member_scroll_offset_start = member_scroll_offset;
        
	        if (xx_mouse == 0) && scr_mouse_position_room(xx,yy,ww,hh,mb_left,false) {
				
	            var amt = round(mouse_ydist*0.05);
	            member_scroll_offset = member_scroll_offset_start-amt;
	            member_scroll_offset = clamp(member_scroll_offset,0,list_size-memberListDisplayCount);
       
	            if (amt != 0)
	            list_slot = noone;
			
				if (mouse_ydist != 0)
				scrollbar_disp_end = 1;
	            }
	        }         
	    }
		
	memberlist_release_actions();
        
	// going to delete
	if (list_slot != noone) && (abs(mouse_xdist) > 7) {
		
	    deleting_member = true;
	    timer[mainTimers.renameEntry] = -1;
	    }
    
	// draw version number
	draw_set_halign(fa_left);
	draw_text_height_color(10,590,"Version: "+string(GM_version),c_black,20);
	}
