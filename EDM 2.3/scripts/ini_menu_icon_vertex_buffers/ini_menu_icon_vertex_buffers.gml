#region create vertex format

// vector format
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
global.vformat_pos_col = vertex_format_end();

// sprite format
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vertex_format_add_texcoord();
global.vformat_texture = vertex_format_end();

// create vertex buffer
global.vbuffer = vertex_create_buffer();
#endregion

///////////////////////


function vertex_buffer_bars(xx,yy,ww,thick,sep,col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vformat_pos_col);

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
vertex_begin(vbuff,global.vformat_pos_col);

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
vertex_begin(vbuff,global.vformat_pos_col);

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
vertex_begin(vbuff,global.vformat_pos_col);

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
vertex_begin(vbuff,global.vformat_pos_col);

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

function vertex_buffer_submenu_underline(xx,yy,d,thick,col,enclosed_col,alpha) {

#region create buffer
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vformat_pos_col);

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
vertex_begin(vbuff,global.vformat_pos_col);

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

function vertex_buffer_sidebar_rect(xx,yy,ww,hh,yy2,col1,col2,menu_alpha,darken_alpha) {
	
var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vformat_pos_col);	
	
// darkened screen
var strength = 0.5;

vertex_position(vbuff,0,0);
vertex_color(vbuff,c_black,darken_alpha*strength);
	
vertex_position(vbuff,app_width,0);
vertex_color(vbuff,c_black,darken_alpha*strength);
	
vertex_position(vbuff,0,app_height);
vertex_color(vbuff,c_black,darken_alpha*strength);

//

vertex_position(vbuff,app_width,0);
vertex_color(vbuff,c_black,darken_alpha*strength);
	
vertex_position(vbuff,0,app_height);
vertex_color(vbuff,c_black,darken_alpha*strength);
	
vertex_position(vbuff,app_width,app_height);
vertex_color(vbuff,c_black,darken_alpha*strength);
	
// profile portion	
vertex_position(vbuff,xx,yy);
vertex_color(vbuff,col1,menu_alpha);
	
vertex_position(vbuff,xx+ww,yy);
vertex_color(vbuff,col1,menu_alpha);
	
vertex_position(vbuff,xx,yy+hh);
vertex_color(vbuff,col1,menu_alpha);

//

vertex_position(vbuff,xx+ww,yy);
vertex_color(vbuff,col1,menu_alpha);
	
vertex_position(vbuff,xx,yy+hh);
vertex_color(vbuff,col1,menu_alpha);
	
vertex_position(vbuff,xx+ww,yy+hh);
vertex_color(vbuff,col1,menu_alpha);

//-// menu portion
vertex_position(vbuff,xx,yy+hh);
vertex_color(vbuff,col2,menu_alpha);

vertex_position(vbuff,xx+ww,yy+hh);
vertex_color(vbuff,col2,menu_alpha);
	
vertex_position(vbuff,xx,yy2);
vertex_color(vbuff,col2,menu_alpha);

//
	
vertex_position(vbuff,xx+ww,yy+hh);
vertex_color(vbuff,col2,menu_alpha);
	
vertex_position(vbuff,xx,yy2);
vertex_color(vbuff,col2,menu_alpha);

vertex_position(vbuff,xx+ww,yy2);
vertex_color(vbuff,col2,menu_alpha);

vertex_end(vbuff);

/// draw
vertex_submit(vbuff,pr_trianglelist,-1); 
}
	
function vertex_buffer_draw_width_cropped(sprite,index,xx,yy,region_width,region_height,right_bleed,col,alpha) {

right_bleed = clamp(right_bleed,0,abs(right_bleed));

var spr_ww = sprite_get_width(sprite);
var spr_hh = sprite_get_height(sprite);

var uv_uscale = (region_width+right_bleed)/spr_ww;

var scaled_region_height = uv_uscale*spr_hh; // perfect pixel scale
var new_region_height = min(region_height,scaled_region_height);

var uv_vscale = new_region_height/scaled_region_height;

vertex_buffer_draw_cropped(sprite,index,xx,yy,1,uv_vscale,region_width,new_region_height,col,alpha);
}

function vertex_buffer_draw_height_cropped(sprite,index,xx,yy,region_width,region_height,bottom_bleed,col,alpha) {
	
bottom_bleed = clamp(bottom_bleed,0,abs(bottom_bleed));
	
var spr_ww = sprite_get_width(sprite);
var spr_hh = sprite_get_height(sprite);

var uv_vscale = (region_height+bottom_bleed)/spr_hh;

var scaled_region_width = uv_vscale*spr_ww; // perfect pixel scale
var new_region_width = min(region_width,scaled_region_width);
var uv_uscale = new_region_width/scaled_region_width;

vertex_buffer_draw_cropped(sprite,index,xx,yy,uv_uscale,1,new_region_width,region_height,col,alpha);
}
	
function vertex_buffer_draw_cropped(sprite,index,xx,yy,uscale,vscale,region_width,region_height,col,alpha) {

var vbuff = global.vbuffer;
vertex_begin(vbuff,global.vformat_texture);

//
var spr_tex = sprite_get_texture(sprite,index);
var spr_uvs = sprite_get_uvs(sprite,index);

var uv_left = spr_uvs[0];
var uv_top = spr_uvs[1];
var uv_right = spr_uvs[2];
var uv_bottom = spr_uvs[3];
var uv_shaved_left = spr_uvs[4];
var uv_shaved_top = spr_uvs[5];
var uv_normalized_width = spr_uvs[6];
var uv_normalized_height = spr_uvs[7];

var uv_width = abs(uv_left-uv_right);
var uv_height = abs(uv_top-uv_bottom);

uv_right = uv_left+(uv_width*uscale);
uv_bottom = uv_top+(uv_height*vscale);

vertex_position(vbuff,xx,yy);
vertex_color(vbuff,col,alpha);
vertex_texcoord(vbuff,uv_left,uv_top);

vertex_position(vbuff,xx+region_width,yy);
vertex_color(vbuff,col,alpha);
vertex_texcoord(vbuff,uv_right,uv_top);

vertex_position(vbuff,xx,yy+region_height);
vertex_color(vbuff,col,alpha);
vertex_texcoord(vbuff,uv_left,uv_bottom);

vertex_position(vbuff,xx+region_width,yy+region_height);
vertex_color(vbuff,col,alpha);
vertex_texcoord(vbuff,uv_right,uv_bottom);

vertex_end(vbuff);

// draw
vertex_submit(vbuff,pr_trianglestrip,spr_tex); 
}