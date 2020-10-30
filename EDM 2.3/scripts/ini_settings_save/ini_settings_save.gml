function ini_settings_save() {
	ini_open("settings.ini");
	ini_write_real("settings","close_enough",settings_close_enough);
	ini_write_real("settings","date_duplicate",settings_date_duplicate);
	ini_write_real("settings","appversion",appversion);
	//ini_write_real("settings","locked",locked);
	ini_close();

	show_debug_message("settings saved");


}
