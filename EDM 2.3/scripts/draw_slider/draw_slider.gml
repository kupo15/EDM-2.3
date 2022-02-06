enum sliderEnum {
	
none,
teamPayout,
lowNetPayout,
}

function draw_slider(xx,yy,ww,_sliderType,label,val,_min,_max) {
	
	var hh = 30;
	var col = ADD_MEMBER_BUTTON_STYLE.bgColor;
	draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false);
	
	var span = (_max-_min);
	var sep = (ww-hh)/(span);
	var xoff = (val-_min)*sep;
	var col = c_black;
	
	draw_roundrect_color(xx,yy,xx+xoff+(hh*0.49),yy+hh,c_white,c_white,false);	
	draw_circle_color(xx+(hh*0.5)+xoff,yy+(hh*0.5),hh*0.5,col,col,false);

	// label
	draw_text_centered(xx,yy,label,hh,ww,hh*3.5);
	
	if scr_mouse_position_room_pressed(xx,yy,ww,hh,mb_left,false,true)
	sliderIndex = _sliderType;
	else if mouse_check_button_released(mb_left)
	sliderIndex = sliderEnum.none;
	
	if (sliderIndex != _sliderType)
	return val;
	
	var perc = clamp((mouse_x-xx)/ww,0,1);
	val = (perc*span)+_min;
	
	return round(val);
	}
