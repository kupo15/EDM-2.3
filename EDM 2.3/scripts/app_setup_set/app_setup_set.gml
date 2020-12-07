// timer

function app_setup_set() {
	
if os_type == os_android
	{
	app_width = display_get_width();
	app_height = display_get_height();

	DPI_X = display_get_dpi_x();
	DPI_Y = display_get_dpi_y();

	update_resolution(app_width,app_height,DPI_X,DPI_Y);
	}
}