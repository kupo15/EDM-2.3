
function currency_index_create(index,name,symbol) {
	
currency_name[index] = name;
currency_symbol[index] = symbol;	
}

function ini_currency_symbols() {
	
currency_index_create(currencySymbol.dollar,"USD","$");
currency_index_create(currencySymbol.euro,"EUR","E");
currency_index_create(currencySymbol.peso,"MXN","P");
	

}