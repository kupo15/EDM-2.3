#macro config_file "data.config"
#macro configversion "0.1"
#macro SAVE_FILE con_main.CONFIGURATION_FILE

// structure
#macro MEMBERS_LIST SAVE_FILE.membersList
#macro TEAM_LIST SAVE_FILE.activeEvent.teams
#macro ENTRANT_COUNT SAVE_FILE.activeEvent.entrantCount
#macro PAYOUT_TABLES SAVE_FILE.prizePool.payoutTable

function ini_save_file() {

	if file_exists(config_file) {
		
		CONFIGURATION_FILE = json_load_array(config_file);
		//return -1;
		}
	
	CONFIGURATION_FILE = create_default_save_file(config_file);
	}
	
function create_default_save_file(filename) {

	//var membersResult = debug_members_list_create();

	var config_data = {
		
		membersList: {
			
			//favorites: deep_copy(membersResult.favorites),
			//nonFavorites: deep_copy(membersResult.nonFavorite),
			list: debug_members_list_create(),
			archived: [],
			},
			
		activeEvent: {
			
			entrantCount: 0,
			
			teams: [
			
				new Team(),
				new Team(),
				new Team(),
				new Team(),
				new Team(),
				new Team(),
				],
			},
			
		settings: {
			
			soundOn: true,
			closeEnough: true,
			},
			
		prizePool: new PrizePool(),
			
		eventHistory: [],
			
		meta: {
			
			version: configversion,
			}
		}
				
	json_save_array(filename,config_data);
	
	return config_data;
	}
	
function Team() constructor {
	
	members = [];
	teamScore = undefined;
	}
	
function PrizePool() constructor {
			
	entryFees = {
				
		teamEntry: 30,
		lowNetEntry: 30,
		skinsEntry: 20,
		blindEntry: 30,
		}
			
	payoutTable = new PayoutTables();
	}

function Member(_name,_favorite=false) constructor {
	
	name = _name;
	favorite = _favorite;
	recent = -1;
	archived = false;
	handicap = 54;
	teeColor = "white";
	teamAssigned = undefined;
	
	roundHistory = [];
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

	return list;
	}
