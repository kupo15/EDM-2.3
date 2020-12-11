
function currency_index_create(name,iso) {
	
var currency_data = {
	
	dispName: name,
	isoCode: iso,
	}
	
array_push(currency_array,currency_data);
}

function ini_currency_symbols() {
	
currency_array = [];	
	
currency_index_create("United States dollar","USD");
currency_index_create("Euro","EUR");
currency_index_create("Mexican peso","MXN");

array_sort_nested_struct(currency_array,"isoCode",true); // sort ascending
}