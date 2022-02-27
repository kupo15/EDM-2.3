// file
#macro config_file "data.config"
#macro configversion "0.1"
#macro save_program json_save_array(config_file,SAVE_FILE)
#macro SAVE_FILE con_main.CONFIGURATION_FILE

// structure
#macro MEMBERS_LIST SAVE_FILE.membersList
#macro TEAM_LIST SAVE_FILE.activeEvent.teams
#macro ENTRANT_COUNT SAVE_FILE.activeEvent.entrantCount
#macro FINAL_EVENT_RESULTS SAVE_FILE.activeEvent.eventResults

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

// constants
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
				