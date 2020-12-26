function ini_entry_fee_load() {
	
	ini_open("payout.ini");
	skins_entry = ini_read_real("entry","skins",20);
	blind_fee = ini_read_real("entry","blind",30);
	team_entry = ini_read_real("entry","team",30);
	low_net_entry = ini_read_real("entry","lownet",30);
	ini_close();



}
