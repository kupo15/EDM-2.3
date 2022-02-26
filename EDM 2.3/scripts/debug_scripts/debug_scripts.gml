function debug_members_list_create() {

	// reset member list
	last_entrant_number = 0;

	var list = [
	
		new Member("Ron Pogue",,true),
		new Member("Gerry Young"),
		new Member("Frank Enns"),
		new Member("Clark Hall",,true),
		new Member("Dave Sagan"),
		new Member("Pat Krommendyk",,true),
		new Member("Ron Crawford"),
		new Member("Gene Lombardo",,true),
		new Member("Rod Kaasa"),
		new Member("Steve Barrett"),
		new Member("Norm Shaw"),
		new Member("Fernando Compean"),
		new Member("Hall Wilson",,true),
		new Member("Dick Newton",,true),
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
		new Member("Jim Baillon",,true),
		new Member("Dave Greiner"),
		new Member("Jim Middlemiss"),
		new Member("Ron VanVleet"),
		new Member("Ken Clarence"),
		new Member("Cliff duFresne",,true),
		new Member("Dick McGuire",,true),
		new Member("Bob Sanz",,true)
		];
		
		cs(js(list[0]))

	list = scr_sort_members(list);

	MEMBERS_LIST.list = list;

	return list;
	}