function scr_json_version_transition(version) {

switch version
	{
	case undefined: json_conversion_missing(); break;
	}
	
}

function json_conversion_missing() {

root_data_create();	
db("file missing > root data create");
}