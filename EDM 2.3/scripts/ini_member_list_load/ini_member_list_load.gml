#macro config_file "data.config"
#macro configversion "0.1"
#macro SAVE_FILE con_main.CONFIGURATION_FILE
#macro MEMBERS_LIST SAVE_FILE.membersList

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
			
		meta: {
			
			version: configversion,
			}
		}
			
	json_save_array(filename,config_data);
	
	return config_data;
	}

function ini_member_list_load() {
	
	ini_open("member_list.ini");
	var open = ini_read_string("members","all",""); // open members list
	ds_list_read(member_list_save,open); // load members list

	var open = ini_read_string("members","recent","");  // open last entrants
	ds_list_read(recent_list,open); // load last entrants list

	var open = ini_read_string("members","favorites","");  // open last entrants
	ds_list_read(favorites_list,open); // load last entrants list
	ini_close();

	// sort lists
	ds_list_sort(member_list_save,true);
	ds_list_sort(recent_list,true);
	//ds_list_sort(favorites_list,false);

	//ds_list_copy(member_list_save,member_list);
	//ds_list_copy(favorites_members_list,favorites_list);

	ds_list_clear(member_list);

	// add favorites to member list
	var size = ds_list_size(recent_list);
	last_entrant_number = size; // set number of entrants from last time

	// loop through favorites list
	for(var i=0;i<size;i++)
	    {
	    var entr = recent_list[| i]; // find name on entrant list
	    ds_list_add(member_list,entr); // insert in beginning of master list
	    }
    
	var size = ds_list_size(member_list_save);
	// loop through member list
	for(var i=0;i<size;i++)
	    {
	    var entr = member_list_save[| i]; // find name on entrant list
	    ds_list_add(member_list,entr); // add to end of master list
	    }
    
	//ds_list_sort(recent_list,true);    

	//ds_list_clear(entrant_list); // clear the entrant list
	}
	
function Member(_name,_favorite=false) constructor {
	
	name = _name;
	favorite = _favorite;
	recent = false;
	archived = false;
	handicap = 54;
	teeColor = "white";
	
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
