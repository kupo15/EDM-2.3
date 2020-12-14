function element_sidebar_profile_draw() {

if submenu != navbar.profileChange
exit;

var yy = pct_y(30);
var ww = side_menu_width;
var hh = app_height-yy-pct_y(3);
var sep = pct_y(11);
var height = pct_y(4.5);

// draw background
draw_rectangle_pixel(0,yy,ww,hh,c_white,false);

var text_xpos = px(10);

// drawing loop
var element_num = 3;
var size = array_length(ROOT_data_struct.profiles)+1;
for(var e=0;e<element_num;e++)
	{
	var pos = 0;
	
	for(var i=0;i<size;i++)
		{
		var last_index = (i+1 == size)
		var on_profile = (i == activeProfile);
		var off_pos = pos*sep;
		var profile_pointer = ROOT_data_struct.profiles[i];
				
		if last_index
			{
			switch e
				{
				case 1: draw_text_height_middled_color(text_xpos,yy+off_pos,"Create Venue",sep,c_black,height,1); break;	

				case 2: draw_plus_button(pct_x(4.6),yy+off_pos+(sep*0.5),sep*0.66,c_black,undefined,undefined,1); break; // draw plus sign
				}				
			}
		else
		if !on_profile
			{		
			switch e
				{
				case 0: draw_line_pixel(text_xpos,yy+off_pos+sep,ww-text_xpos,1,c_gray,1); break;

				// profile name
				case 1:	var str = profile_pointer.dispName;
					
						// draw text
						draw_text_height_middled_color(text_xpos,yy+off_pos,str,sep,c_black,height,1);
						break;
																
				// profile picture
				case 2: if sprite_exists(profile_pointer.logoID)
						draw_icon_height_centered_color(profile_pointer.logoID,0,pct_x(1.5),yy+off_pos,sep,sep,sep*0.8,c_white,1);
						break;
				}
			
			pos ++;
			}
		}
	}
}


function element_sidebar_profile_step(xx) {
	
if submenu != navbar.profileChange
exit;
	
var yy = py(30);
var ww = side_menu_width;
var hh = app_height-yy-py(3);
var sep = py(11);
	
// clicking in loop
var pos = 0;
var size = array_length(ROOT_data_struct.profiles)+1;
for(var i=0;i<size;i++)
	{
	var last_index = (i+1 == size);
	var on_profile = (i == activeProfile);	
	var off_pos = pos*sep;

	if on_profile
	continue;
	
	if last_index
		{		
		if click_region_released_clamp_array(xx,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.profileChange,i,undefined,undefined)
			{
			activeStruct = scr_profile_create();
			scr_profile_set(i);
			
			screen_change(screen.profileCreate,navbar.popupEntry);
			click_textbox_set("",textboxEntry.popupEntryText,kbv_type_default);
			}
			
		break;
		}
		
		
	if click_region_released_clamp_array(xx,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.profileChange,i,undefined,undefined)
		{
		scr_profile_set(i);
		app_save;
		
		submenu = navbar.main;
		break;
		}
		
	pos ++;
	}
	

}