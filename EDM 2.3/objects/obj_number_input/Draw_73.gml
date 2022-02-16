
if !active || (con_main.select_blind_team != undefined)
exit;

if !surface_exists(surf) {
	
	// build surface
	surf = surface_create(width,height);
	surface_set_target(surf);

	// background
	draw_clear(c_white);

	// draw input display
	draw_set_color(c_black);
	draw_line(0,displayHeight,width,displayHeight);
	
	// draw keypad
	for(var i=0;i<4;i++) {
		
		// horizontal line
		if (i > 0) {
			
			draw_set_alpha(0.3);
			draw_line(0,displayHeight+(i*keyHeight),width,displayHeight+(i*keyHeight));
			draw_set_alpha(1);
			}

		for(var j=0;j<3;j++) {
		
			// vertical line
			if (j > 0) {
			
				draw_set_alpha(0.3);
				draw_line(j*keyWidth,displayHeight,j*keyWidth,displayHeight+(keyHeight*4));
				draw_set_alpha(1)
				}
				
			// draw numbers
			var xx = j*keyWidth;
			var yy = i*keyHeight;
			var ind = (i*3)+j;
			var str = ["7","8","9","4","5","6","1","2","3","+/-","0"];
			
			if (ind < 11)
			draw_text_centered(xx,yy+displayHeight,str[ind],70,keyWidth,keyHeight);
			else
			draw_text_centered(xx,yy+displayHeight,"Done",50,keyWidth,keyHeight,c_blue);
			}
		}

	// backspace
	draw_icon(ico_backspace,0,keyWidth*2,0,keyWidth,keyHeight);

	surface_reset_target();
	}
	
// draw keypad
draw_surface(surf,x,y);

// draw entryString
var str = pick(entryString,blankStringDisplay,entryString=="");

draw_set_halign(fa_left);
draw_text_centered(x+25,y,str,keyHeight*0.6,,keyHeight,ADD_MEMBER_BUTTON_STYLE.bgColor);

// inputs
if scr_mouse_position_room_released(x+(keyWidth*2),y,keyWidth,keyHeight,mb_left,true,true)
delete_character();

for(var i=0;i<4;i++)
for(var j=0;j<3;j++)
	{
	// draw numbers
	var xx = j*keyWidth;
	var yy = i*keyHeight;
	var ind = (i*3)+j;
	var str = ["7","8","9","4","5","6","1","2","3","+/-","0","Done"];
		
	if scr_mouse_position_room_released(x+xx,y+yy+displayHeight,keyWidth,keyHeight,mb_left,true,true) {
		
		switch str[ind]
			{
			case "+/-": negate_entry(); break;
			case "Done": submit_entry(); break;
			
			default: append_character(str[ind]); break;
			}
		}
	}
	
	
