function draw_overlay_sidebar() {

var offset = 1-offsetArray[offsetScroll.sidebarXoff];
var alpha = (1-offset)*0.5;

if offset > 0.99
	{
	if surface_exists(surface_array[surfaces.sidebar])
		{
		surface_free(surface_array[surfaces.sidebar]);
		surface_free(surface_array[surfaces.sidebarProfile]);
		}
	exit;
	}

// build surfaces
if surface_set(surfaces.sidebar)
	{
	element_sidebar_draw();
	element_sidebar_profile_draw();	
	surface_reset_target();
	}

// draw surfaces
draw_rectangle_pixel(0,0,app_width,app_height,c_black,false,alpha); // darken screen

var xx_hide = -(side_menu_width)-px(1.5);
var xx = fade_offset_set(offset,xx_hide);

// draw sidebar main
surface_draw(surfaces.sidebar,xx,0,1);

// draw sidebar profile
//if submenu == navbar.profileChange
//surface_draw(surfaces.sidebarProfile,xx,0,1);

// click
element_sidebar_step(xx);
element_sidebar_profile_step(xx);
element_sidebar_shared_step(xx);
}