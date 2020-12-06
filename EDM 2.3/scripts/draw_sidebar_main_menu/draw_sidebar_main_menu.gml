function draw_sidebar_main_menu() {
	
draw_set_halign(fa_left);
draw_set_color(c_black);

var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var xx_off = round(offset*(-side_menu_width-30));
var xx = 0;
var yy = 0;
var ww = side_menu_width;
var hh = app_height;
var profile_hh = 200;

var xx_pct = x_pct_x(xx_off);
var ww_pct = x_pct_x(side_menu_width,dev_width);
var profile_hh_pct = y_pct_y(200);

var profile_col = make_color_rgb(76,102,145);

#region profile section
var col = c_white;
draw_rectangle_color(xx_pct,yy,xx_pct+ww_pct,yy+hh,col,col,col,col,false); // menu background

// if click outside of menu
if clickout_region(xx+xx_off,yy,ww,hh,false,navbar.sidebar)
androidBack = true;

if click_button_pct(xx_off,0,"",0,c_black,150,150,undefined,false,undefined,submenu,dev_width)
	{
	submenu = navbar.hidden;
	screen_change(screen.profileView);
	}
else if click_button_pct(xx_off,yy,"",0,c_black,side_menu_width,profile_hh,profile_col,false,false,submenu,dev_width,dev_height)
	{
	if submenu == navbar.profileChange
	androidBack = true;
	else
		{
		submenu = navbar.profileChange;
		screenDarkenIndex = darkenIndex.profileChange;
		}
	}

var xx = 25;
var yy = 25;

draw_image_width_cropped_pct(spr_estrella_banner,0,xx_off,0,side_menu_width,profile_hh,1,dev_width);
draw_icon_height_pct(spr_estrella_logo,0,xx+xx_off,yy,100,1); // profile picture

var height = 45;
var yy = profile_hh-height-10;

draw_text_height_color(xx+xx_off,yy,PROFILE_data.dispName,c_white,height,true,fn_bold); // draw location name

draw_menu_triangle(xx_off+(ww*0.85),yy+15,10,submenu != navbar.profileChange,true);
#endregion

#region draw menu items
var xx = 145;
var yy = profile_hh;
var sep = 120;
var height = 50;

draw_set_halign(fa_left);
draw_text_height_middled(xx+xx_off,yy+(screen.home*sep),"Home",sep,height,undefined,true);
draw_text_height_middled(xx+xx_off,yy+(screen.members*sep),"Members",sep,height,undefined,true);
draw_text_height_middled(xx+xx_off,yy+(screen.stats*sep),"Stats",sep,height,undefined,true);


draw_text_height_middled(xx+xx_off,yy+(screen.help_info*sep),"Help and Info",sep,height,undefined,true);
draw_text_height_middled(xx+xx_off,yy+(screen.settings*sep),"Settings",sep,height,undefined,true);

draw_text_height(x_pct_x(xx_off+15),app_height-y_pct_y(40),"Vers. "+string(GM_version),y_pct_y(30));

for(var i=0;i<screen.enumcount;i++)
	{
	if (i>screen.stats) && (i<screen.help_info)
	continue;
		
	draw_icon_height_centered_color_pct(spr_footer_icon,i,res_bleed_xx+xx_off,yy+(i*sep),sep*0.7,sep,sep*0.7,header_color,1); // draw menu icons
	
	if i == screen.help_info
	draw_line_pixel(xx_off,yy+(i*sep),ww+1,1,c_black,1,true); // separating line

	if click_region_released_clamp(xx_off,yy,(i*sep),ww,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		click_highlight_alpha = 0;
		click_highlight_alpha_start = 0;
		
		submenu = navbar.hidden;
		//androidBackSidebar = true;

		screen_change(i,undefined,true);
		}
	}

#endregion

draw_sidebar_profile_switch(xx_off,profile_hh,ww,sep,height);

if androidBack
submenu = navbar.hidden;
}

function draw_sidebar_profile_switch(xx_off,yy,ww,sep,height) {
	
if submenu != navbar.profileChange
exit;

var xx = 0+xx_off;
var hh = 530;
var col = c_white;

draw_rectangle_color(xx,yy,xx+ww,app_height-70,col,col,col,col,false);
	
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
		draw_plus_button(xoff,yy+off_pos+(sep*0.5),sep*0.66,false);
		draw_text_height_middled(xx+text_xoff,yy+off_pos,"Add Venue",sep,height,1);
		
		if click_region_released(0,yy+off_pos,ww,sep,true,navbar.profileChange,1)
			{
			//activeStruct = scr_profile_create();
			//scr_profile_set(i);
			//
			//screen_change(screen.profileCreate,navbar.popupEntry);
			//click_textbox_set("",textboxEntry.popupEntryText,kbv_type_default);
			}
		
		break;	
		}
		
	var profile_pointer = ROOT_data_struct.profiles[i];
	var disp_name = profile_pointer.dispName;
			
	draw_icon_height(spr_icon_blank_profile,0,xx+25,yy+((sep-(sep*0.8))*0.5)+off_pos,sep*0.8,1); // profile picture
	draw_text_height_middled(xx+text_xoff,yy+off_pos,disp_name,sep,height,1); // profile name
		
	draw_line_pixel(xx+text_xoff,yy+off_pos+sep,ww-text_xoff,1,c_lt_gray,1);	
		
	if click_region_released_clamp_array(0,yy,off_pos,ww,sep,hh,mb_left,c_yellow,navbar.profileChange,i,undefined)
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
	screenDarkenIndex = darkenIndex.sidebar;
	submenu = navbar.sidebar;
	androidBack = false;
	androidBackSidebar = false;
	}
}