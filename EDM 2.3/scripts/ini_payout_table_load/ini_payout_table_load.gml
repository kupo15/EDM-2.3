function ini_payout_table_load() {
	ini_open("payout.ini");
	var open = ini_read_string("payout","team","");
	if open != ""
	ds_grid_read(pay_teams_save,open);

	var open = ini_read_string("payout","individual","");
	if open != ""
	ds_grid_read(pay_low_net_save,open);
	ini_close();


	for(var i=0;i<6;i++)
	   {
	   var ww = array_length_2d(team_pay_table,i);
	   for(var ii=0;ii<ww;ii++)
	   team_pay_table[i,ii] = pay_teams_save[# i,ii];
	   }
   
	for(var i=0;i<24;i++)
	   {
	   var ww = array_length_2d(low_net_pay_table,i);
	   for(var ii=0;ii<ww;ii++)
	   low_net_pay_table[i,ii] = pay_low_net_save[# i,ii];
	   }



}
