function element_overlay_numpad() {

element_numpad = {
	
	baseWidth: 540,
	baseHeight: 960,
	
	vsep: py(12.75),
	hsep1: px(9.7),
	hsep2: px(13.3),

	height: py(6.7),
	}

element_numpad.ww = element_numpad.hsep1+(element_numpad.hsep2*3);
element_numpad.hh = element_numpad.vsep*4;
}

/*
function element_overlay_numpad() {

element_numpad = {
	
	baseWidth: 540,
	baseHeight: 380,

	vsep: 95, 
	hsep1: 105,
	hsep2: 145,

	height: 50,
	}
}


element_numpad = {
	
	baseWidth: 540,
	baseHeight: 960,
	
	ww: px(540),
	hh: py(380/960*100), // 380
	
	vsep: py(9),
	hsep1: px(19.5),
	hsep2: px(26.8),

	height: py(4.7),
	}