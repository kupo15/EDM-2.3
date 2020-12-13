function element_sidebar_shared_step(xx) {
	
// shared
if (submenu != navbar.sidebar) && (submenu != navbar.profileChange)
exit;

// profile section
// clicked on logo
var ww = x_pct_x(150);
var hh = y_pct_y(150);

var profile_ypos_end = pct_y(30);
var profile_hh = profile_ypos_end-bleed_top;

// clicked on logo
if click_region_released(xx,bleed_top,ww,hh,true,submenu,1)
	{
	submenu = navbar.hidden;
	screen_change(screen.profileView);
	}
else // clicked banner
if click_region_released(xx,bleed_top,side_menu_width,profile_hh-1,true,submenu,1)
	{
	submenu = pick(navbar.profileChange,navbar.sidebar,submenu == navbar.profileChange);
	scr_surface_rebuild(surfaces.sidebar);
	}


// if click outside of menu
if click_region(xx+side_menu_width,0,app_width,app_height,false,mb_left,submenu)
androidBack = true;	
	
if androidBack
switch submenu
	{
	case navbar.sidebar: submenu = navbar.hidden; break;
	
	
	case navbar.profileChange: submenu = navbar.sidebar;
							   scr_surface_rebuild(surfaces.sidebar);
							   break;
	}
}