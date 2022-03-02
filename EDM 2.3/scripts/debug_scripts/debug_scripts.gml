function debug_members_list_create() {

	// reset member list
	last_entrant_number = 0;

	var list = [
	
		new Member("Duane Kent"),
		new Member("Bob Stenhouse"),
		new Member("Ron Pogue",,true),
		new Member("Gerry Young"),
		new Member("Frank Enns","white"),
		new Member("Clark Hall",,true),
		new Member("Dave Sagan","white"),
		new Member("Pat Krommendyk",,true),
		new Member("Gene Lombardo",,true),
		new Member("Rod Kaasa","white"),
		]
		/*
		new Member("Steve Barrett"),
		new Member("Fernando Compean"),
		new Member("Hall Wilson",,true),
		new Member("Dick Newton",,true),
		new Member("Dave Temple"),
		new Member("Joe Oviatt"),
		new Member("Bill Schoen"),
		new Member("Greg Stratoti","white"),
		new Member("Brent Cunliffe"),
		new Member("Giles Paradis"),
		new Member("John Watson"),
		new Member("Jim Baillon",,true),
		new Member("Dave Greiner"),
		new Member("Ron VanVleet","white"),
		new Member("Ken Clarence"),
		new Member("Cliff DuFresne",,true),
		new Member("Dick McGuire",,true),
		new Member("Bob Sanz",,true)
		]
		//*/

	list = scr_sort_members(list);
	
	debug_generate_round_history(list);
	MEMBERS_LIST.list = list;

	return list;
	}