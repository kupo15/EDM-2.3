function scr_profile_create(name,currencyInd) {
/// @param [name
/// @param currencyInd]
	
if argument[0] == undefined
name = "";

if argument[1] == undefined
currencyInd = -1;

var profileData = {
		
		dispName: name,
		location: -1,
		currencyId: -1,
		
		logoId: -1,
		bannerId: -1,
		
		memberlist: [],
		}
	
array_push(ROOT_data_struct.profiles,profileData);

return profileData;
}

function scr_profile_set(ind) {
/// @param index

activeProfile = ind;
META_data.profileIndex = activeProfile; // save profile index to startup
	
// set local lists
memberslist_array = MEMBER_list;
}
