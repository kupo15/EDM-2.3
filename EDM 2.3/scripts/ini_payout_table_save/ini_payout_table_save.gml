function ini_payout_table_save() {
	// update grid
	for(var i=0;i<6;i++)
	   {
	   var ww = array_length_2d(team_pay_table,i);
	   for(var ii=0;ii<ww;ii++)
	   pay_teams_save[# i,ii] = team_pay_table[i,ii];
	   }
   
	for(var i=0;i<24;i++)
	   {
	   var ww = array_length_2d(low_net_pay_table,i);
	   for(var ii=0;ii<ww;ii++)
	   pay_low_net_save[# i,ii] = low_net_pay_table[i,ii];
	   }
 
	// save grid     
	ini_open("payout.ini");
	var save = ds_grid_write(pay_teams_save);
	ini_write_string("payout","team",save);

	var save = ds_grid_write(pay_low_net_save);
	ini_write_string("payout","individual",save);
	ini_close();



}
