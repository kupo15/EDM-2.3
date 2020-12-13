function element_sidebar_draw() {

#region draw background
var profile_ypos_end = pct_y(30);
var profile_hh = profile_ypos_end-bleed_top;
var profile_col = header_buffer_color; // make_color_rgb(76,102,145);

vertex_buffer_sidebar_rect(0,0,side_menu_width,profile_ypos_end,app_height,profile_col,c_white,1,1);
#endregion

#region profile section
// draw banner
var spr_banner = PROFILE_data.bannerID;

if sprite_exists(spr_banner)
vertex_buffer_draw_width_cropped(spr_banner,0,0,bleed_top,side_menu_width,profile_hh,0,c_white,1);

// draw logo
var xx = x_pct_x(25);
var yy = bleed_top+y_pct_y(25);

var spr_icon = PROFILE_data.logoID;
var height = py(8.33);

if sprite_exists(spr_icon)
draw_icon_height(spr_icon,0,xx,yy,height,1); // profile picture

// draw location name
var height = pct_y(3.75);

var xx = x_pct_x(25);
var yy = profile_ypos_end-height-py(0.83);

draw_text_height_color(xx,yy,PROFILE_data.dispName,c_white,height,false,fn_bold);

// draw menu triangle
var xx = side_menu_width*0.85;
var yy = profile_ypos_end-height-py(0.83);

var height = py(1.16);
var condition = submenu != navbar.profileChange;

draw_menu_triangle(xx,yy,height,condition,false,c_white,1);
#endregion

#region draw menu items
var xx = px(13);
var yy = profile_ypos_end;
var sep = py(11);
var height = py(4.5);

var labels;
labels[screen.eventSetup] = "Start Event";
labels[screen.membersList] = "Members";
labels[screen.stats] = "Stats";
labels[screen.help_info] = "Help and Info";
labels[screen.settings] = "Settings";

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
		case 0: draw_text_height_middled(xx,ypos,labels[i],sep,height,undefined); break;
		
		// separating line
		case 1: if i == screen.help_info
				draw_line_pixel(0,ypos,side_menu_width,1,c_black,1);
				break;
				
		// draw menu icons
		case 2: draw_icon_height_centered_color(spr_footer_icon,i,bleed_left,ypos,sep*0.7,sep,sep*0.7,header_color,1); break;			
		}
	}

// draw version number
var xx = px(1.5);
var yy = py(97);
var height = py(2.5);

draw_text_height(xx,yy,"Vers. "+string(GM_version),height);
#endregion
}

function element_sidebar_step(xx) {

if submenu != navbar.sidebar
exit;

var profile_ypos_end = pct_y(30);
var profile_hh = profile_ypos_end-bleed_top;

var yy = profile_ypos_end;
var sep = py(11);
var height = py(4.5);

// sidebar items
for(var i=0;i<screen.enumcount;i++)
	{
	var ypos = yy+(i*sep);
		
	if (i>screen.stats) && (i<screen.help_info)
	continue;

	if click_region_released_clamp(xx,yy,(i*sep),side_menu_width,sep,screen.enumcount*sep,mb_left,true,navbar.sidebar,i,undefined,navbar.sidebar)
		{
		highlight_struct.alpha = 0;
		highlight_struct.alpha_start = 0;
		
		screen_change(i,navbar.hidden,true);
		}
	}
}