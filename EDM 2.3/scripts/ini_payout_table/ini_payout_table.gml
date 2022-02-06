function PayoutTables() constructor {
	
	teamPayout = [
			
			[],
			["20"],
			["20","10"],
			["30","10"],
			["30","15","5"],
			["35","15","10"],
			]
		
	lowNetPayout = [
		
			[],
			[],
			[],
			["40"], // 4 players
			["35","15"],
			["40","20"],
			["45","25"],
			["40","24","16"],
			["45","27","18"],
			["50","30","20"], // 10 players
			["55","33","22"],
			["48","36","24","12"],
			["52","39","26","13"],
			["56","42","28","14"],
			["60","45","30","15"], // 15 players
			["56","47","31","16","10"],
			["57","50","34","18","10"],
			["60","52","36","20","12"],
			["62","54","38","22","14"],
			["52","54","38","22","14","10"], // 20 players
			["62","56","40","24","16","12"],
			["64","58","42","26","16","14"],
			["64","60","44","28","18","16"],
			["64","60","44","28","16","10"],
			]
	}

function ini_payout_table() {

	// team payout table
	team_pay_table[0,0] = 0;

	team_pay_table[1,0] = 20;

	team_pay_table[2,0] = 20;
	team_pay_table[2,1] = 10;

	team_pay_table[3,0] = 30;
	team_pay_table[3,1] = 10;

	team_pay_table[4,0] = 30;
	team_pay_table[4,1] = 15;
	team_pay_table[4,2] = 5;

	team_pay_table[5,0] = 35;
	team_pay_table[5,1] = 15;
	team_pay_table[5,2] = 10;
   

	// individual net payout
	low_net_pay_table[0,0] = 0;
	low_net_pay_table[1,0] = 0;
	low_net_pay_table[2,0] = 0;

	// 4 players
	low_net_pay_table[3,0] = 40;

	// 5 players
	low_net_pay_table[4,0] = 35;
	low_net_pay_table[4,1] = 15;

	// 6 players
	low_net_pay_table[5,0] = 40;
	low_net_pay_table[5,1] = 20;

	// 7 players
	low_net_pay_table[6,0] = 45;
	low_net_pay_table[6,1] = 25;

	// 8 players
	low_net_pay_table[7,0] = 40;
	low_net_pay_table[7,1] = 24;
	low_net_pay_table[7,2] = 16;

	// 9 players
	low_net_pay_table[8,0] = 45;
	low_net_pay_table[8,1] = 27;
	low_net_pay_table[8,2] = 18;

	// 10 players
	low_net_pay_table[9,0] = 50;
	low_net_pay_table[9,1] = 30;
	low_net_pay_table[9,2] = 20;

	// 11 players
	low_net_pay_table[10,0] = 55;
	low_net_pay_table[10,1] = 33;
	low_net_pay_table[10,2] = 22;

	// 12 players
	low_net_pay_table[11,0] = 48;
	low_net_pay_table[11,1] = 36;
	low_net_pay_table[11,2] = 24;
	low_net_pay_table[11,3] = 12;

	// 13 players
	low_net_pay_table[12,0] = 52;
	low_net_pay_table[12,1] = 39;
	low_net_pay_table[12,2] = 26;
	low_net_pay_table[12,3] = 13;

	// 14 players
	low_net_pay_table[13,0] = 56;
	low_net_pay_table[13,1] = 42;
	low_net_pay_table[13,2] = 28;
	low_net_pay_table[13,3] = 14;

	// 15 players
	low_net_pay_table[14,0] = 60;
	low_net_pay_table[14,1] = 45;
	low_net_pay_table[14,2] = 30;
	low_net_pay_table[14,3] = 15;

	// 16 players
	low_net_pay_table[15,0] = 56;
	low_net_pay_table[15,1] = 47;
	low_net_pay_table[15,2] = 31;
	low_net_pay_table[15,3] = 16;
	low_net_pay_table[15,4] = 10;

	// 17 players
	low_net_pay_table[16,0] = 57;
	low_net_pay_table[16,1] = 50;
	low_net_pay_table[16,2] = 34;
	low_net_pay_table[16,3] = 18;
	low_net_pay_table[16,4] = 11;

	// 18 players
	low_net_pay_table[17,0] = 60;
	low_net_pay_table[17,1] = 52;
	low_net_pay_table[17,2] = 36;
	low_net_pay_table[17,3] = 20;
	low_net_pay_table[17,4] = 12;

	// 19 players
	low_net_pay_table[18,0] = 62;
	low_net_pay_table[18,1] = 54;
	low_net_pay_table[18,2] = 38;
	low_net_pay_table[18,3] = 22;
	low_net_pay_table[18,4] = 14;

	// 20 players
	low_net_pay_table[19,0] = 62;
	low_net_pay_table[19,1] = 54;
	low_net_pay_table[19,2] = 38;
	low_net_pay_table[19,3] = 22;
	low_net_pay_table[19,4] = 14;
	low_net_pay_table[19,5] = 10;

	// 21 players
	low_net_pay_table[20,0] = 62;
	low_net_pay_table[20,1] = 56;
	low_net_pay_table[20,2] = 40;
	low_net_pay_table[20,3] = 24;
	low_net_pay_table[20,4] = 16;
	low_net_pay_table[20,5] = 12;

	// 22 players
	low_net_pay_table[21,0] = 64;
	low_net_pay_table[21,1] = 58;
	low_net_pay_table[21,2] = 42;
	low_net_pay_table[21,3] = 26;
	low_net_pay_table[21,4] = 16;
	low_net_pay_table[21,5] = 14;

	// 23 players
	low_net_pay_table[22,0] = 64;
	low_net_pay_table[22,1] = 60;
	low_net_pay_table[22,2] = 44;
	low_net_pay_table[22,3] = 28;
	low_net_pay_table[22,4] = 18;
	low_net_pay_table[22,5] = 16;

	// 24 players
	low_net_pay_table[23,0] = 64;
	low_net_pay_table[23,1] = 60;
	low_net_pay_table[23,2] = 44;
	low_net_pay_table[23,3] = 28;
	low_net_pay_table[23,4] = 18;
	low_net_pay_table[23,5] = 16;
	low_net_pay_table[23,6] = 10;

	ini_entry_fee_load();
	ini_payout_table_load();
   



}
