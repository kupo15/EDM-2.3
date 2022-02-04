/// @description  scr_remove_from_team(name,team_num,pos);
/// @param name
/// @param team_num
/// @param pos
function scr_remove_from_team(argument0, argument1, argument2) {

	var ind = argument0;
	var _team = argument1;
	var pos = argument2;

	var fav = false;
	for(var ff=0;ff<ds_list_size(recent_list);ff++) // loop through favorites list
	if recent_list[| ff] == ind
	    {
	    fav = true; // found on favorites list
	    break;
	    }

	if fav // put back on favorites list
	    {
	    ds_list_insert(member_list,last_entrant_number,ind);
	    last_entrant_number ++;
	    }
	else // add to members list
	ds_list_insert(member_list,last_entrant_number,ind); // insert to top of member list below recent
    
	ds_list_delete(team_list[_team],pos); // delete from team list
	ds_list_delete(entrant_list,pos); // delete from entrant list
	//ds_list_delete(recent_list,pos); // delete from recent list
	}
