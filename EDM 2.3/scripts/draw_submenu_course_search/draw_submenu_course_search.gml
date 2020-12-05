

function draw_submenu_course_search(ypos,ww,ysep,ref_array,scrollbar_index) {
	
var coursebar_yoff_start = 1-offsetArray[offsetScroll.coursebarYoff];
var clicked = false;
var searchbar_hh = ysep*0.75;
var xx = 120;
var height = 30;

var yy = ypos+(app_height*coursebar_yoff_start);
yy += searchbar_hh;

var hh = app_height-yy;
var rows = hh/ysep;

var col = c_white;
draw_rectangle_color(0,yy,app_width,yy+app_height,col,col,col,col,false);

scr_searchbar_array(ref_array);

// if searching for a name, swap lists
if searched_name != ""
ref_array = searchedList;

var list_size = array_length(ref_array);
var kvoff = kvHeight/ysep;
var test_passed = yy+(list_size*ysep)+kvHeight > app_height;
var list_ext = list_size+(kvoff*test_passed);

/*
// push the list up out of the way of the keyboard
var action = scr_timer_highlight_action(highlightAction.courseSelect)
if action
	{
	click_textbox_set(friend_name_entry,0,kbv_type_default,kbv_returnkey_next);
	mode_new_member = true;
	
	var test_passed = yy+(list_size*ysep)+kvHeight > room_height;
	var list_ext = list_size+(kvoff*test_passed);
	}*/

	
if !mode_new_member && (list_ext < rows)
offsetArray[scrollbar_index] = 0;
		
var offset_value = offsetArray[scrollbar_index];
var pos_start = floor(offset_value);
var pos_end = min(list_size,ceil(offset_value)+rows);
for(var i=pos_start;i<pos_end;i++)
	{
	var off_ind = i-offset_value;
	var off_pos = (off_ind*ysep);
	var friend_pointer = ref_array[i];
	var name = friend_pointer.courseName;
	var initial = string_char_at(name,1);
		
	if name == "z"
		{
		draw_icon_enclosed(spr_icon_friend_add,0,35,yy+off_pos,60,60,ysep,c_orange,0);
			
		var text_yoff = (ysep-height)*0.5;

		if mode_new_member
		draw_text_height_ext_cursor(xx+5,yy+off_pos+text_yoff,friend_name_entry,"Type in friend's name",-1,ww,0,height,0);
		else
		draw_text_height_middled(xx,yy+off_pos,"New friend",ysep,height); // draw name

		draw_line_pixel(xx,yy+off_pos+ysep,room_width,1,c_black,0.7);

		if !mode_new_member && !mode_delete
		if click_region_released_clamp_array(0,yy,off_pos,ww,ysep,hh,mb_left,true,submenu,i,undefined,undefined)
			{
			click_highlight_action = highlightAction.courseSelect;
			}
				
		continue;
		}
			
	// draw the circle icon
	var col = c_lt_gray;
	draw_set_halign(fa_center);
	draw_circle_color(65,yy+off_pos+(ysep*0.5),30,col,col,false);
	draw_text_height_middled(65,yy+off_pos,initial,ysep,height);
		
	// draw full name
	draw_set_halign(fa_left);
	draw_text_height_middled(xx,yy+off_pos,name,ysep,height); // draw name
	
	draw_line_pixel(xx,yy+off_pos+ysep,room_width,1,c_black,0.7);
								
	// click released on friend
	if click_region_released_clamp_array(0,yy,off_pos,ww,ysep,hh,mb_left,true,submenu,i,ref_array,undefined)
		{
		if mode_delete
			{
			if can_delete
			deleteList[| i] = !deleteList[| i]; // toggle selected
			
			can_delete = true;
			}
		else // clicking on a friend
			{
			textboxIndex = noone;
			keyboard_string = "";
			vk_hide();
				
			searchedIndex = i;
			returnedSearch = friend_pointer;
				
			clicked = true;
			}
		}
	}

#region scrolling
var sub = submenu;

funct_screen_scrolling(0,yy,ww,hh,ysep,list_ext,rows,scrollbar_index,sub);
#endregion
	
	/*
if virtual_keyboard_enter
	{
	if friend_name_entry == ""
		{
		mode_new_member = false;
		vk_hide();
		}
	else
		{
		searched_name = "";
		scr_friend_create(capitalize(friend_name_entry),undefined);
		offsetArray[scrollbar_index] = offset_value+1;
		}
	}
*/
// draw search bar
var col = make_color_rgb(140,238,255);

draw_set_halign(fa_left);
draw_list_searchbar(0,yy-searchbar_hh,"Enter course",height,ww,searchbar_hh,col,submenu);

// if no results
if searched && (list_size == 0) 
	{
	draw_text_height(xx+30,yy+10,"no results!",height); // draw no results
	}

if androidBack && mode_new_member
	{
	//androidBack = false;
	//mode_new_member = false;
	}

return clicked;
}