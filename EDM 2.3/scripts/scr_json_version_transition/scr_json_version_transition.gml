function scr_json_version_transition(version) {

switch version
	{
	default: json_conversion_missing(version); break;
	}
	
}

function json_conversion_missing(version) {
db("file missing > root data create");

if json_version < 1.0
debug_data_reset();
else
	{
	root_data_create();	
	scr_profile_create("Name");
	scr_profile_set(0);
	}
}