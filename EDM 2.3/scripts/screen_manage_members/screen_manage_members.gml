function screen_manage_members() {

	manage_members_members_list();
	}
	
function manage_members_members_list() {
	
	var can_click = !global.popoverActive;
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
	draw_text_button(0,yy-sep,"Members List",height,ww,sep,appblue,,false);
	
	// components
	draw_member_list_content(xx,yy,ww,sep,height,can_click);
	draw_member_list_member_details(height,sep,can_click);
	add_member_button(can_click);
	}
	
function draw_member_list_content(xx,yy,ww,sep,height,can_click) {
		
	var scrollbarEnum = scrollbarIndex.manageMemberList;
	var list = MEMBERS_LIST.list;
	var size = array_length(list);
	var yoff = 0;

	var rows = (room_height-50)/sep;
	var offset = scrollbar_get_offset(scrollbarEnum);
	var pos_start = 0; // floor(offset);
	var pos_end = size; // min(size,ceil(offset)+rows);
	for(var i=pos_start;i<pos_end;i++) {
		
		var ind = (i-offset);
		var ypos = yoff-(offset*sep);
		var selected = (manageMemberIndex == i);
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		
		var favorite = memberDetails.favorite;
		var archived = memberDetails.archived;
		var bgCol = pick(c_black,FAVORITE_BUTTON_STYLE.bgColor,favorite);
		
		if archived
		continue;
		
		if draw_icon_click(,,xx,yy+ypos,ww,sep,,,,can_click) {
			
			manageMemberIndex = i;
			}
		
		// highlight
		if selected
		draw_icon(,,xx,yy+ypos,ww,sep,appblue,0.5);
		
		// member name
		draw_text_centered(xx+15,yy+ypos,memberDetails.fullName,height,,sep,bgCol);
		
		// separator
		draw_line_pixel(xx,yy+ypos+sep,ww,1,c_black,0.3);
		
		yoff += sep;
		}
		
	// scroll list
	scrollbar(xx,yy,ww,room_height,sep,list,scrollbarEnum,false,can_click);
	}
	
function draw_member_list_member_details(height,sep,can_click) {
	
	var memberStruct = MEMBERS_LIST.list[manageMemberIndex];
	var memberDetails = memberStruct.memberDetails;
	
	if memberDetails.archived
	exit;
	
	var xx = 480;
	var yy = 50;
	var ww = 450;
	var hh = sep*7;
	var yoff = 0;
	
	// outline
	draw_rectangle(xx,yy,xx+ww,yy+hh,true);
	
	// header
	draw_text_centered(xx,yy-height,"Member Details",height,ww,height,appblue);
	
	// details
	// name
	draw_text_centered(xx+15,yy,memberDetails.fullName,height,,sep);
	draw_icon(ico_edit,0,xx+380,yy+yoff,60,sep,,0.3);
	draw_line_pixel(xx,yy+sep+yoff,ww,1,,0.5);

	if draw_icon_click(,,xx,yy,ww,sep,,,,can_click)
	member_edit_name(memberStruct);
	
	// favorite
	yoff += sep;
	draw_text_centered(xx+15,yy+yoff,"Favorite",height,,sep);
	draw_icon(ico_checkbox,memberDetails.favorite,xx+380,yy+yoff,60,sep);
	draw_line_pixel(xx,yy+sep+yoff,ww,1,,0.5);
	
	if draw_icon_click(,,xx,yy+yoff,ww,sep,,,,can_click)
	memberDetails.favorite = !memberDetails.favorite;

	// tee marker
	yoff += sep;
	draw_text_centered(xx+15,yy+yoff,"Tee Marker",height,,sep);
	draw_tee_marker(xx+190,yy+yoff,sep,memberDetails.teeColor);
	draw_line_pixel(xx,yy+sep+yoff,ww,1,,0.5);

	if draw_icon_click(,,xx,yy+yoff,ww,sep,,,,can_click)
	tee_popover_init(memberStruct,room_width-300,room_height,,memberDetails.teeColor);
	
	// delete member
	yoff = 6*sep;
	
	if draw_icon_click(,,xx,yy+yoff,ww,sep,appblue,0.7,,can_click)
	member_delete(memberStruct);
	// popover_member_delete_init(memberStruct);
	
	draw_text_centered(xx+15,yy+yoff,"Delete Member",height,,sep,c_red);
	draw_icon(ico_trash,0,xx+380,yy+yoff,60,sep);
	}
		
function add_member_button(can_click) {
	
	var xx = 500;
	var yy = 500;
	var ww = 200;
	var hh = 75;
	var height = 30;
	
	draw_icon(,,xx,yy,ww,hh,c_green,2);
	
	if draw_text_button(xx,yy,"Create Member",height,ww,hh,c_white,,,,can_click && !add_member)
	member_create_new();
	}
	
function sort_member_button(can_click) {
	
	
	}
	
function members_archive_selected() {
	
	var list = MEMBERS_LIST.list;
	var size = array_length(list);
	for(var i=0;i<size;i++) {
		
		var memberStruct = list[i];
		var memberDetails = memberStruct.memberDetails;
		
		if memberDetails.archived {
			
			array_push(MEMBERS_LIST.archived,memberStruct);
			array_delete(list,i,1);
			
			i--;
			size--;
			}	
		}
	}