	
function Member(_name,_teeColor=choose("white","gold","blue","silver","combo"),_favorite=false) constructor {
	
	memberId = MEMBERS_LIST.nextMemberId;
	
	memberDetails = new MemberInfo(_name);
	
	eventDetails = new EventDetails();
	eventScores = new EventScores();
	eventResults = new EventResults();
	
	favorite = _favorite;
	recent = -1;
	archived = false;
	
	handicapIndex = 54;
	teeColor = _teeColor;
	
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
		
function MemberInfo(_name) constructor {
	
	var parsedName = parse_name(_name);
	
	fullName = _name;
	firstName = parsedName.first;
	lastName = parsedName.last;
	}
	
function EventDetails() constructor {
	
	entrantNumber = undefined;
	teamAssigned = undefined;
	}
		
function EventScores() constructor {
	
	resultRanking = {
		
		netFront: 1,
		netBack: 1,
		netTotal: 1,
		}
	
	grossFront = "";
	grossBack = "";
	grossAdj = "";
	
	netFront = "";
	netBack = "";
	netTotal = "";
	
	skinsGross = "0";
	skinsNet = "0";
	
	blindTeam = undefined;
	noTeam = false;
	
	courseHandicap = calculate_member_handicaps();
	}
	
function EventResults() constructor {
	
	var defaultVal = 0;
	
	frontWinnings = defaultVal;
	backWinnings = defaultVal;
	allHolesWinnings = defaultVal;
	
	// totals
	lowNetWinning = defaultVal;
	teamWinning = defaultVal;
	blindWinning = defaultVal;
	
	skinsGross = defaultVal;
	skinsNet = defaultVal;
	skinsTotalWinnings = defaultVal;
	
	winSubtotal = defaultVal;
	entryFee = defaultVal;
	winningGrandTotal = defaultVal;
	}