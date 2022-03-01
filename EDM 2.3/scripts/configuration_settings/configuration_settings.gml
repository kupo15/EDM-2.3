function ConfigurationSettings() constructor {

	courseName = "estrella";

	soundOn = true;
	closeEnough = true;
	keypadOverwrite = false;
	}
	
function ConfigurationMembersList() constructor {
	
	nextMemberId = 0;
			
	list = [];
	archived = [];
	}
	
function ActiveEvent() constructor {
	
	entrantCount= 0;
	eventResults = undefined;

	eventsRun = {
		
		teamLowNet: true,
		skinsGross: true,
		skinsNet: true,
		individualLowNet: true,
		}

	teams = [
			
		new Team(0),
		new Team(1),
		new Team(2),
		new Team(3),
		new Team(4),
		new Team(5),
		]				
	}
	
function ConfigurationMeta() constructor {
	
	version = configversion;
	}
	
function Team(num) constructor {
	
	var defaultVal = 0;
	
	teamNumber = num;
	members = [];
	blindMembers = {};
	
	teamNetFront = "";
	teamNetBack = "";
	teamNetTotal = "";
	
	teamWinnings = {
				
		frontWinnings: defaultVal,
		backWinnings: defaultVal,
		allHolesWinnings: defaultVal,
		}
	}
	
function PrizePool() constructor {
			
	entryFees = {
				
		teamEntry: "30",
		lowNetEntry: "30",
		skinsEntry: "20",
		blindFee: "30",
		}
			
	payoutTable = new PayoutTables();
	}