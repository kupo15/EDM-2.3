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
	
	seasonEarnings,
	handicapOverride,
	
	teamFront,
	teamBack,
	teamReview,
	teamNext,
	}

function submit_entry(deactivate=false) {

	with obj_number_input {
		
		active = !deactivate;
		submitedString = entryString;
		}
	}
	
function negate_entry() {
	
	var convert = real(entryString);
	entryString = string(convert*-1);
	negate = !negate;
	}
	
function select_input_entry(str) {
	
	if overwriteEntry
	entryString = "";
	
	append_character(str);
	}
	
function append_decimal() {
	
	if (string_pos(".",entryString) > 0) || (string_length(entryString) > 2)
	exit;
	
	entryString += ".";
	}
	
function append_character(str) {
		
	var str_ll = string_length(entryString);
	
	var max_length = pick(maxCharacters,3,global.entryEnum==entryType.handicapOverride);
	
	if (str_ll >= max_length)
	exit;
	
	var neg = pick(1,-1,negate);
	var convert = real(entryString+str);
	
	convert = abs(convert)*neg;

	var dec_pos = string_pos(".",string(convert));

	overwriteEntry = false;
	
	if (dec_pos != 0)
	entryString = string_format(convert,dec_pos-1,1);
	else
	entryString = string(convert);
	}
	
function delete_character() {
	
	var str_ll = string_length(entryString);

	if (str_ll > 0)
	entryString = string_delete(entryString,str_ll,1);
	}
	
function string_add(strNum1,strNum2) {
	
	var total = real(strNum1)+real(strNum2);
	return string(total);
	}

function retrieve_keypad() {
				
	// if submitted entry
	if (obj_number_input.submitedString != undefined) {
		
		var reset = true;
		var entry = obj_number_input.submitedString;
		switch global.entryEnum
			{
			case entryType.teamEntry: ENTRY_FEES.teamEntry = entry; break;
			case entryType.lowNetEntry: ENTRY_FEES.lowNetEntry = entry; break;
			case entryType.skinsEntry: ENTRY_FEES.skinsEntry = entry; break;
			case entryType.blindFee: ENTRY_FEES.blindFee = entry; break;
			
			case entryType.teamPayout: reset = entry_payouts_submit(PAYOUT_TABLES.teamPayout[pref_team_num],settings_clicked_index,entry); break;
			case entryType.lowNetPayout: reset = entry_payouts_submit(PAYOUT_TABLES.lowNetPayout[pref_low_net_num],settings_clicked_index,entry); break;
			
			case entryType.teamFront:
			case entryType.teamBack: entry_scores_team_submit(entry);
									 reset = false;
									 break;
									 
			case entryType.handicapOverride: handicap_override_submit(entry); break;								
			case entryType.seasonEarnings: entry_season_earnings_submit(entry); break;								
			
			case entryType.memberFront:
			case entryType.memberBack:
			case entryType.memberAdjGross:
			case entryType.memberEntryNext: entry_scores_individual_submit(entry); 
										    reset = false; 
										    break;
			}    			
			
		// reset after applying
		obj_number_input.submitedString = undefined;
		entryIndex = undefined;
		
		if reset
		global.entryEnum = entryType.none;
		}
	}
	
function handicap_override_submit(entry) {

	var memberStruct = entrant_list[obj_number_input.entryIndex];
	var memberDetails = memberStruct.memberDetails;
	
	memberDetails.handicapIndex = clamp(entry,-20,maxHCP);
	obj_number_input.active = false;
	}
	
function entry_season_earnings_submit(entry) {
	
	var memberStruct = MEMBERS_LIST.list[obj_number_input.entryIndex];
	var memberStats = memberStruct.memberStats;
	
	memberStats.seasonEarnings = real(entry);
	memberStats.seasonEarningsPrev = real(entry);
	
	obj_number_input.active = false;
	}
	
function entry_payouts_submit(arr,ind,entry) {
	
	arr[@ ind] = entry;
	
	ind++;
	
	if (ind == array_length(arr)) {
		
		settings_clicked_index = undefined;
		obj_number_input.active = false;
		return true;
		}
		
	settings_clicked_index = ind;
    keypad_set_value(global.entryEnum,arr[ind]);
	
	return false;
	}