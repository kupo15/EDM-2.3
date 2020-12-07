function debug_device_add(name,width,height,dpi_x,dpi_y) {
	
var device = {
	
	deviceName: name,
	resWidth: width,
	resHeight: height,
	dpiX: dpi_x,
	dpiY: dpi_y,
	}
	
array_push(deviceTest.devices,device);

return device;
}

function ini_resolution_device_tests() {

deviceTest = {
	
	devices: [],
	
	}
		
debug_device_add("Dev Computer",room_width,room_height,display_get_dpi_x(),display_get_dpi_y());
debug_device_add("Galaxy Phone",2024,1080,480,480);
debug_device_add("Fire Tablet",1024,552,160,160);

//debug_device_add("Nextbook Tablet",800,400);
}

function device_testing_select(ind) {

var num = array_length(deviceTest.devices);

if argument[0] != undefined
deviceTestIndex = clamp(ind,0,num);	
else if keyboard_check_pressed(vk_space)
deviceTestIndex = (deviceTestIndex+1) mod num;
		
if keyboard_check_pressed(vk_space) || (ind != undefined)
	{	
	app_width = deviceTest.devices[deviceTestIndex].resWidth;
	app_height = deviceTest.devices[deviceTestIndex].resHeight;
	
	DPI_X = deviceTest.devices[deviceTestIndex].dpiX;
	DPI_Y = deviceTest.devices[deviceTestIndex].dpiY;
	
	update_resolution(app_width,app_height,DPI_X,DPI_Y);
	}
	
	
// adjust window size and position for debugging
var scale = dev_width/app_width;
var debug_ww = 1.75;
	
// set window size
var window_ww = app_width*scale;
var window_hh = app_height*scale;
	
var disp_ww = display_get_width();
var disp_hh = display_get_height();

if disp_hh < window_hh
	{
	var adjust_scale = disp_hh/window_hh;
		
	window_ww *= adjust_scale*0.9;
	window_hh *= adjust_scale*0.9;
	}
		
window_set_size(window_ww*debug_ww,window_hh);
	
// set window position
var window_xx = (disp_ww-(window_ww*debug_ww))*0.5;
var window_yy = (disp_hh-window_hh)*0.5; // disp_center_hh-(window_hh*0.5);
	
window_set_position(window_xx,window_yy);
}

enum deviceTesting {
devComputer,
galaxyPhone,
fireTablet,
nextbook,
}