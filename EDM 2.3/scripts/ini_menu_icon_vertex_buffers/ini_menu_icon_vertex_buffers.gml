#region create vertex format

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
global.vertex_format_pos_col = vertex_format_end();

// create buffers for menu icons
global.vbuffer = vertex_create_buffer();
#endregion

///////////////////////


function vertex_buffer_bars(xx,yy,ww,thick,sep,col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

for(var i=-1;i<2;i++)
	{
	var yoff = (i*sep);
	var ypos = yy+yoff;


	vertex_position(vbuff,xx,ypos);
	vertex_color(vbuff,col,alpha);

	vertex_position(vbuff,xx,ypos+thick);
	vertex_color(vbuff,col,alpha);

	vertex_position(vbuff,xx+ww,ypos);
	vertex_color(vbuff,col,alpha);

	//

	vertex_position(vbuff,xx+ww,ypos);
	vertex_color(vbuff,col,alpha);
	
	vertex_position(vbuff,xx,ypos+thick);
	vertex_color(vbuff,col,alpha);

	vertex_position(vbuff,xx+ww,ypos+thick);
	vertex_color(vbuff,col,alpha);
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

vertex_end(vbuff);
#endregion

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}

function vertex_buffer_menu_arrow(xx,yy,hh,condition,pct,col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

var flip = pick(-1,1,condition);
var yoff = pick(hh*0.9,0,condition);

yy = yy+yoff;

var x1 = xx;
var y1 = yy;

var x2 = x1+hh;
var y2 = y1+(hh*flip);

var x3 = x2;
var y3 = yy;

var x4 = x3+1;
var y4 = y2;

var x5 = x4;
var y5 = yy;

var x6 = x5+hh;
var y6 = yy;

if argument[5] == undefined
col = draw_get_color();

if argument[4] == true
	{
	x1 = x_pct_x(x1);
	y1 = y_pct_y(y1);
	
	x2 = x_pct_x(x2);
	y2 = y_pct_y(y2);
	
	x3 = x_pct_x(x3);
	y3 = y_pct_y(y3);
	
	x4 = x_pct_x(x4);
	y4 = y_pct_y(y4);
		 
	x5 = x_pct_x(x5);
	y5 = y_pct_y(y5);
		 
	x6 = x_pct_x(x6);
	y6 = y_pct_y(y6);
	}


vertex_position(vbuff,x1,y1);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,x2,y2);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,x3,y3);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,x4,y4);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,x5,y5); 
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,x6,y6);
vertex_color(vbuff,col,alpha);

vertex_end(vbuff);
#endregion

/// draw
vertex_submit(vbuff,pr_trianglestrip,-1); 
}

function vertex_buffer_menu_xout(xx,yy,ww,hh,thick,col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

if argument[5] == undefined
col = draw_get_color();

var xshift = thick*0.5;
var yshift = thick*0.5;

vertex_position(vbuff,xx-xshift,yy+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+xshift,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+ww+xshift,yy+hh-yshift);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+ww+xshift,yy+hh-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-xshift,yy+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+ww-xshift,yy+hh+yshift);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+ww-xshift,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+ww+xshift,yy+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+xshift,yy+hh+yshift);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+xshift,yy+hh+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+ww-xshift,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-xshift,yy+hh-yshift);
vertex_color(vbuff,col,alpha);

vertex_end(vbuff);

#endregion

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}

function vertex_buffer_menu_plus(xx,yy,d,thick,col,enclosed_col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

var r = d*0.5;
var line_ww = r*0.4;
var line_hh = r*0.4;

var xshift = thick*0.5;
var yshift = thick*0.5;

//if enclosed_col != undefined
//draw_circle_color(xx,yy,r,col,col,false);

// draw plus
vertex_position(vbuff,xx-xshift,yy-line_hh);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+xshift,yy-line_hh);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+xshift,yy+line_hh);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+xshift,yy+line_hh);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-xshift,yy+line_hh);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-xshift,yy-line_hh);
vertex_color(vbuff,col,alpha);

//--//

vertex_position(vbuff,xx-line_ww,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+line_ww,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx+line_ww,yy+yshift);
vertex_color(vbuff,col,alpha);

//

vertex_position(vbuff,xx+line_ww,yy+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-line_ww,yy+yshift);
vertex_color(vbuff,col,alpha);

vertex_position(vbuff,xx-line_ww,yy-yshift);
vertex_color(vbuff,col,alpha);

vertex_end(vbuff);

#endregion

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}

function vertex_buffer_dots(xx,yy,rr,sep,col,alpha) {

var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vertex_format_pos_col);

// draw circle
for(var n=-1;n<2;n++)
vertex_buffer_circle(vbuff,xx,yy+(n*sep),rr,col,alpha);

vertex_end(vbuff);

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}

function vertex_buffer_circle(vbuffer,xx,yy,rr,col,alpha) {

// create circle buffer
var precision = 60;
var inc = 360/precision
for(var i=0;i<360;i+=inc)
	{
	var dir = i;
	var pos_xx1 = lengthdir_x(rr,dir);
	var pos_yy1 = lengthdir_y(rr,dir);
	
	var pos_xx2 = lengthdir_x(rr,dir+inc);
	var pos_yy2 = lengthdir_y(rr,dir+inc);
		
	vertex_position(vbuffer,xx,yy); // center
	vertex_color(vbuffer,col,alpha);

	vertex_position(vbuffer,xx+pos_xx1,yy+pos_yy1);
	vertex_color(vbuffer,col,alpha);

	vertex_position(vbuffer,xx+pos_xx2,yy+pos_yy2);
	vertex_color(vbuffer,col,alpha);
	}
}