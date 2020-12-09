#region create vertex format

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
global.vertex_format_pos_col = vertex_format_end();

// create buffers for menu icons
global.vbuffer = vertex_create_buffer();
#endregion

///////////////////////


function vertex_buffer_bars(xx,yy,ww,thick,sep,col) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

for(var i=-1;i<2;i++)
	{
	var yoff = (i*sep);
	var ypos = yy+yoff;


	vertex_position(vbuff,xx,ypos);
	vertex_color(vbuff,col,1);

	vertex_position(vbuff,xx,ypos+thick);
	vertex_color(vbuff,col,1);

	vertex_position(vbuff,xx+ww,ypos);
	vertex_color(vbuff,col,1);

	//

	vertex_position(vbuff,xx+ww,ypos);
	vertex_color(vbuff,col,1);
	
	vertex_position(vbuff,xx,ypos+thick);
	vertex_color(vbuff,col,1);

	vertex_position(vbuff,xx+ww,ypos+thick);
	vertex_color(vbuff,col,1);
	}

vertex_end(vbuff);
#endregion

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}

function vertex_buffer_back_arrow(xx,yy,ww,diag_ll,shift,half,col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

vertex_position(vbuff,xx+diag_ll+shift,yy+half);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+diag_ll,yy+half);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift,yy);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+diag_ll,yy+half);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift,yy);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx,yy);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx,yy);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift,yy);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+diag_ll,yy-half); 
vertex_color(vbuff,col,alpha);

//
vertex_position(vbuff,xx+shift,yy);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+diag_ll,yy-half); 
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+diag_ll+shift,yy-half);
vertex_color(vbuff,col,alpha);

// horizontal line
thickness = shift*0.4;

vertex_position(vbuff,xx+shift,yy-thickness);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift,yy+thickness); 
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift+ww,yy-thickness);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+shift,yy+thickness);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift+ww,yy+thickness); 
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+shift+ww,yy-thickness);
vertex_color(vbuff,col,alpha);

//draw_rectangle_color(xx+(shift*0.5),yy-thickness,xx+ww,yy+thickness,col,col,col,col,false); // horizontal line

vertex_end(vbuff);
#endregion

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}