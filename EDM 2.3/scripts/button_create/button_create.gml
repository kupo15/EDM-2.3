function button_create(xx,yy,ww,hh,_depth,bg_col) {
	
	with instance_create_depth(0,0,_depth,obj_button)
		{
		x = xx;
		y = yy;
		width = ww;
		height = hh;
		backgroundColor = bg_col;
		}
	}
