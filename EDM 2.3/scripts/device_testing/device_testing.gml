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
}

enum deviceTesting {
devComputer,
galaxyPhone,
fireTablet,
nextbook,
}