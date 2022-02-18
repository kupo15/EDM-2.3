enum entryType {
	
	none,
	teamEntry,
	lowNetEntry,
	skinsEntry,
	blindFee,
	teamPayout,
	lowNetPayout,
	
	memberFront,
	memberBack,
	memberAdjGross,
	memberEntryNext,
	
	teamFront,
	teamBack,
	teamReview,
	teamNext,
	}

function submit_entry(deactivate=false) {

	active = !deactivate;
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
		
		var reset = true;
		var entry = obj_number_input.submitedString;		
		switch global.entryEnum
			{
			case entryType.teamEntry: ENTRY_FEES.teamEntry = entry; break;
			case entryType.lowNetEntry: ENTRY_FEES.lowNetEntry= entry; break;
			case entryType.skinsEntry: ENTRY_FEES.skinsEntry = entry; break;
			case entryType.blindFee: ENTRY_FEES.blindFee = entry; break;
			case entryType.teamPayout: PAYOUT_TABLES.teamPayout[pref_team_num][settings_clicked_index] = entry; break;
			case entryType.lowNetPayout: PAYOUT_TABLES.lowNetPayout[pref_low_net_num][settings_clicked_index] = entry; break;
			
			case entryType.memberFront:
			case entryType.memberBack:
			case entryType.memberAdjGross:
			case entryType.memberEntryNext: entry_scores_individual_submit(entry); 
										    reset = false; 
										    break;
			}    			
			
		// reset after applying
		obj_number_input.submitedString = undefined;
		
		if reset
		global.entryEnum = entryType.none;
		}
	}