#macro CURRENCY_SYMBOL con_main.currency[COURSE_DATA.courseData.currencyIndex]

function ini_settings() {

	currency = [" USD"," pesos"];

	in_settings = false;

	pref_low_net_num = 11;
	pref_low_net_num_min = 1;
	pref_low_net_num_max = 23;

	pref_team_num = 2;
	pref_team_num_min = 1;
	pref_team_num_max = 5;
	
	settings_clicked_index = undefined;
	
	preference_index = 0;
	preference_type = 0;
	
	preference_edit_payout = noone;
	
	sliderIndex = sliderEnum.none;
	}