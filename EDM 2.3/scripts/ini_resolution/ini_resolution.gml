#macro BUTTON_STYLE con_main.buttonStyle
#macro FAVORITE_BUTTON_STYLE con_main.favoriteButtonStyle
#macro ADD_MEMBER_BUTTON_STYLE con_main.addMemberStyle

function ini_styles() {
	
	addMemberStyle = {
		
		bgColor: make_color_rgb(121,112,225),
		textColor: c_white,
		}
	
	favoriteButtonStyle = {
		
			bgColor: make_color_rgb(255,128,128),
			textColor: c_white,
			}
			
	buttonStyle = {
		
			bgColor: make_color_rgb(230,230,230),
			textColor: c_black,
			}
	}

function ini_resolution() {

	// set resolution
	resolution_height = display_get_height();
	resolution_height = 600;
	resolution_width = round(resolution_height*1.70666);

	if (os_type == os_windows) {
	
		var debg_ww = 1.3;
		var scale = 1.25;
	
		window_set_size(resolution_width*debg_ww*scale,resolution_height*scale);
		window_set_position(100,100);
		}
	}