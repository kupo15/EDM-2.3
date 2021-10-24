// layout
#macro bleed_left px(3)
#macro bleed_top py(3)

// header
#macro header_color make_color_rgb(0,145,206) // make_color_rgb(42,104,53) //
#macro header_buffer_color make_color_rgb(0,145*0.8,206*0.8)

#macro header_height pct_y(13)
#macro header_submenu_height header_height*0.8

#macro header_ypos_end (bleed_top+header_height)
#macro subheader_ypos_end (bleed_top+header_height+header_submenu_height)

#macro header_font_height header_height*0.45
#macro header_submenu_font_height header_font_height*0.8

x = 0;
y = 0;

width = px(100);
height = header_height;

button_create(px(-0.1),bleed_top,px(10),header_height,depth-1,c_black);

function draw_header() {
	
draw_rectangle_color(x,y,x+width,header_ypos_end,header_color,header_color,header_color,header_color,false);
draw_rectangle_color(x,y,x+width,bleed_top,header_buffer_color,header_buffer_color,header_buffer_color,header_buffer_color,false);
}