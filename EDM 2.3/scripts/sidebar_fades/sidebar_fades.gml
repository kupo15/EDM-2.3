function sidebar_fades() {
	
var fade_spd = 0.14;

scr_sidebar_lerp(offsetScroll.navbarYoff,submenu != navbar.main,fade_spd); // navbar
scr_sidebar_lerp(offsetScroll.teebarYoff,submenu == navbar.teebar,fade_spd); // teebar
scr_sidebar_lerp(offsetScroll.coursebarYoff,submenu == navbar.coursebar,fade_spd); // coursebar
scr_sidebar_lerp(offsetScroll.roundtypeYoff,submenu == navbar.roundtype,0.2); // roundtype
scr_sidebar_lerp(offsetScroll.entryYoff,submenu == navbar.popupEntry,fade_spd); // entry
scr_sidebar_lerp(offsetScroll.scoreSortUnderline,META_data.scoreSort,0.5); // underline
scr_sidebar_lerp(offsetScroll.courseSortUnderline,META_data.courseSort,0.5); // underline
scr_sidebar_lerp(offsetScroll.numpadYoff,submenu == navbar.numpad,1); // numpad

var sidebar_condition = (submenu == navbar.sidebar) || (submenu == navbar.profileChange);
scr_sidebar_lerp(offsetScroll.sidebarXoff,sidebar_condition,SIDEBAR_LERP); // sidebar position


// alpha
if alpha_lerp != alpha_lerp_end
alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,fade_spd);


// header delete
headerDeleteOffset = mode_delete;

if headerDeleteOffset != headerDeleteOffsetDisp
headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
	
}

function scr_sidebar_lerp(ind,condition,lerp_spd) {
	
offsetArrayEnd[ind] = condition;	
	
if offsetArray[ind] != offsetArrayEnd[ind]
offsetArray[ind] = lerp(offsetArray[ind],offsetArrayEnd[ind],lerp_spd);	
}
