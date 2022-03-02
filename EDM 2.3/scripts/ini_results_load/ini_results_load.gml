function ini_results_load() {
	
	if keyboard_check(vk_space)
	exit;

	if !file_exists("results.ini")
	exit;

	global.save_loaded = true;
	}
