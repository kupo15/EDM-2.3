function scr_reset_payout() {
	file_delete("payout.ini");

	ini_payout_table_load();
	ini_entry_fee_load();

	ini_payout_table_save();
	ini_entry_fee_save();

	default_payout_safty = true;




}
