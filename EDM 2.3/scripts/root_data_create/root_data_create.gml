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
		memberIdGenerator: 0,
		},
	}
	
// add lists
MEMBER_database = debug_data_members_list();	
}


function debug_data_members_list() {
// debug

var arr = [];
scr_member_create_database("Ron","Pogue",arr);
scr_member_create_database("Gerry","Young",arr);
scr_member_create_database("Frank","Enns",arr);
scr_member_create_database("Clark","Hall",arr);
scr_member_create_database("Dave","Sagan",arr);
scr_member_create_database("Pat","Krommendyk",arr);
scr_member_create_database("Ron","Crawford",arr);
scr_member_create_database("Gene","Lombardo",arr);
scr_member_create_database("Rod","Kaasa",arr);
scr_member_create_database("Steve","Barrett",arr);
scr_member_create_database("Norm","Shaw",arr);
scr_member_create_database("Fernando","Compean",arr);
scr_member_create_database("Hall","Wilson",arr);
scr_member_create_database("Dick","Newton",arr);
scr_member_create_database("Brad","Hentschel",arr);
scr_member_create_database("Wayne","Macintosh",arr);
scr_member_create_database("Bill","Jones",arr);
scr_member_create_database("Jorge","Corral",arr);
scr_member_create_database("David","Pratt",arr);
scr_member_create_database("Gerald","Allen",arr);
scr_member_create_database("John","Peppers",arr);
scr_member_create_database("Don","Cummings",arr);
scr_member_create_database("Bob","Wallace",arr);
scr_member_create_database("Jack","Gilman",arr);
scr_member_create_database("Dave","Temple",arr);
scr_member_create_database("Joe","Oviatt",arr);
scr_member_create_database("Bill","Schoen",arr);
scr_member_create_database("Greg","Stratoti",arr);
scr_member_create_database("Brent","Cunliffe",arr);
scr_member_create_database("Ron","Ohmes",arr);
scr_member_create_database("Ron","Vagle",arr);
scr_member_create_database("Giles","P",arr);
scr_member_create_database("John","Watson",arr);
scr_member_create_database("Jim","Baillon",arr);
scr_member_create_database("Dave","Greiner",arr);
scr_member_create_database("Jim","Middlemiss",arr);
scr_member_create_database("Ron","VanVleet",arr);
scr_member_create_database("Ken","Clarence",arr);
scr_member_create_database("Cliff","duFresne",arr);
scr_member_create_database("Dick","McGuire",arr);
scr_member_create_database("Bob","Sanz",arr);

db(string(array_length(arr))+" members created");
return arr;
}