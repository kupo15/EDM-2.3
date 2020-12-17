function draw_background_screen() {

// draw background
draw_clear(c_white);
//draw_sprite_ext(spr_paper,0,0,0,7.5,7.5,0,c_white,1);

if screenIndex == screen.appStartup
draw_appStartup();
else
script_execute(drawScreen[screenIndex]);
}

function draw_darken_screen() {
	
if androidBack
switch screenDarkenIndex
	{
	case darkenIndex.calendarYear: screenDarkenIndex = darkenIndex.calendar; break;
		
	case darkenIndex.calendar:
		
	screenDarkenIndex = darkenIndex.none; break;
	}
	

// lerp the darken screen behind it
// var col = merge_color(c_white,c_black,darken_screen);
var lerp_spd = 0.15;
switch screenDarkenIndex
	{
	case darkenIndex.none: screenDarkenAlpha = lerp(screenDarkenAlpha,0,lerp_spd); break;
		
	case darkenIndex.calendar: screenDarkenAlpha = lerp(screenDarkenAlpha,1,lerp_spd); break;
	}

// draw darken screen
var col = c_black;

draw_set_alpha(screenDarkenAlpha*0.5);	
draw_rectangle_color(0,0,app_width,app_height,col,col,col,col,false); // darken background
draw_set_alpha(1);
}

