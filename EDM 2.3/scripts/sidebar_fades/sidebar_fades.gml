function sidebar_fades() {
var fade_spd = 0.14;
	
// navbar
navbar_yoff = (submenu != navbar.main); // ? navbar_yoff = false : navbar_yoff = true

if navbar_yoff != navbar_yoff_start
navbar_yoff_start = lerp(navbar_yoff_start,navbar_yoff,fade_spd);

// teebar
teebar_yoff = (submenu == navbar.teebar); // ? teebar_yoff = true : teebar_yoff = false

if teebar_yoff != teebar_yoff_start
teebar_yoff_start = lerp(teebar_yoff_start,teebar_yoff,fade_spd);

// parbar
parbar_yoff = (submenu == navbar.parbar); // ? parbar_yoff = true : parbar_yoff = false

if parbar_yoff != parbar_yoff_start
parbar_yoff_start = lerp(parbar_yoff_start,parbar_yoff,fade_spd);

// scorebar
scorebar_yoff = (submenu == navbar.scorebar); // ?	scorebar_yoff = true : scorebar_yoff = false

if scorebar_yoff != scorebar_yoff_start
scorebar_yoff_start = lerp(scorebar_yoff_start,scorebar_yoff,fade_spd);

// coursebar
coursebar_yoff = (submenu != navbar.coursebar); // ? coursebar_yoff = true : coursebar_yoff = false

if coursebar_yoff != coursebar_yoff_start
coursebar_yoff_start = lerp(coursebar_yoff_start,coursebar_yoff,fade_spd);

// numpad
numpad_yoff = !(submenu == navbar.numpad); // ? coursebar_yoff = true : coursebar_yoff = false

if numpad_yoff != numpad_yoff_start
numpad_yoff_start = lerp(numpad_yoff_start,numpad_yoff,fade_spd);

// alpha
if alpha_lerp != alpha_lerp_end
alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,fade_spd);

// lerp the side menu position
var lerp_spd = SIDEBAR_LERP;

if submenu_menu_xpos != submenu_menu_xpos_disp
submenu_menu_xpos_disp = lerp(submenu_menu_xpos_disp,submenu_menu_xpos,lerp_spd);
		
// header delete
headerDeleteOffset = mode_delete;

if headerDeleteOffset != headerDeleteOffsetDisp
headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
	
}
