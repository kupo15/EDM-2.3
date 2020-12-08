/*
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();

global.vertex_format = vertex_format_end();

function vertex_buffer_bars() {
	
bars_buff = vertex_create_buffer();

vertex_begin(bars_buff, global.vertex_format);

for(var i=0;i<3;i++)
	draw_line_hor(xx,yy+(i*sep),ww,thick,c_white,1);

vertex_position(bars_buff, 10, 10);
vertex_color(bars_buff, c_white, 1);

vertex_position(bars_buff, 110, 10);
vertex_color(bars_buff, c_white, 1);

vertex_position(bars_buff, 110, 110);
vertex_color(bars_buff, c_white, 1);
vertex_end(bars_buff);
	
vertex_freeze(bars_buff);
}