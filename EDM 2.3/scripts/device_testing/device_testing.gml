function debug_device_add(name,width,height) {
	
var device = {
	
	deviceName: name,
	resWidth: width,
	resHeight: height,
	}
	
array_push(deviceTest.devices,device);

return device;
}

function ini_resolution_device_tests() {

deviceTest = {
	
	devices: [],
	
	}
		
debug_device_add("Dev Computer",room_width,room_height);
debug_device_add("Galaxy Phone",2024,1080);
debug_device_add("Fire Tablet",1024,552);
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
	
	update_resolution(app_width,app_height);
	}
}

enum deviceTesting {
devComputer,
galaxyPhone,
fireTablet,
}