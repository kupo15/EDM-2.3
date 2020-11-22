function delete_list_set(ref_list,first_pos) {
// mouse click
timer[timerIndex.press_hold] = press_hold_timer; // set timer until activation
mode_delete_list_id = ref_list; // set the ref list to delete from
			
ds_list_clear(deleteList);

var list_size = ds_list_size(ref_list);
ds_list_add(deleteList,list_size); // add number of slots
ds_list_add(deleteList,first_pos); // add that index slot to the delete list
}

function delete_list_set_array(ref_array,first_pos) {
// mouse click
if !canClickPressed
exit;

timer[timerIndex.press_hold] = press_hold_timer; // set timer until activation
mode_delete_list_id = ref_array; // set the ref list to delete from
			
ds_list_clear(deleteList);

var list_size = array_length(ref_array);
ds_list_add(deleteList,list_size); // add number of slots
ds_list_add(deleteList,first_pos); // add that index slot to the delete list
}

function delete_list_enable() {

// turn off click highlight
click_highlight_alpha_end = 0;
click_highlight_alpha = 0;

// enable delete mode
mode_delete = true;
can_delete = false;

// get list param
var size = deleteList[| 0];
var first_ind = deleteList[| 1];
	
// clear list
ds_list_clear(deleteList);
	
// make all entries false
repeat size
ds_list_add(deleteList,false); 
	
// set the first index selected
deleteList[| first_ind] = true;
}

function delete_list_delete(del_list_id,ref_list) {

var size = ds_list_size(deleteList);
for(var i=size-1;i>-1;i--)
	{// delete in reverse order
	if del_list_id[| i]
	ds_list_delete(ref_list,i); // delete from ref list
	}
		
// disable delete mode
mode_delete = false;
app_save;
}

function delete_list_delete_array(del_list_id,ref_array) {

var size = ds_list_size(deleteList);
for(var i=size-1;i>-1;i--)
	{// delete in reverse order
	if del_list_id[| i]
	array_delete(ref_array,i,1); // delete from ref struct
	}
		
// disable delete mode
mode_delete = false;
app_save;
}

function delete_list_draw_selected(xx,yy,yoff,ww,hh,box_hh,del_list_id,ind) {

var col = c_green;

// change yy and sep/hh
var ypos = yy+yoff;
var ypos_clamp = clamp(ypos,yy,yy+box_hh); // clamp between window
var sep_adj = abs(ypos-ypos_clamp); // remaining height after clamped
var sep = hh-sep_adj;
		
// if hanging off the bottom
if ypos+sep > yy+box_hh
sep = yy+box_hh-ypos;

if del_list_id[| ind]	
	{
	draw_set_alpha(0.2);
	draw_rectangle_color(xx,ypos_clamp,xx+ww,ypos_clamp+sep,col,col,col,col,false);
	draw_set_alpha(1);
	}
}