/// @param date;
function funct_convert_date(argument0) {

	var date_num = argument0;
	var str_;

	switch date_num
		{
		case 0: str_ = "Jan"; break;
		case 1: str_ = "Feb"; break;
		case 2: str_ = "Mar"; break;
		case 3: str_ = "Apr"; break;
		case 4: str_ = "May"; break;
		case 5: str_ = "Jun"; break;
		case 6: str_ = "Jul"; break;
		case 7: str_ = "Aug"; break;
		case 8: str_ = "Sep"; break;
		case 9: str_ = "Oct"; break;
		case 10: str_ = "Nov"; break;
		case 11: str_ = "Dec"; break;
		}
	
	return str_;


}
