function ini_settings_open() {
	ini_open("settings.ini");
	settings_close_enough = ini_read_real("settings","close_enough",true);
	settings_date_duplicate = ini_read_real("settings","date_duplicate",true);
	appversion = ini_read_real("settings","appversion",GM_version);
	locked = ini_read_real("settings","locked",true);
	dev_mode = ini_read_real("settings","dev_mode",false);
	ini_close();

	locked = false;


}
