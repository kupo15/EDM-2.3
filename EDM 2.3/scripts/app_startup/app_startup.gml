globalvar RESOLUTION_HEIGHT, RESOLUTION_WIDTH, MAIN_CAMERA;
MAIN_CAMERA = -1;

//Room Start
function setup_room_view() {
	
RESOLUTION_WIDTH = window_get_width();
RESOLUTION_HEIGHT = window_get_height(); //works the same as display_get_height() on mobile

if (MAIN_CAMERA == -1)
camera_destroy(MAIN_CAMERA);
	
MAIN_CAMERA = camera_create_view(0,0,RESOLUTION_WIDTH,RESOLUTION_HEIGHT);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, MAIN_CAMERA);
surface_resize(application_surface, RESOLUTION_WIDTH, RESOLUTION_HEIGHT);
}

//If the user resizes the window on their computer or turns their phone to a different orientation
function update_resolution(win_width,win_height) {

// set dpi variables
DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
	
DPI_X_CONVERT = display_get_dpi_x()/DPI_POINT;
DPI_Y_CONVERT = display_get_dpi_y()/DPI_POINT;

// set resolution
RESOLUTION_WIDTH = win_width;
RESOLUTION_HEIGHT = win_height;
	
// apply resolution
camera_set_view_size(MAIN_CAMERA,RESOLUTION_WIDTH,RESOLUTION_HEIGHT);
surface_resize(application_surface,RESOLUTION_WIDTH,RESOLUTION_HEIGHT);
display_set_gui_size(RESOLUTION_WIDTH,RESOLUTION_HEIGHT); // set GUI
}






