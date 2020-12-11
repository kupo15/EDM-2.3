function draw_sidebar_main_menu() {
	
var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var alpha = (1-offset)*0.5;
var xx_off = fade_offset_set(offset,-side_menu_width-30);
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = app_height;
var profile_hh = 355;

var xx_pct = x_pct_x(xx_off);
var ww_pct = x_pct_x(side_menu_width);
var profile_ypos_end = pct_y(30);
var profile_hh_pct = profile_ypos_end-bleed_top;

if xx_pct+ww_pct < 0
exit;

var profile_col = header_buffer_color; // make_color_rgb(76,102,145);

// draw background
vertex_buffer_sidebar_rect(xx_pct,0,ww_pct,profile_ypos_end,app_height,profile_col,c_white,1,alpha);

var venue_images = [PROFILE_data.bannerID,PROFILE_data.logoID];
if sprite_exists(venue_images[0])
vertex_buffer_draw_width_cropped(venue_images[0],0,xx_pct,bleed_top,ww_pct,profile_hh_pct,0,c_white,1);

#region profile section
var xx = x_pct_x(25);
var yy = bleed_top+y_pct_y(25);
var height = pct_y(8.33);

if sprite_exists(venue_images[1])
draw_icon_height(venue_images[1],0,xx_pct+xx,yy,height,1); // profile picture


var height = pct_y(3.75);
var yy = profile_ypos_end-height-y_pct_y(10);

draw_menu_triangle(xx_pct+(ww_pct*0.85),yy,y_pct_y(14),submenu != navbar.profileChange,false,c_white,1);

draw_text_height_color(xx+xx_pct,yy,PROFILE_data.dispName,c_white,height,false,fn_bold); // draw location name


// if click outside of menu
if clickout_region_pct(xx_off,0,ww,hh,false,navbar.sidebar)
androidBack = true;

if click_region_released(xx_off,bleed_top,x_pct_x(150),y_pct_y(150),true,submenu,1)
	{
	submenu = navbar.hidden;
	screen_change(screen.profileView);
	}
else 
if click_region_released(xx_pct,bleed_top,ww_pct,profile_hh_pct-1,true,submenu,1)
submenu = pick(navbar.profileChange,navbar.sidebar,submenu == navbar.profileChange);

#endregion


#region draw menu items
var xx = pct_x(13);
var yy = profile_ypos_end;
var sep = pct_y(11);
var height = pct_y(4.5);

var labels = [];
labels[screen.eventSetup] = "Start Event";
labels[screen.membersList] = "Members";
labels[screen.stats] = "Stats";
labels[screen.help_info] = "Help and Info";
labels[screen.settings] = "Settings";

draw_text_height(xx_pct+pct_x(1.5),pct_y(97),"Vers. "+string(GM_version),pct_y(2.5));

var element_num = 3;
for(var e=0;e<element_num;e++)
for(var i=0;i<screen.enumcount;i++)
	{
	var ypos = yy+(i*sep);
		
	if (i>screen.stats) && (i<screen.help_info)
	continue;
		
	switch e
		{	
		// draw headers
		case 0: draw_text_height_middled(xx+xx_pct,ypos,labels[i],sep,height,undefined); break;
		
		// separating line
		case 1: if i == screen.help_info
				draw_line_pixel(xx_pct,ypos,ww_pct,1,c_black,1);
				break;
				
		// draw menu icons
		case 2: draw_icon_height_centered_color(spr_footer_icon,i,bleed_left+xx_pct,ypos,sep*0.7,sep,sep*0.7,header_color,1); break;			
		}
		
	if (e+1) < element_num
	continue;

	if click_region_released_clamp(xx_pct,yy,(i*sep),ww_pct,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		highlight_struct.alpha = 0;
		highlight_struct.alpha_start = 0;
		
		screen_change(i,navbar.hidden,true);
		}
	}

#endregion

draw_sidebar_profile_switch(xx_pct,profile_ypos_end,ww_pct,app_height-profile_ypos_end-pct_y(3),sep,height);

if androidBack
submenu = navbar.hidden;
}

function draw_sidebar_profile_switch(xx_off,yy,ww,hh,sep,height) {
	
if submenu != navbar.profileChange
exit;

var xx = xx_off;

// draw background
draw_rectangle_pixel(xx,yy,ww,hh,c_white,false);

var xoff = x_pct_x(55);
var text_xpos = pct_x(10);

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
				
		//if e == 2 && !on_profile
		//	{
		//	draw_text_height_middled_color(text_xpos+260,yy+off_pos,pos,sep,c_black,height,1);						
		//	draw_text_height_middled_color(text_xpos+300,yy+off_pos,on_profile,sep,c_black,height,1);	
		//	draw_text_height_middled_color(text_xpos+330,yy+off_pos,i+1==size,sep,c_black,height,1);	
		//	}
				
		if last_index
			{
			switch e
				{
				case 1: draw_text_height_middled_color(xx+text_xpos,yy+off_pos,"Create Venue",sep,c_black,height,1); break;	

				case 2: draw_plus_button(xx+pct_x(4.6),yy+off_pos+(sep*0.5),sep*0.66,c_black,undefined,undefined,1); break; // draw plus sign
				}				
			}
		else
		if !on_profile
			{		
			switch e
				{
				case 0: draw_line_pixel(xx+text_xpos,yy+off_pos+sep,ww-text_xpos,1,c_gray,1); break;

				// profile name
				case 1:	var str = profile_pointer.dispName;
					
						// draw text
						draw_text_height_middled_color(xx+text_xpos,yy+off_pos,str,sep,c_black,height,1);
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

// clicking in loop
var pos = 0;
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

var name_entry = draw_overlay_popup_entry("Enter your name",kvLastString,-1);
if name_entry != undefined
	{
	}
	
if androidBack
	{
	submenu = navbar.sidebar;
	androidBack = false;
	}
}