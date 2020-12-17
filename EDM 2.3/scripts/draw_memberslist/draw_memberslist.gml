function draw_memberslist() {
	
var scrollbar_index = offsetScroll.membersOffset;
var memberslist_offset = offsetArray[scrollbar_index];

var xx = bleed_left;
var yy = header_ypos_end+header_submenu_height; // 360
var ww = app_width;
var hh = app_height-yy;
var sep = pct_y(16);
var height = pct_y(5.2);
var off_pos = memberslist_offset*sep
var ypos = yy-off_pos;
var surf_hh = app_height;

element_overlay_memberlist_draw(xx,yy,ww,off_pos,surf_hh,sep,height,MEMBER_list);
surface_draw_struct("scrollVert",-1,0,yy,1,off_pos,surf_hh);

return element_overlay_memberlist_step(xx,yy,ww,hh,sep,surf_hh,MEMBER_list,MEMBER_list,scrollbar_index);	
}