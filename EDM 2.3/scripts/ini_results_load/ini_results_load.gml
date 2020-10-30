function ini_results_load() {
	if keyboard_check(vk_space)
	exit;

	if !file_exists("results.ini")
	exit;

	ini_open("results.ini");
	var load1 = ini_read_string("final","scores","");
	var load2 = ini_read_string("team","front","");
	var load3 = ini_read_string("team","back","");
	var load4 = ini_read_string("team","total","");
	var load5 = ini_read_string("net","front","");
	var load6 = ini_read_string("net","back","");
	var load7 = ini_read_string("net","total","");
	var load8 = ini_read_string("entrant_list","entrants","");

	ds_grid_read(scores_grid,load1);
	ds_grid_read(team_score_front_grid,load2);
	ds_grid_read(team_score_back_grid,load3);
	ds_grid_read(team_score_total_grid,load4);
	ds_grid_read(scores_grid_front,load5);
	ds_grid_read(scores_grid_back,load6);
	ds_grid_read(scores_grid_total,load7);

	ds_list_read(entrant_list,load8);

	no_gross_skins = ini_read_real("no_skins","gross",false);
	no_net_skins = ini_read_real("no_skins","net",false);

	team_number = ini_read_real("team_list","number",0);

	for(var i=0;i<team_number+1;i++)
	   {
	   var load = ini_read_string("team_list","id"+string(i),"");
	   ds_list_read(team_list[i],load);
	   }
   
	ini_close();                                                                                                                

	// jump to results
	phase = 2;
	global.save_loaded = true;
	close_enough = true; // if already done once



}
