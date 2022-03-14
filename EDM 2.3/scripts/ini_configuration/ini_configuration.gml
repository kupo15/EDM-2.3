// file
#macro config_file "data.config"
#macro configversion "0.1"
#macro save_program save_save_file(false,true)
#macro save_settings save_save_file(true)
#macro save_members save_save_file(,,true)
#macro SAVE_FILE con_main.CONFIGURATION_FILE
#macro WORKING_SAVE_FILE con_main.WORKING_FILE

// structure
#macro MEMBERS_LIST SAVE_FILE.membersList
#macro TEAM_LIST SAVE_FILE.activeEvent.teams
#macro ENTRANT_COUNT SAVE_FILE.activeEvent.entrantCount
#macro FINAL_EVENT_RESULTS SAVE_FILE.activeEvent.eventResults
#macro EVENT_HISTORY SAVE_FILE.eventHistory

#macro ENTRY_FEES SAVE_FILE.prizePool.entryFees
#macro PAYOUT_TABLES SAVE_FILE.prizePool.payoutTable
#macro SETTINGS SAVE_FILE.settings

// course data
#macro COURSE_DATA SAVE_FILE.courseList[$ SETTINGS.courseName]
#macro TEE_DATA COURSE_DATA.teeMarker

// tees
#macro goldColor make_color_rgb(255,215,0)
#macro blueColor make_color_rgb(29,77,165)
#macro whiteColor c_white
#macro silverColor make_color_rgb(190,190,190)
#macro comboColor make_color_rgb(4,5,6)

// other
#macro GAME_TIME floor(current_time/1000*60)

// constants
#macro teamMemberMax 5
#macro teams_max 6
#macro mouseCanClickDist 5

#macro topScores 8
#macro handicapHistoryMax 20
#macro maxHCP 54
#macro Undefined "null"

// colors
#macro appblue make_color_rgb(98,145,242)

function save_save_file(settingSave=false,programSave=false,memberSave=false) {
	
	if programSave {
	
		json_save_array(config_file,SAVE_FILE);
		db("program saved");
		}
		
	if settingSave {
		
		with WORKING_SAVE_FILE {
			
			settings = SAVE_FILE.settings;
			courseList = SAVE_FILE.courseList;
			prizePool = SAVE_FILE.prizePool;
			}
		
		json_save_array(config_file,WORKING_SAVE_FILE);
		db("settings saved");
		}
		
	if memberSave {
		
		scr_save_member_changes();
		json_save_array(config_file,WORKING_SAVE_FILE);
		db("members saved");
		}
	}
	
function scr_save_member_changes() {
	
	var list = MEMBERS_LIST.list;
	for(var i=0;i<array_length(list);i++) {
		
		var memberStruct = list[i];
		var fullname = memberStruct.memberDetails.fullName;
		
		var working_list = WORKING_SAVE_FILE.membersList.list;
		for(var j=0;j<array_length(working_list);j++) {
			
			var workingMemberStruct = working_list[j];
			var workingFullName = workingMemberStruct.memberDetails.fullName;
			
			// save over member details
			if (fullname == workingFullName) {
				
				WORKING_SAVE_FILE.membersList.list[j].memberDetails = memberStruct.memberDetails;
				WORKING_SAVE_FILE.membersList.list[j].memberStats = memberStruct.memberStats;
				break;
				}
			}
		}
	}

function ini_save_file() {

	if file_exists(config_file) {
		
		CONFIGURATION_FILE = json_load_array(config_file);
		WORKING_FILE = deep_copy(SAVE_FILE);
		
		MEMBERS_LIST.list = scr_sort_members(MEMBERS_LIST.list);
		return -1;
		}
	
	CONFIGURATION_FILE = create_default_save_file();
	debug_members_list_create();
	save_program;
	}
	
function create_default_save_file() {

	var config_data = {
		
		settings: new ConfigurationSettings(),
		courseList: new CourseList(),

		membersList: new ConfigurationMembersList(),
		activeEvent: new ActiveEvent(),	
		eventHistory: [],
		
		prizePool: new PrizePool(),
			
		meta: new ConfigurationMeta(),
		}

	return config_data;
	}
				