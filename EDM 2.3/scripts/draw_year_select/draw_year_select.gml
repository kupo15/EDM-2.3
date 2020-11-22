function draw_year_select(xcal,ycal,wcal,hcal) {

// darken calendar
var col = c_black;

draw_set_alpha(alpha_lerp*0.6);
draw_roundrect_color(xcal,ycal,xcal+wcal,ycal+hcal,col,col,false);
draw_set_alpha(1);

var xx = 10;
var ww = room_width-xx-xx;
var hh = 400;
var yy = room_height-(alpha_lerp*(hh+30));
var col = c_white; 
var year_sel_parse = 1970+floor(yearSelectOffset/12);
var header_hh = 80;

draw_roundrect_color(xx,yy,xx+ww,yy+hh,col,col,false); // draw dialogue

draw_text_height_middled(room_width*0.5,yy,year_sel_parse,header_hh,50); // draw year

// draw left arrow
if click_button(xx,yy,"<",50,c_black,header_hh+40,header_hh,undefined,false,false,submenu)
	{
	yearSelectOffset -= 12;
	
	if yearSelectOffset < 0
	yearSelectOffset = 0;
	}

// draw right arrow
if click_button(xx+ww-header_hh-40,yy,">",50,c_black,header_hh+40,header_hh,undefined,false,false,submenu)
yearSelectOffset += 12;

// draw months
var xoff = 10; // starting xoff
var yoff = header_hh+10; // starting yoff
var button_sep = 20; // gap between buttons

var gap_ww = ww-xoff;
var button_width = (gap_ww*0.33)-xoff;
var button_height = 60;

var xsep = gap_ww*0.33; // separation between buttons
var ysep = (hh-header_hh)*0.25;

for(var i=0;i<12;i++)
	{
	var xpos_off = xoff+(i mod 3)*xsep;
	var ypos_off = yoff+(floor(i/3)*ysep);
	var col = make_color_rgb(220,220,220); // default
	
	// highlight year
	if ((yearParse-1970)*12)+i == yearSelectOffset
	var col = make_color_rgb(255,255,193);
	
	var mon_disp = funct_convert_date(i+1,false,-1,-1);	
	if click_button(xx+xpos_off,yy+ypos_off,mon_disp,50,c_black,button_width,button_height,col,true,false,submenu)
		{
		monthOffsetEnd = ((year_sel_parse-1970)*12)+i;
		androidBack = true;
		}
	}

// click out of box
if clickout_region(xx,yy,ww,hh,noone,navbar.calendarYearSelect)
	{
	screenDarkenIndex = darkenIndex.calendar;
	submenu = navbar.calendar;
	alpha_lerp_end = 0;
	androidBack = false;
	}

}
