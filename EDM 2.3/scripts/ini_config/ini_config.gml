function ini_config(view_ww,view_hh) {

// initialize
DPI_X = display_get_dpi_x();
DPI_Y = display_get_dpi_y();
	
DPI_X_CONVERT = display_get_dpi_x()/DPI_POINT;
DPI_Y_CONVERT = display_get_dpi_y()/DPI_POINT;

// set up
setup_room_view();

if os_type == os_windows
device_testing_select(deviceTesting.devComputer);	

// app start
timer[timerIndex.app_start] = 12;
}
