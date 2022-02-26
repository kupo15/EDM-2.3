function ConfigurationSettings() constructor {

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