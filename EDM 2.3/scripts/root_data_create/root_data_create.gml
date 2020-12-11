function root_data_create() {
	
activeProfile = 0;
memberId_generator = 0;
		
memberlist_array = array_create(0); // local courses added

ROOT_data_struct = {
	
	memberDatabase: -1,
		
	profiles: [],
	eventHistory: [],
	
	meta: {
		profileIndex: 0,
		memberSort: member_sort.abc,
		version: json_version,
		memberIdGenerator: -1,
		},
	}
	
// add venues
scr_profile_create("Estrella Del Mar",currencySymbol.peso,spr_estrella_logo,spr_estrella_banner);
//scr_profile_create("River");
//scr_profile_create("Test");
//scr_profile_create("Yes");	

// add lists
MEMBER_database = debug_data_members_list();	
}


function debug_data_members_list() {
// debug

var group_id = [0];
var arr = [];
scr_member_create_database("Jim","Baillon",arr,group_id);
scr_member_create_database("Greg","Stratoti",arr,group_id);
scr_member_create_database("Ron","Pogue",arr,group_id);
scr_member_create_database("Gerry","Young",arr,group_id);
scr_member_create_database("Frank","Enns",arr,group_id);
scr_member_create_database("Clark","Hall",arr,group_id);
scr_member_create_database("Dave","Sagan",arr,group_id);
scr_member_create_database("Pat","Krommendyk",arr,group_id);
scr_member_create_database("Ron","Crawford",arr,group_id);
scr_member_create_database("Gene","Lombardo",arr,group_id);
scr_member_create_database("Rod","Kaasa",arr,group_id);
scr_member_create_database("Steve","Barrett",arr,group_id);
scr_member_create_database("Norm","Shaw",arr,group_id);
scr_member_create_database("Fernando","Compean",arr,group_id);
scr_member_create_database("Hall","Wilson",arr,group_id);
scr_member_create_database("Dick","Newton",arr,group_id);
scr_member_create_database("Brad","Hentschel",arr,group_id);
scr_member_create_database("Wayne","Macintosh",arr,group_id);
scr_member_create_database("Bill","Jones",arr,group_id);
scr_member_create_database("Jorge","Corral",arr,group_id);
scr_member_create_database("David","Pratt",arr,group_id);
scr_member_create_database("Gerald","Allen",arr,group_id);
scr_member_create_database("John","Peppers",arr,group_id);
scr_member_create_database("Don","Cummings",arr,group_id);
scr_member_create_database("Bob","Wallace",arr,group_id);
scr_member_create_database("Jack","Gilman",arr,group_id);
scr_member_create_database("Dave","Temple",arr,group_id);
scr_member_create_database("Joe","Oviatt",arr,group_id);
scr_member_create_database("Bill","Schoen",arr,group_id);
scr_member_create_database("Brent","Cunliffe",arr,group_id);
scr_member_create_database("Ron","Ohmes",arr,group_id);
scr_member_create_database("Ron","Vagle",arr,group_id);
scr_member_create_database("Giles","P",arr,group_id);
scr_member_create_database("John","Watson",arr,group_id);
scr_member_create_database("Dave","Greiner",arr,group_id);
scr_member_create_database("Jim","Middlemiss",arr,group_id);
scr_member_create_database("Ron","VanVleet",arr,group_id);
scr_member_create_database("Ken","Clarence",arr,group_id);
scr_member_create_database("Cliff","duFresne",arr,group_id);
scr_member_create_database("Dick","McGuire",arr,group_id);
scr_member_create_database("Bob","Sanz",arr,group_id);

db(string(array_length(arr))+" members created");
return arr;
}