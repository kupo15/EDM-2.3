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

	if !keyboard_check(vk_control)
	exit;

	// reset member list
	last_entrant_number = 0;
	ds_list_clear(member_list);

	/*
	ds_list_add(member_list,"Ron Pogue");
	ds_list_add(member_list,"Gerry Young");
	ds_list_add(member_list,"Frank Enns");
	ds_list_add(member_list,"Clark Hall");
	ds_list_add(member_list,"Dave Sagan");
	ds_list_add(member_list,"Pat Krommendyk");
	ds_list_add(member_list,"Ron Crawford");
	ds_list_add(member_list,"Gene Lombardo");
	ds_list_add(member_list,"Rod Kaasa");
	ds_list_add(member_list,"Steve Barrett");
	ds_list_add(member_list,"Norm Shaw");
	ds_list_add(member_list,"Fernando Compean");
	ds_list_add(member_list,"Hall Wilson");
	ds_list_add(member_list,"Dick Newton");
	ds_list_add(member_list,"Brad Hentschel");
	ds_list_add(member_list,"Wayne Macintosh");
	ds_list_add(member_list,"Bill Jones");
	ds_list_add(member_list,"Jorge Corral");
	ds_list_add(member_list,"David Pratt");
	ds_list_add(member_list,"Gerald Allen");
	ds_list_add(member_list,"John Peppers");
	ds_list_add(member_list,"Don Cummings");
	ds_list_add(member_list,"Bob Wallace");
	ds_list_add(member_list,"Jack Gilman");
	ds_list_add(member_list,"Dave Temple");
	ds_list_add(member_list,"Joe Oviatt");
	ds_list_add(member_list,"Bill Schoen");
	ds_list_add(member_list,"Greg Stratoti");
	ds_list_add(member_list,"Brent Cunliffe");
	ds_list_add(member_list,"Ron Ohmes");
	ds_list_add(member_list,"Ron Vagle");
	ds_list_add(member_list,"Giles P");
	ds_list_add(member_list,"John Watson");
	ds_list_add(member_list,"Jim Baillon");
	ds_list_add(member_list,"Dave Greiner");
	ds_list_add(member_list,"Jim Middlemiss");
	ds_list_add(member_list,"Ron VanVleet");
	ds_list_add(member_list,"Ken Clarence");
	ds_list_add(member_list,"Cliff duFresne");
	ds_list_add(member_list,"Dick McGuire");
	ds_list_add(member_list,"Bob Sanz");

	ds_list_sort(member_list,true);

	ds_list_clear(recent_list);
	ds_list_clear(member_list_save);
	ds_list_copy(member_list_save,member_list);





/* end ini_member_list_load */
}
