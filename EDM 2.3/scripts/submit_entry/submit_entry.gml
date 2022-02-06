function submit_entry() {

	active = false;
	submitedString = entryString;
	}
	
function negate_entry() {
	
	var convert = real(entryString);
	entryString = string(convert*-1);
	}
	
function append_character(str) {
	
	var str_ll = string_length(entryString);
	
	if (str_ll >= maxCharacters)
	exit;

	entryString += str;
	}
	
function delete_character() {
	
	var str_ll = string_length(entryString);

	if (str_ll > 0)
	entryString = string_delete(entryString,str_ll,1);
	}
	
function retrieve_keypad() {
				
	// if submitted entry
	if (obj_number_input.submitedString != undefined) {
		
		var entry = obj_number_input.submitedString;		
		switch global.entryEnum
			{
			case entryType.teamEntryFee: break;
			case entryType.lowNetEntryFee: break;
			case entryType.skinsEntryFee: break;
			case entryType.blindFee: break;
			case entryType.teamPayout: PAYOUT_TABLES.teamPayout[pref_team_num][settings_clicked_index] = entry; break;
			case entryType.lowNetPayout: team_pay_table[pref_team_num,settings_clicked_index] = entry; break;			
			}    
			
		// reset after applying
		obj_number_input.submitedString = undefined;
		global.entryEnum = entryType.none;
		}
	}