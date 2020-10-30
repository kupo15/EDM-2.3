function ini_entry_fee_save() {
	ini_open("payout.ini");
	ini_write_real("entry","skins",skins_entry);
	ini_write_real("entry","blind",blind_fee);
	ini_write_real("entry","team",team_entry);
	ini_write_real("entry","lownet",low_net_entry);
	ini_close();




}
