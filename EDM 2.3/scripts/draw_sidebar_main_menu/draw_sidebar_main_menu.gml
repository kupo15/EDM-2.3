function draw_sidebar_main_menu() {
	
var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var xx_off = fade_offset_set(offset,-side_menu_width-30);
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = app_height;
var profile_hh = 200;

var xx_pct = x_pct_x(xx_off);
var ww_pct = x_pct_x(side_menu_width);
var profile_hh_pct = y_pct_y(200);

var profile_col = make_color_rgb(76,102,145);

// draw background
vertex_buffer_sidebar_rect(xx_pct,0,ww_pct,profile_hh_pct,app_height,profile_col,c_white,1,1-offset);

#region profile section
// if click outside of menu
if clickout_region_pct(xx+xx_off,yy,ww,hh,false,navbar.sidebar)
androidBack = true;

if click_region(xx_off,0,x_pct_x(150),y_pct_y(150),true,mb_left,submenu)
	{
	submenu = navbar.hidden;
	screen_change(screen.profileView);
	}
else if click_region(xx_pct,0,ww_pct,profile_hh_pct,true,mb_left,submenu)
	{
	if submenu == navbar.profileChange
	androidBack = true;
	else
	submenu = navbar.profileChange;
	}

var xx = 25;
var yy = 25;

vertex_buffer_draw_width_cropped(spr_estrella_banner,0,xx_pct,0,ww_pct,profile_hh_pct,0,c_white,1);

draw_icon_height_pct(spr_estrella_logo,0,xx+xx_off,yy,100,1); // profile picture

exit;

var height = 45;
var yy = profile_hh-height-10;

draw_text_height_color(xx+xx_off,yy,PROFILE_data.dispName,c_white,height,true,fn_bold); // draw location name



draw_menu_triangle(xx_off+(ww*0.85),yy+15,14,submenu != navbar.profileChange,true,c_white,1);
#endregion

#region draw menu items
var xx = 145;
var yy = profile_hh;
var sep = 120;
var height = 50;

var labels = [];
labels[| screen.eventSetup] = "Start Event";
labels[| screen.membersList] = "Members";
labels[| screen.stats] = "Stats";
labels[| screen.help_info] = "Help and Info";
labels[| screen.settings] = "Settings";

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
		case 2: draw_text_height_middled(xx+xx_off,ypos,label[| i],sep,height,undefined,true); break;
		
		// draw menu icons
		case 0: draw_icon_height_centered_color_pct(spr_footer_icon,i,bleed_left+xx_off,ypos,sep*0.7,sep,sep*0.7,header_color,1); break;
	
		// separating line
		case 1: if i == screen.help_info
				draw_line_pixel(xx_off,ypos,ww+1,1,c_black,1,true);
				break;
		}
		
	if (e+1) < element_num
	continue;

	if click_region_released_clamp_pct(xx_off,yy,(i*sep),ww,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		click_highlight_alpha = 0;
		click_highlight_alpha_start = 0;
		
		submenu = navbar.hidden;
		//androidBackSidebar = true;

		screen_change(i,undefined,true);
		}
	}

#endregion

draw_sidebar_profile_switch(xx_off,profile_hh,ww,hh-profile_hh_pct,sep,height);

draw_text_height(x_pct_x(xx_off+15),app_height-y_pct_y(40),"Vers. "+string(GM_version),y_pct_y(30));


if androidBack
submenu = navbar.hidden;
}

function draw_sidebar_profile_switch(xx_off,yy,ww,hh,sep,height) {
	
if submenu != navbar.profileChange
exit;

var xx = 0+xx_off;

draw_sprite_stretched_ext(spr_pixel,0,x_pct_x(xx),y_pct_y(yy),x_pct_x(ww),hh+1,c_white,1);
	
var xoff = 55;
var text_xoff = 135;
var pos = 0;

var size = array_length(ROOT_data_struct.profiles)+1;
for(var i=0;i<size;i++)
	{
	var off_pos = pos*sep;
	
	if i == profile_index
	continue;
	else if (i+1 == size) // last index
		{
		draw_plus_button_pct(xoff,yy+off_pos+(sep*0.5),sep*0.66,false);
		draw_text_height_middled(xx+text_xoff,yy+off_pos,"Add Venue",sep,height,1,true);
		
		if click_region_released(0,yy+off_pos,ww,sep,true,navbar.profileChange,1,true)
			{
			//activeStruct = scr_profile_create();
			//scr_profile_set(i);
			
			//screen_change(screen.profileCreate,navbar.popupEntry);
			//click_textbox_set("",textboxEntry.popupEntryText,kbv_type_default);
			}
		
		break;	
		}
		
	var profile_pointer = ROOT_data_struct.profiles[i];
	var disp_name = profile_pointer.dispName;		
	
	draw_icon_height_pct(spr_icon_blank_profile,0,xx+25,yy+((sep-(sep*0.8))*0.5)+off_pos,sep*0.8,1); // profile picture
	draw_text_height_middled(xx+text_xoff,yy+off_pos,disp_name,sep,height,1,true); // profile name
		
	draw_line_pixel(xx+text_xoff,yy+off_pos+sep,ww-text_xoff,1,c_lt_gray,1,true);	
		
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.profileChange,i,undefined,undefined,true)
		{
		scr_profile_set(i);
		app_save;

		submenu = navbar.main;
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
	androidBackSidebar = false;
	}
}