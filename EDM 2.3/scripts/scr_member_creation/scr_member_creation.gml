function Member(_name,_teeColor="silver",_favorite=false) constructor {
	
	memberId = MEMBERS_LIST.nextMemberId;
	
	memberDetails = new MemberDetails(_name,_favorite,_teeColor);	
	eventDetails = new EventDetails();
	eventScores = new EventScores();
	eventResults = new EventResults();
	roundHistory = [];
	
	MEMBERS_LIST.nextMemberId++;
	}
	
function parse_name(name) {
	
	var sepInd = string_pos(" ",name);
	var lastInd = string_length(name);
	
	var _first = string_copy(name,1,sepInd-1);
	var _last = string_copy(name,sepInd+1,lastInd);

	return {first: _first, last: _last};
	}
		
function MemberDetails(_name,_favorite,_teeColor) constructor {
	
	var parsedName = parse_name(_name);
	
	fullName = _name;
	firstName = parsedName.first;
	lastName = parsedName.last;
	
	favorite = _favorite;
	recent = -1;
	archived = false;
	
	handicapIndex = undefined;
	teeColor = _teeColor;
	}
	
function EventDetails() constructor {
	
	entrantNumber = undefined;
	teamAssigned = undefined;
	
	blindTeam = undefined;
	noTeam = false;
	
	courseHandicap = undefined;
	}
		
function EventScores() constructor {
		
	grossFront = "";
	grossBack = "";
	grossAdj = "";
	
	netFront = "";
	netBack = "";
	netTotal = "";
	
	skinsGross = "0";
	skinsNet = "0";
	}
	
function EventResults() constructor {
	
	var defaultVal = 0;
	
	payoutBreakdown = {
		
		frontWinnings: defaultVal,
		backWinnings: defaultVal,
		allHolesWinnings: defaultVal,
	
		// totals
		lowNetWinning: defaultVal,
		teamWinning: defaultVal,
		blindWinning: defaultVal,
	
		skinsGross: defaultVal,
		skinsNet: defaultVal,
		skinsTotalWinnings: defaultVal,
	
		winSubtotal: defaultVal,
		entryFee: defaultVal,
		winningGrandTotal: defaultVal,
		}
	
	resultRanking = {
		
		netFront: 1,
		netBack: 1,
		netTotal: 1,
		}
	}