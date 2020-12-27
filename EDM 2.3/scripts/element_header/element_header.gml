function element_header_draw(header_left,header_right,header_string,headerHeightScale,bg_col) {
/// @param header_left
/// @param header_right
/// @param header_string
/// @param [headerHeightScale
/// @param header_color]

headerLeft = header_left;
headerRight = header_right;

if argument[3] == undefined
headerHeight = header_height;

if argument[4] == undefined
bg_col = header_color;

var xx = app_width*0.5;
var yy = 0;
var ww = app_width;
var hh = header_height;
var height = header_font_height;
var alpha = 1;

//var del_col = make_color_rgb(0,137,123); // delete header color
//var col = merge_color(bg_col,del_col,offsetArray[offsetScroll.headerDeleteAlpha]);
var col = bg_col;

vertex_buffer_header_rect(0,0,ww,bleed_top,hh+bleed_top,header_buffer_color,col,1);

// draw header text
draw_text_height_middled_color(pct_x(15),bleed_top,header_string,header_height,c_white,height,alpha,undefined,undefined);

// draw header icons
var region = header_height;

for(var i=0;i<2;i++)
	{
	var header_type = pick(headerLeft,headerRight,i==1);
	var xpos = pick(0,pct_x(88),i==1);
	
	switch header_type 
		{
		case headerType.bars: 
		
			// draw the 3 bars
			var ww = header_height*0.4;
			var hh = header_height*0.35;
			var xx = (region-ww)*0.6;
			var yy = header_ypos_end*0.5;
			var thick = y_pct_y(6);
		
			draw_menu_bars(xpos+xx,yy,ww,hh,thick,c_white,alpha);
			break;
		
		case headerType.dots:
		
			// draw the 3 dots
			var xx = region*0.5;
			var yy = header_ypos_end*0.5;
			var rr = header_height*0.035;
			var sep = header_height*0.067;
		
			draw_menu_dots(xpos+xx,yy,rr,sep,c_white,alpha);
			break;
		
		case headerType.back:

			var xx = pct_x(3);
			var yy = bleed_top+(header_height*0.5);
			var ww = header_height*0.43;
			var hh = header_height*0.44;
		
			draw_menu_arrow(xpos+xx,yy,ww,hh,4,1,c_white,alpha);
			break;
	
		case headerType.trash:
		
			var xx = x_pct_x(15);
			var yy = bleed_top;
			var ww = pct_x(10);
			var hh = header_height*0.44;
			
			draw_icon_height_centered_color(ico_trash3,yy,xpos,yy,ww,region,hh,c_white,alpha); // trash icon
			break;
		
		case headerType.plus:
		
			var xx = xpos+pct_x(5);
			var yy = bleed_top+pct_y(6.5);
		
			draw_plus_button(xx,yy,region,c_white,alpha,undefined,undefined); // plus button
			break;
			
		case headerType.none: break;
			
		// string
		default: 
		
			var xx = px(2);
			var yy = bleed_top;
			var height = header_font_height*0.9;
			
			draw_text_height_middled_color(xpos+xx,yy,header_type,header_height,c_white,height,1);
		}
	}
}

function element_header_step() {
	
if !modeDelete && (submenu < 0)
for(var i=0;i<2;i++)
	{
	var header_type = pick(headerLeft,headerRight,i==1);
	var xpos = pick(0,pct_x(88),i==1);
		
	if header_type == headerType.bars && click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{		
		submenuPrevious = submenu;
		submenu = navbar.sidebar;
		}					  
	else if header_type == headerType.dots && click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{
		}
	else if header_type == headerType.back && click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{
		screen_goto_prev();
		}
	else if header_type == headerType.plus && click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{
		return header_type;
		}
	else if header_type == headerType.trash	&& click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{
		return header_type;
		}
	else if (header_type != headerType.none) && (i==1) && click_region_released(xpos,bleed_top,pct_x(10),header_height,true,submenu)
		{
		return -1;
		}
	}		
	
return undefined;
}













