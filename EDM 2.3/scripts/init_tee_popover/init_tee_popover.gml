#macro TEELIST_ACTIVE obj_tee_selector.active

function tee_popover_init(xx=obj_tee_selector.x,yy=obj_tee_selector.y,ww=obj_tee_selector.width,teeColorSelected=undefined,animation=true) {

	with obj_tee_selector {

		x = xx;
		y = yy;
		
		yposStart = y;
		yposEnd = y-height;
		
		animationValueEnd = 1;
		
		if !animation
		animationValue = animationValueEnd;
		
		width = ww;
		
		active = true;
		highlightedTee = teeColorSelected;
		}
	}
	
function tee_popover_deactivate(animation=true) {
	
	active = false;
	
	animationValueEnd = 0;
	
	if !animation
	animationValue = animationValueEnd;
	}