function scr_cleanup() {
	
	exit;

	ds_list_destroy(favorites_list);
	ds_list_destroy(favorites_members_list);
	ds_list_destroy(recent_list);

	ds_list_destroy(payout_list_front);
	ds_list_destroy(payout_list_back);
	ds_list_destroy(payout_list_total);

	for(var i=0;i<teams_max;i++)
	    {
	    ds_list_destroy(team_list[i]);
	    ds_list_destroy(blind_list[i]);
	    }

	ds_grid_destroy(scores_grid);
	ds_grid_destroy(scores_grid_front);
	ds_grid_destroy(scores_grid_back);
	ds_grid_destroy(scores_grid_total);

	ds_grid_destroy(team_score_front_grid);
	ds_grid_destroy(team_score_back_grid);
	ds_grid_destroy(team_score_total_grid);

	ds_grid_destroy(pay_teams_save);
	ds_grid_destroy(pay_low_net_save);

	ds_grid_destroy(season_ranking_header_grid);
	ds_grid_destroy(season_ranking_grid);
	ds_grid_destroy(season_ranking_usage_grid);




}
