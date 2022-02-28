function screen_manage_members() {

	manage_members_members_list();
	}
	
function manage_members_members_list() {
	
	var xx = 0;
	var yy = 50;
	var ww = 370;
	var sep = 60;
	var height = 40;
	
	draw_set_halign(fa_left);
	
	// outline
	draw_line_pixel(0,yy-sep,ww,room_height,c_white,0.7);
	draw_line_pixel(0,yy,ww,1);
	
	// header
	draw_text_centered(0,yy-sep,"Members List",height,ww,sep,appblue);
	
	// components
	draw_member_list_content(xx,yy,ww,sep,height);
	draw_member_list_member_details(height,sep);
	add_member_button();
	}
	
function draw_member_list_content(xx,yy,ww,sep,height) {
	
	var list = MEMBERS_LIST.list;
	var size = array_length(list);
	for(var i=0;i<size;i++) {
		
		var selected = (manageMemberIndex == i);
		var yoff = (i*sep);
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		
		var favorite = memberDetails.favorite;
		var bgCol = pick(c_black,FAVORITE_BUTTON_STYLE.bgColor,favorite);
		
		if draw_icon_click(,,xx,yy+yoff,ww,sep) {
			
			manageMemberIndex = i;
			}
		
		// highlight
		if selected
		draw_icon(,,xx,yy+yoff,ww,sep,appblue,0.5);
		
		// member name
		draw_text_centered(xx+15,yy+yoff,memberDetails.fullName,height,,sep,bgCol);
		
		// separator
		draw_line_pixel(xx,yy+yoff+sep,ww,1,c_black,0.3);
		}
	}
	
function draw_member_list_member_details(height,sep) {
	
	var xx = 480;
	var yy = 50;
	var ww = 450;
	var hh = 400;
	var yoff = 0;
	
	// outline
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	
	// header
	draw_text_centered(xx,yy-height,"Member Details",height,ww,height,appblue);
	
	// details
	var memberStruct = MEMBERS_LIST.list[manageMemberIndex];
	var memberDetails = memberStruct.memberDetails;

	// name
	draw_text_centered(xx+15,yy,memberDetails.fullName,height,,sep);
	draw_icon(ico_edit,0,xx+380,yy+yoff,60,sep,,0.3);
	draw_line_pixel(xx,yy+sep,ww,1,,0.5);

	if draw_icon_click(,,xx,yy,ww,sep)
	member_edit_name(memberStruct);
	
	// favorite
	yoff += sep;
	draw_text_centered(xx+15,yy+yoff,"Favorite",height,,sep);
	draw_icon(ico_checkbox,memberDetails.favorite,xx+380,yy+yoff,60,sep);
	
	if draw_icon_click(,,xx,yy+yoff,ww,sep)
	memberDetails.favorite = !memberDetails.favorite;

	// tee marker
	yoff += sep;
	draw_text_centered(xx+15,yy+yoff,COURSE_DATA.courseData.courseName,height,,sep);

	draw_icon_click(,,xx,yy+yoff,ww,sep)

	}
		
function add_member_button() {
	
	var xx = 500;
	var yy = 500;
	var ww = 200;
	var hh = 75;
	var height = 30;
	
	draw_icon(,,xx,yy,ww,hh,c_green,2);
	
	if draw_text_button(xx,yy,"Create Member",height,ww,hh,c_white)
	member_create_new();
	}