	
function Member(_name,_teeColor=choose("white","gold","blue","silver","combo"),_favorite=false) constructor {
	
	memberId = MEMBERS_LIST.nextMemberId;
	memberDetails = new MemberInfo(_name);
	
	favorite = _favorite;
	recent = -1;
	archived = false;
	
	handicapIndex = 54;
	teeColor = _teeColor;
	
	entrantNumber = undefined;
	teamAssigned = undefined;
	
	roundStats = new RoundStats();
	eventWinnings = new EventWinnings();
	
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
		
function RoundStats() constructor {
	
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
	
function EventWinnings() constructor {
	
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