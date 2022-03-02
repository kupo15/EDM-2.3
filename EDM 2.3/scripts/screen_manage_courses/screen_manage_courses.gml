function screen_manage_courses() {

	// course name
	var xx  = room_width*0.5;
	var yy = 70;
	var height = 65;
	
	draw_set_halign(fa_center);
	draw_text_height(xx,yy,COURSE_DATA.courseData.courseName,height);

	// tees
	var xx = 50;
	var yy = 220;
	var ww = 350;
	var sep = 50;

	draw_set_halign(fa_left);
	draw_text_centered(xx,yy,"Course Tees",40,ww,50);
	draw_tee_data_list(xx,yy+sep,ww,sep);
	
	// currency
	var yy = course_manage_currency();
	
	// handicap
	course_manage_handicap_holes();
	}
	
function course_manage_handicap_holes() {
	
	var yy = 250;
	var ww = 250;
	var xx = 500;
	var height = 35;
	var sep = 50;
	var hh = 3*sep;

	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	

	draw_set_halign(fa_left);
	draw_text_centered(xx+10,yy-sep,"Hole HCP's",height,ww,sep);
	
	// content
	var courseData = COURSE_DATA.courseData;
	var label = ["ODD","EVEN"];
	
	draw_text_centered(xx+10,yy,"Front 9: "+label[courseData.evenHandicapHoles],height,,sep);
	draw_text_centered(xx+10,yy+sep,"Back 9: "+label[!courseData.evenHandicapHoles],height,,sep);
	
	if draw_text_button(xx,yy+sep+sep,"Flip Holes",height,ww,sep)
	courseData.evenHandicapHoles = !courseData.evenHandicapHoles;

	draw_line_pixel(xx,yy+sep+sep,ww,1,,0.3);
	}
	
function course_manage_currency() {
	
	var yy = 110;
	var ww = 350;
	var xx = room_width*0.5-(ww*0.5);
	var sep = 50;

	draw_set_halign(fa_left);
	draw_text_centered(xx+10,yy,"Currency: "+CURRENCY_SYMBOL,40,,50);
	draw_icon(ico_edit,0,xx+ww-sep,yy,sep,sep,,0.5);
		
	draw_line_pixel(xx,yy+sep,ww,1,,0.3);	
		
	if draw_icon_click(,,xx,yy,ww,sep)
	COURSE_DATA.courseData.currencyIndex = !COURSE_DATA.courseData.currencyIndex;
	
	return yy+sep;
	}
	
function draw_tee_data_list(xx,yy,ww,sep=40,showPar=true,highlight=undefined,canPress=true) {
		
	var alpha = draw_get_alpha();
	var result = undefined;
	var line_gap = ww*0.1;
	
	for(var i=0;i<array_length(TEE_DATA.teeOrder);i++) {
		
		var name = TEE_DATA.teeOrder[i];
		var selected = (highlight == name);

		draw_tee_marker(xx,yy+(i*sep),sep,name,showPar,alpha);		
		draw_line_pixel(xx+line_gap,yy+sep+(i*sep),ww-line_gap,1,c_black,0.3*alpha);
		
		if selected
		draw_icon(,,xx,yy+(i*sep),ww,sep,appblue,0.3*alpha);
		
		if scr_mouse_position_room_released(xx,yy+(i*sep),ww,sep,mb_left,true,true,canPress)
		result = name;
		}
		
	return result;
	}
	
function draw_tee_marker(xx,yy,sep,teeColor,showPar=false,alpha=draw_get_alpha()) {
	
	var struct = TEE_DATA[$ teeColor];
		
	draw_sprite_ext(ico_tee_marker,0,xx+20,yy+(sep*0.5),1,1,0,struct.color,alpha);
		
	draw_text_centered(xx+45,yy,teeColor,sep*0.6,,sep,,alpha); // tee color
	draw_text_centered(xx+140,yy,struct.rating+" / "+struct.slope,sep*0.6,,sep,,alpha); // rating and slope
	
	var ww = string_width_height(struct.rating+" / "+struct.slope,sep*0.6);
	
	if showPar
	draw_text_centered(xx+140+ww,yy," - par "+struct.par,sep*0.6,,sep,,alpha); // draw par
	}
