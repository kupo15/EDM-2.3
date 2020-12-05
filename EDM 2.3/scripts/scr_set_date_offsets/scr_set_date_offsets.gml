/// @param date
function scr_set_date_offsets(date) {

var month = date_get_month(date);
var day = date_get_day(date);
var year = date_get_year(date);

// set scrolling variables
dayParse = day;
monthParse = month;
yearParse = year;

// set selected date
dateSelectDay = day;
dateSelectMonth = month;
dateSelectYear = year;

// set 3 column day variables
dayOffset = day;
dayOffsetStart = day;
dayOffsetEnd = day;

var day_span = date_day_span(start_date,date);
daySelectSpan = round(day_span); // update day span from the 1/1/1970

// set 3 column calendar variables
year_offset = year;
year_offset_start = year;
year_offset_end = year;
	
var month_span = date_month_span(start_date,date);
var month = floor(month_span);

monthOffset = month;
monthOffsetStart = month;
monthOffsetEnd = month;

var scrollbar_index = offsetScroll.calendarOffset;
offsetArray[scrollbar_index] = month;
offsetArrayStart[scrollbar_index] = month;
offsetArrayEnd[scrollbar_index] = month;

calendarDateEntry = undefined;
screenDarkenIndex = darkenIndex.calendar;
}
