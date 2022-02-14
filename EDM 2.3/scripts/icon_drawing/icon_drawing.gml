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
	
function draw_icon_click(spr=undefined,ind=0,xx,yy,ww,hh,bgcolor=undefined,alpha=draw_get_alpha(),highlight=true,canEdit) {
	
	draw_icon(spr,ind,xx,yy,ww,hh,bgcolor,alpha);
	
	return scr_mouse_position_room_released(xx,yy,ww,hh,mb_left,highlight,,canEdit);
	}
	
function draw_line_pixel(xx,yy,ww,hh,col=c_black,alpha=1) {

	draw_sprite_stretched_ext(spr_pixel,0,xx,yy,ww,hh,col,alpha);
	}