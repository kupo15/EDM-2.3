#macro config_file "data.config"
#macro configversion "0.1"
#macro save_program json_save_array(config_file,SAVE_FILE)
#macro SAVE_FILE con_main.CONFIGURATION_FILE

// structure
#macro MEMBERS_LIST SAVE_FILE.membersList
#macro TEAM_LIST SAVE_FILE.activeEvent.teams
#macro ENTRANT_COUNT SAVE_FILE.activeEvent.entrantCount
#macro EVENT_RESULTS SAVE_FILE.activeEvent.eventResults

#macro ENTRY_FEES SAVE_FILE.prizePool.entryFees
#macro PAYOUT_TABLES SAVE_FILE.prizePool.payoutTable
#macro SETTINGS SAVE_FILE.settings
#macro TEE_DATA SAVE_FILE.courseList.estrella.teeMarker

#macro goldColor make_color_rgb(255,215,0)
#macro blueColor make_color_rgb(29,77,165)
#macro whiteColor c_white
#macro silverColor make_color_rgb(190,190,190)
#macro comboColor make_color_rgb(4,5,6)

#macro teamMemberMax 5
#macro teams_max 6

// colors
#macro appblue make_color_rgb(98,145,242)

function ini_save_file() {

	if file_exists(config_file) {
		
		CONFIGURATION_FILE = json_load_array(config_file);
		//return -1;
		}
	
	CONFIGURATION_FILE = create_default_save_file();
	debug_members_list_create();
	save_program;
	}
	
function create_default_save_file() {

	var config_data = {
		
		membersList: new ConfigurationMembersList(),
		activeEvent: new ActiveEvent(),	
		eventHistory: [],
		
		settings: new ConfigurationSettings(),
		courseList: new CourseList(),			
		prizePool: new PrizePool(),
			
		meta: new ConfigurationMeta(),
		}

	return config_data;
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

function Member(_name,_favorite=false) constructor {
	
	var parsedName = parse_name(_name);
	
	memberId = MEMBERS_LIST.nextMemberId;
	fullName = _name;
	firstName = parsedName.first;
	lastName = parsedName.last;
	
	favorite = _favorite;
	recent = -1;
	archived = false;
	
	handicapIndex = 54;
	teeColor = choose("white","gold","blue","silver","combo");
	
	entrantNumber = undefined;
	teamAssigned = undefined;
	
	roundStats = new RoundStats();
	eventWinnings = new EventWinnings();
	
	roundHistory = [];
	
	MEMBERS_LIST.nextMemberId++;
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
	
function parse_name(name) {
	
	var sepInd = string_pos(" ",name);
	var lastInd = string_length(name);
	
	var _first = string_copy(name,1,sepInd-1);
	var _last = string_copy(name,sepInd+1,lastInd);

	return {first: _first, last: _last};
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
	
function debug_members_list_create() {

	// reset member list
	last_entrant_number = 0;

	var list = [
	
		new Member("Ron Pogue",true),
		new Member("Gerry Young"),
		new Member("Frank Enns"),
		new Member("Clark Hall",true),
		new Member("Dave Sagan"),
		new Member("Pat Krommendyk",true),
		new Member("Ron Crawford"),
		new Member("Gene Lombardo",true),
		new Member("Rod Kaasa"),
		new Member("Steve Barrett"),
		new Member("Norm Shaw"),
		new Member("Fernando Compean"),
		new Member("Hall Wilson",true),
		new Member("Dick Newton",true),
		new Member("Brad Hentschel"),
		new Member("Wayne Macintosh"),
		new Member("Bill Jones"),
		new Member("Jorge Corral"),
		new Member("David Pratt"),
		new Member("Gerald Allen"),
		new Member("John Peppers"),
		new Member("Don Cummings"),
		new Member("Bob Wallace"),
		new Member("Jack Gilman"),
		new Member("Dave Temple"),
		new Member("Joe Oviatt"),
		new Member("Bill Schoen"),
		new Member("Greg Stratoti"),
		new Member("Brent Cunliffe"),
		new Member("Ron Ohmes"),
		new Member("Ron Vagle"),
		new Member("Giles P"),
		new Member("John Watson"),
		new Member("Jim Baillon",true),
		new Member("Dave Greiner"),
		new Member("Jim Middlemiss"),
		new Member("Ron VanVleet"),
		new Member("Ken Clarence"),
		new Member("Cliff duFresne",true),
		new Member("Dick McGuire",true),
		new Member("Bob Sanz",true)
		];
				
	list = scr_sort_members(list);

	MEMBERS_LIST.list = list;

	return list;
	}
