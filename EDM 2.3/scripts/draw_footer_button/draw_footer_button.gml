function draw_footer_button() {

	// footer button
	var xx = 375;
	var yy = app_height-hh+25;
	draw_sprite_ext(spr_footer_icon,screenIndex,xx,yy,0.5,0.5,0,header_color,1);

	if click_region_released(xx,yy,150,150,true,submenu)
	screen_change(screen.add_course);


	/*
	// draw highlight
	var xx = 15+(180*screenIndex);

	var col = c_white;

	draw_set_alpha(0.5);
	draw_roundrect_colour(xx,yy,xx+150,yy+150,col,col,false);
	draw_set_alpha(1);


/* end draw_footer_button */
}
