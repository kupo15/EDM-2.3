function draw_icon(spr=undefined,ind=0,xx,yy,ww,hh,bgcolor=undefined,alpha=draw_get_alpha()) {
	
	if (bgcolor != undefined) {
		
		draw_set_alpha(alpha*0.5);
		draw_rectangle_color(xx,yy,xx+ww,yy+hh,bgcolor,bgcolor,bgcolor,bgcolor,false);
		}
	
	if (spr != undefined) {
		
		var xoff = (ww-sprite_get_width(spr))*0.5;
		var yoff = (hh-sprite_get_height(spr))*0.5;
	
		draw_sprite_ext(spr,ind,xx+xoff,yy+yoff,1,1,0,c_white,alpha);
		}
	
	draw_set_alpha(1);
	}