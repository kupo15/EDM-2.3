
if (backgroundColor != undefined)
draw_roundrect_color(x,y,x+width,y+height,backgroundColor,backgroundColor,false);

if mouseEntered && (os_type == os_windows)
	{
	draw_set_alpha(0.3);
	draw_rectangle_color(x,y,x+width,y+height,highlight_color,highlight_color,highlight_color,highlight_color,false);
	draw_set_alpha(1);
	}
	
// draw onPress
if (onPressWidth > 0)
	{
	var xx = (x+width)/2;
	var col = c_click_color;
	
	draw_set_alpha(0.5);
	draw_roundrect_color(xx-(onPressWidth*0.5),y,xx+(onPressWidth*0.5),y+height,col,col,false);
	draw_set_alpha(1);		
	}