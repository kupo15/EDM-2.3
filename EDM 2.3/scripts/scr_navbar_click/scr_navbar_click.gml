/// @param index
function scr_navbar_click(ind) {

// switch screens
screen_change(ind,undefined,true);

switch ind
	{
	// home
	case screen.home: submenu = navbar.main;
					  scr_handicap_calculate();
					  break;
						  
	// playing
	case screen.playing: scr_playing_course_set(); break;
				
	// stats screen
	case screen.stats: scr_stats_set(); break;							   
			
	// trends
	case screen.indexTrend: scr_trend_set(); break;
	
	// card
	case screen.score_card: submenu = navbar.hidden; break;
						 
	// settings
	//case screen.settings: break;
	}


}
