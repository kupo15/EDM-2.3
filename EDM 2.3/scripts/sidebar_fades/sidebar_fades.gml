function sidebar_fades() {
	
var fade_spd = 0.14;

// xpos
var sidebar_condition = (submenu == navbar.sidebar) || (submenu == navbar.profileChange);
scr_sidebar_lerp(offsetScroll.sidebarXoff,sidebar_condition,SIDEBAR_LERP); // sidebar position

// ypos
scr_sidebar_lerp(offsetScroll.navbarYoff,submenu != navbar.main,fade_spd); // navbar
scr_sidebar_lerp(offsetScroll.entryYoff,submenu == navbar.popupEntry,fade_spd); // entry
scr_sidebar_lerp(offsetScroll.numpadYoff,submenu == navbar.numpad,1); // numpad

// underlines
scr_sidebar_lerp(offsetScroll.memberSortUnderline,META_data.memberSort,0.5,false); // underline
scr_sidebar_lerp(offsetScroll.memberProfileUnderline,subheader_member,0.5,false); // underline

// darken screen
var condition = (submenu == navbar.sidebar) || (submenu == navbar.profileChange)
scr_sidebar_lerp(offsetScroll.sidebarDarken,condition,SIDEBAR_LERP); // sidebar darken screen


// alpha
if alpha_lerp != alpha_lerp_end
alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,fade_spd);


// header delete
headerDeleteOffset = mode_delete;

if headerDeleteOffset != headerDeleteOffsetDisp
headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
	
}

function scr_sidebar_lerp(ind,condition,lerp_spd,do_clamp) {
/// @param ind
/// @param condition
/// @param lerp_spd
/// @param [do_clamp]

var extra = 0.005*pick(1,-1,condition==0);	
	
offsetArrayEnd[ind] = condition+extra;	

if offsetArray[ind] != offsetArrayEnd[ind]
offsetArray[ind] = lerp(offsetArray[ind],offsetArrayEnd[ind],lerp_spd);

if argument[3] != false
offsetArray[ind] = clamp(offsetArray[ind],0,1);
}

function fade_offset_set(offset,pos) {
	
return floor(offset*pos);
}