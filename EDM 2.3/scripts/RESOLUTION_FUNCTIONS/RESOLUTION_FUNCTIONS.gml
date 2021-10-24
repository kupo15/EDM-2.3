//If the user resizes the window on their computer or turns their phone to a different orientation
function update_resolution(win_width,win_height,dpix,dpiy) {
/// @param window_ww
/// @param window_hh
/// @param [dpi_x
/// @param dpi_y]

	if (argument[2] == undefined) || (argument[3] == undefined)
		{
		dpix = display_get_dpi_x();
		dpiy = display_get_dpi_y();
		}

	// set dpi variables
	DPI_X = dpix;
	DPI_Y = dpiy;
	
	DPI_X_CONVERT = DPI_X/DPI_POINT;
	DPI_Y_CONVERT = DPI_Y/DPI_POINT;

	// set resolution
	RESOLUTION_WIDTH = win_width;
	RESOLUTION_HEIGHT = win_height;
	
	// apply resolution
	camera_set_view_size(MAIN_CAMERA,RESOLUTION_WIDTH,RESOLUTION_HEIGHT);
	surface_resize(application_surface,RESOLUTION_WIDTH,RESOLUTION_HEIGHT);
	display_set_gui_size(RESOLUTION_WIDTH,RESOLUTION_HEIGHT); // set GUI

	// update layout
	//scr_surface_rebuild_struct();
	//layout_normal();
	}
