// HIGHLIGHT FUNCTIONS
function ini_highlight_vars() {
	
highlight_struct = {
	
	xpos: 0,
	ypos: 0,
	
	width: 0,
	width_end: 0,
	height: 0,

	alpha: 0,
	alpha_end: 0,
	color: c_click_color,

	index: undefined,
	action: undefined,

	activeScreen: noone,
	activeSubmenu: navbar.main,
	}
	

activeSubmenu = navbar.main;
}

function scr_click_highlight_set(xx,yy,ww,hh,col,screen_ind,array_pos){

if col == c_yellow
col = c_gray;

highlight_struct.xpos = xx+(ww*0.5); // middle of region
highlight_struct.ypos = yy;

highlight_struct.width = ww*0.2; // starting width
highlight_struct.width_end = ww;
highlight_struct.height = hh;

highlight_struct.alpha = 0;
highlight_struct.alpha_end = 1;
highlight_struct.color = col;

highlight_struct.index = array_pos;

highlight_struct.activeScreen = screen_ind;

activeSubmenu = submenu;
}

function draw_highlight_click_clamp(y_top,yoff,ysep,box_hh,array_pos,active_sub) {
/// @description used for looping through lists

if active_sub == undefined
active_sub = activeSubmenu;

if (highlight_struct.index != array_pos) || (activeSubmenu != active_sub)
exit;

// change yy and sep/hh
var ypos = y_top+yoff;
var ypos_clamp = clamp(ypos,y_top,y_top+box_hh); // clamp between window

var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = ysep-sep_adj;
		
// if hanging off the bottom
if ypos+sep > y_top+box_hh
var sep = y_top+box_hh-ypos;

// set drawing variables
var xx = highlight_struct.xpos;
var yy = ypos_clamp;
var hh = sep;
var col = highlight_struct.color;

highlight_draw(xx,yy,hh,col);
}
	
function draw_highlight_click_static(sub) {
	
if highlight_struct.index != undefined || !sub
exit;

// set drawing variables
var xx = highlight_struct.xpos;
var yy = highlight_struct.ypos;
var hh = highlight_struct.height;
var col = highlight_struct.color;

highlight_draw(xx,yy,hh,col);
}
	
function highlight_animation() {
// unused

// lerp position
if highlight_struct.width != highlight_struct.width_end
highlight_struct.width = lerp(highlight_struct.width,highlight_struct.width_end,click_highlight_lerp);

// lerp alpha
if highlight_struct.alpha != highlight_struct.alpha_end
highlight_struct.alpha = lerp(highlight_struct.alpha,highlight_struct.alpha_end,click_highlight_lerp*0.9);
	
}

function highlight_fadeout(xx) {
	
var width_reached = (highlight_struct.width/highlight_struct.width_end) > 0.99;
var clickout = width_reached && !mouse_check_button(mb_left);

// fade away when released OR not inside of box
if clickout || (clickMoved && width_reached)
	{
	highlight_struct.alpha_end = 0; // fade away	
	
	// reset
	canClickPressed = true;
	}
	
if width_reached && transitionReady
transitionReady = 2;
}

function highlight_draw(xx,yy,hh,col) {
	
// debug
if (highlight_struct.index == undefined) && (os_type == os_windows)
col = c_lt_gray;	
	
// lerp position
if highlight_struct.width != highlight_struct.width_end
highlight_struct.width = lerp(highlight_struct.width,highlight_struct.width_end,click_highlight_lerp);

// lerp alpha
if highlight_struct.alpha != highlight_struct.alpha_end
highlight_struct.alpha = lerp(highlight_struct.alpha,highlight_struct.alpha_end,click_highlight_lerp*0.9);

// set values
var ww = highlight_struct.width*0.5;
var alpha = highlight_struct.alpha*(highlight_struct.activeScreen == screenIndex);

if alpha > 0.001
	{
	draw_set_alpha(0.4*alpha);
	draw_roundrect_color(xx-ww,yy,xx+ww,yy+hh,col,col,false); // draw highlight
	draw_set_alpha(1);
	}

// when to fade away
highlight_fadeout(xx);

}