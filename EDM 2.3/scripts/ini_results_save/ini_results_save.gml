function ini_results_save() {
	
	ini_open("results.ini");
	var save1 = ds_grid_write(scores_grid);
	var save2 = ds_grid_write(team_score_front_grid);
	var save3 = ds_grid_write(team_score_back_grid);
	var save4 = ds_grid_write(team_score_total_grid);
	var save5 = ds_grid_write(scores_grid_front);
	var save6 = ds_grid_write(scores_grid_back);
	var save7 = ds_grid_write(scores_grid_total);

	ini_write_string("final","scores",save1);
	ini_write_string("team","front",save2);
	ini_write_string("team","back",save3);
	ini_write_string("team","total",save4);
	ini_write_string("net","front",save5);
	ini_write_string("net","back",save6);
	ini_write_string("net","total",save7);

	ini_write_real("no_skins","gross",no_gross_skins);
	ini_write_real("no_skins","net",no_net_skins);

	ini_write_real("team_list","number",team_number);

	for(var i=0;i<team_number+1;i++)
	    {
	    var save = ds_list_write(team_list[i]);
	    ini_write_string("team_list","id"+string(i),save);
	    }
    
	ini_close();



}
