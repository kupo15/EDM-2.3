function draw_profile_create() {
	
draw_profile_view();	

//	{
//	venueID: ind,
//	dispName: name,
//	location: -1,

//	currencyId: {
//			initial: name,
//			symbol: symbol,
//			}
//	
//	logoId: -1,
//	bannerId: -1,
//	
//	memberlist: [],
//	}		

}

function draw_profile_view() {

var profile_num = array_length(ROOT_data_struct.profiles);	
var condition = (profile_num == 0) || (submenu == navbar.currencyList);
var show_trash = pick(headerType.trash,headerType.none,condition); // cant delete the last remaining profile
var header_str = pick("Edit Profile","Select Currency",submenu == navbar.currencyList);
var trash = draw_screen_header(headerType.back,show_trash,header_str);

if trash
	{
	array_delete(ROOT_data_struct.profiles,activeProfile,1); // delete
	scr_profile_set(0);
	screen_change(screen.home,navbar.hidden,true);
	}

var disp_name = activeStruct.dispName;

var currency_pointer = activeStruct.currency;
var curr_name = currency_pointer.dispName;
var curr_iso = currency_pointer.isoCode;
var curr_str = curr_name+ " ("+curr_iso+")";

#region Finished button
var submit = (disp_name != "")
var hh = element_finished.hh;
var height = element_finished.stringHeight;
var xx = 0;
var yy = app_height-hh;
var ww = app_width-xx-xx;
var col = pick(c_gray,header_color,submit);

if click_button(xx,yy,"Finished",height,c_white,ww,hh,col,false,false,navbar.hidden) && submit
	{
	PROFILE_data.currency = currency_pointer;
	PROFILE_data.dispName = disp_name;
	
	app_save;
	screen_change(screen.home,navbar.hidden,true);
	}
	
#endregion

#region draw currency
var xx = pct_x(3.125);
var sep = pct_y(13);
var yy = pct_y(25)+(sep*3);
var label_height = pct_y(4);
var height = pct_y(7);

draw_text_height(xx,yy,"Currency",label_height);
draw_text_height(xx,yy+pct_y(4.5),curr_str,height); // venue name

draw_line_pixel(pct_x(5),yy+sep,app_width-pct_x(5),1,c_lt_gray,1);

if click_region_released(0,yy,app_width,sep,true,navbar.hidden,1)
submenu = navbar.currencyList;
#endregion

#region draw name
var xx = pct_x(3.125);
var yy = pct_y(25);
var sep = pct_y(13);
var label_height = pct_y(4);
var height = pct_y(7);

draw_text_height(xx,yy,"Name",label_height);
draw_text_height(xx,yy+pct_y(4.5),disp_name,height); // venue name

draw_line_pixel(pct_x(5),yy+sep,app_width-pct_x(5),1,c_lt_gray,1);
draw_icon_height(ico_edit,0,pct_x(90),yy+pct_y(5),pct_y(4),1); // edit icon

if click_region_released(0,yy,app_width,sep,true,navbar.hidden,1)
	{
	click_textbox_set(disp_name,textboxEntry.popupEntryText,kbv_type_default);
	submenu = navbar.popupEntry;
	}
#endregion


if androidBack
&& !kvActive
&& submenu == navbar.hidden
	{
	if screenIndex == screen.profileCreate
		{
		array_delete(ROOT_data_struct.profiles,activeProfile,1); // delete
		scr_profile_set(0);
		}

	screen_change(screen.home,navbar.sidebar,true);
	}

var name_entry = draw_overlay_popup_entry("Enter venue name",activeStruct.dispName,-1);
if name_entry != undefined
activeStruct.dispName = name_entry;

var curr_return = draw_currency_list();
if curr_return != undefined
	{
	activeStruct.currency = currency_array[curr_return];		
	submenu = navbar.hidden;
	}
}