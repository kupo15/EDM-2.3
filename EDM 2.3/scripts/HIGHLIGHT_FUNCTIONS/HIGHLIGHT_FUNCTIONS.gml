// HIGHLIGHT FUNCTIONS
function ini_highlight_vars() {
	
click_highlight_xpos = 0;
click_highlight_ypos = 0;
click_highlight_width = 0;
click_highlight_width_end = 0;
click_highlight_height = 0;

click_highlight_alpha = 0;
click_highlight_alpha_end = 0;
click_highlight_color = c_click_color;
click_highlight_screen = noone;
click_highlight_index = undefined;

click_highlight_action = undefined;

activeSubmenu = navbar.main;
}

function scr_click_highlight_set(xx,yy,ww,hh,col,screen_ind,array_pos){

if col == c_yellow
col = c_gray;

click_highlight_xpos = xx+(ww*0.5); // middle of region
click_highlight_ypos = yy;

click_highlight_width = ww*0.2; // starting width
click_highlight_width_end = ww;

click_highlight_height = hh;
click_highlight_alpha = 0;
click_highlight_alpha_end = 1;
click_highlight_color = col;
click_highlight_screen = screen_ind;
click_highlight_index = array_pos;

activeSubmenu = submenu;
}

function draw_highlight_click_clamp(y_top,yoff,ysep,box_hh,array_pos,active_sub) {
/// @description used for looping through lists

if active_sub == undefined
active_sub = activeSubmenu;

if (click_highlight_index != array_pos) || (activeSubmenu != active_sub)
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
var xx = click_highlight_xpos;
var yy = ypos_clamp;
var hh = sep;
var col = click_highlight_color;

highlight_draw(xx,yy,hh,col);
}
	
function draw_highlight_click_static(sub) {
	
if click_highlight_index != undefined || !sub
exit;

// set drawing variables
var xx = click_highlight_xpos;
var yy = click_highlight_ypos;
var hh = click_highlight_height;
var col = click_highlight_color;

highlight_draw(xx,yy,hh,col);
}
	
function highlight_animation() {
// unused

// lerp position
if click_highlight_width != click_highlight_width_end
click_highlight_width = lerp(click_highlight_width,click_highlight_width_end,click_highlight_lerp);

// lerp alpha
if click_highlight_alpha != click_highlight_alpha_end
click_highlight_alpha = lerp(click_highlight_alpha,click_highlight_alpha_end,click_highlight_lerp*0.9);
	
}

function highlight_fadeout(xx) {
	
var width_reached = (click_highlight_width/click_highlight_width_end) > 0.99;
var clickout = width_reached && !mouse_check_button(mb_left);

// fade away when released OR not inside of box
if clickout || (clickMoved && width_reached)
click_highlight_alpha_end = 0; // fade away	
	
if width_reached && transitionReady
transitionReady = 2;
}

function highlight_draw(xx,yy,hh,col) {
	
// debug
if (click_highlight_index == undefined) && (os_type == os_windows)
col = c_lt_gray;	
	
// lerp position
if click_highlight_width != click_highlight_width_end
click_highlight_width = lerp(click_highlight_width,click_highlight_width_end,click_highlight_lerp);

// lerp alpha
if click_highlight_alpha != click_highlight_alpha_end
click_highlight_alpha = lerp(click_highlight_alpha,click_highlight_alpha_end,click_highlight_lerp*0.9);

// set values
var ww = click_highlight_width*0.5;
var alpha = click_highlight_alpha*(click_highlight_screen == screenIndex);

draw_set_alpha(0.4*alpha);
draw_roundrect_color(xx-ww,yy,xx+ww,yy+hh,col,col,false); // draw highlight
draw_set_alpha(1);

// when to fade away
highlight_fadeout(xx);

}