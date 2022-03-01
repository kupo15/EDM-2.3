function debug_generate_round_history(arr) {

	var historyStruct = debug_round_history();

	// create the history
	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var memberDetails = memberStruct.memberDetails;
		var lastName = string_lower(memberDetails.lastName);
		
		if (historyStruct[$ lastName] == undefined)
		continue;
		
		memberStruct.roundHistory = debug_create_score_history(memberStruct,historyStruct[$ lastName]);
		}
		
	// decide which scores are included
	for(var i=0;i<array_length(arr);i++) {
		
		var memberStruct = arr[i];
		var memberDetails = memberStruct.memberDetails;
		
		memberDetails.handicapIndex = calculate_member_handicap_index(memberStruct);
		}
	}

function debug_create_score_history(memberStruct,scoreArray) {
	
	var historyArr = [];
	var date = date_create_datetime(2022,2,24,0,0,0);
	
	for(var i=0;i<array_length(scoreArray);i++) {
		
		var teeCol = memberStruct.memberDetails.teeColor;
		var teeData = TEE_DATA[$ teeCol];
		var eventScore = new RoundHistory(teeData,scoreArray[i],date);
		
		array_push(historyArr,eventScore);
		
		var dayIsThurs = date_get_day(date);
		var inc = pick(-2,-3,dayIsThurs);
		
		date = date_inc_day(date,inc);
		}
		
	return historyArr;
	}

function debug_round_history() {
	
	var history = {
		
		stratoti: [79,86,84,77,83,81,80,85,84,83,76,81,83,81,84,82,78,81,76,85],
		baillon: [94,98,91,90,90,93,90,91,88,91,82,97,92,91,100,98,92,86,92,89],
		barrett: [90,85,85,88,94,88,91,84,91,84,88,86,85,85,88,93,89,89,95,87],
		clarence: [104,103,102,105,103,102,108,108,103,99,101,103,99,102,100,104,100,109,103,98],
		cunliffe: [89,85,85,90,80,86,90,91,90,93,92,84,85,92,87,87,92,82,93,92],
		compean: [95,99,92,95,100,94,94,101,98,96,99,93,96,99,96,95,88,96,97,95],
		dufresne: [84,96,88,87,102,92,88,87,94,90,87,90,84,85,90,85,82,88,76,90],
		enns: [74,76,79,78,73,76,76,79,74,75,79,78,75,73,78,75,73,73,75,72],
		greiner: [95,96,101,102,95,94,90,104,101,94,98,98,96,96,94,94,91,101,97,99],
		hall: [84,78,87,81,80,86,82,81,81,80,85,82,91,80,87,85,82,83,88 ,83],
		kaasa: [76,76,81,76,76,78,78,76,80,74,77,79,77,83,82,78,83,75,80,82],
		krommendyk: [94,99,89,98,97,94,92,96,90,95,96,94,98,102,95,89,94,96,99,94],
		kent: [90,84,90,88,83,91,85,92,89,95,89,92,93,89,91,82,83,113,115,110],
		lombardo: [97,96,94,90,98,93,96,99,94,100,98,92,94,95,97,109,94,90,97,89],
		mcguire: [87,85,88,88,89,87,78,82,83,88,87,87,86,90,92,94,86,83,90,92],
		newton: [91,99,94,86,94,95,98,98,97,108,96,97,95,93,95,88,90,95,97,96],
		oviatt: [83,84,82,83,83,85,82,81,83,84,87,79,81,81,77,78,90,83,82,81],
		paradis: [85,86,83,89,79,86,87,81,88,86,89,82,81,84,86,86,92,86,83,92],
		pogue: [97,95,91,87,86,89,90,82,88,85,82,83,87,92,90,94,90,86,82,93],
		sagan: [79,79,74,75,76,78,85,79,78,79,75,81,77,75,73,77,76,75,81,73],
		sanz: [85,94,82,87,85,85,80,86,84,84,81,86,91,81,84,85,81,86,88,84],
		schoen: [93,92,94,87,88,96,94,96,87,93,93,91,88,89,90,87,91,90,93,87],
		stenhouse: [93,90,86,83,86,86,87,91,94,96,94,90,92,90,96,91,85,91,91,91],
		temple: [85,87,81,91,96,89,92,86,88,88,92,85,86,94,84,88,87,87,86,94],
		vanvleet: [92,88,79,94,84,89,84,82,89,92,90,84,77,75,90,84,87,81,89,87],
		watson: [93,91,89,89,91,94,92,87,78,87,86,85,85,87,84,86,89,84,86,85],
		wilson: [82,83,86,97,84,90,84,91,93,86,92,90,90,98,88,89,87,85,91,97],
		young: [93,99,86,90,87,89,93,96,93,93,85,94,95,90,88,93,95,88,84,87],
		}
		
	return history;
	}
