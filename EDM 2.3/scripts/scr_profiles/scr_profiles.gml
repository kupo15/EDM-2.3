function scr_profile_create(name,isoStr,logo,banner) {
/// @param [name
/// @param currencyInd]
	
if argument[0] == undefined
name = "";

if argument[1] == undefined
isoStr = "USD";

if argument[2] == undefined
logo = -1;

if argument[3] == undefined
banner = -1;

var ind = array_length(ROOT_data_struct.profiles);
var currency_struct = database_get_pointer(currency_array,isoStr,"isoCode");

var profileData = {
		
		venueID: ind,
		dispName: name,
		location: -1,
		currency: currency_struct,
		
		logoID: logo,
		bannerID: banner,
		
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
