/// @description  scr_blinds_remove(name,blind_team)
/// @param name
/// @param blind_team
function scr_blinds_remove(argument0, argument1) {

	var name = argument0;
	var team_ = argument1;

	if team_ == noone
	exit;

	var list_ = blind_list[team_];
	var b_size = ds_list_size(list_);
	var b_pos = ds_list_find_index(list_,name);
	ds_list_delete(list_,b_pos);




}
