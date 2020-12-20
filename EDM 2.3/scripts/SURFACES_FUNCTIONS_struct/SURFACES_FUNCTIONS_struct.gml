function ini_surfaces() {

// original template
init_surf_data = {
	
	surfID: -1,
	canBuild: false,
}

init_surface_struct = {
	
	surfaceTarget: -1,
	
	header: [struct_copy(init_surf_data)],
	body: [struct_copy(init_surf_data)],
	sidebar: [struct_copy(init_surf_data)],
	overlay: [struct_copy(init_surf_data)],
	
	scrollVert: [],
	scrollHor: [],
	}
	
// working copy
surface_struct = struct_copy(init_surface_struct);	
}

function scr_surface_create_struct(key,ind) {
/// @param key
/// @param [ind]

var surf_array = surface_struct[$ key];

if argument[1] == undefined
	{	
	// create a new surface
	array_push(surf_array,struct_copy(init_surf_data));
	
	ind = array_length(surf_array)-1;
	}
else
	{
	// create a new surface at position
	surf_array[ind] = struct_copy(init_surf_data);

	// make sure all inactive surfaces are -1
	var num = array_length(surf_array);
	for(var i=0;i<num;i++)
		{
		if surf_array[i] == 0
		surf_array[i] = struct_copy(init_surf_data);
		}
		
	surface_struct[$ key] = surf_array;
	}
	
return surface_struct[$ key][ind];
}

function scr_surface_free_struct(key,ind) {
/// @param key
/// @param [ind]

var surf_array = surface_struct[$ key];

if argument[1] == undefined // free entire key
	{
	var size = array_length(surf_array);
	for(var i=0;i<size;i++)
		{
		var surf = surf_array[i].surfID;
		
		// free all surfaces
		if surface_exists(surf)
			{
			surface_free(surf);
			
			surface_struct[$ key][i].surfID = -1;
			}
			
		// destroy the key
		//surface_struct[$ key] = [];
		
		db("surface key '"+string(key)+"' freed");
		}
	}
else
	{
	var surf = surf_array[ind].surfID;

	if surface_exists(surf)
		{
		surface_free(surf);
		surf_array[ind].surfID = -1;
	
		db("surface '"+string(key)+"' ind"+string(ind)+" freed")
		}
	}
}

function scr_surface_rebuild_struct(key,ind) {
/// @param [key
/// @param ind]

if argument[0] == undefined // rebuild all
	{	
	var struct = surface_struct;

	// free all surfaces
	var surf_keys = variable_struct_get_names(struct);
	var size = array_length(surf_keys);
	for(var n=0;n<size;n++)
		{
		var name = surf_keys[n];
		var surf_array = struct[$ name];
		
		if is_array(surf_array)
		scr_surface_free_struct(name);
		
		//{
		//var size = array_length(surf_array);
		//for(var	i=0;i<size;i++)
		//	{
		//	var surf = surf_array[i].surfID;
		//	scr_surface_free_struct(surf);
		//	}
		//}
		}
	
	db("^^^^ freed all surfaces ^^^^")
	
	// cull any extra arrays back to original length
	surface_struct = struct_copy(init_surface_struct);
	}
else
	{
	var surf_array = surface_struct[$ key];

	if argument[1] == undefined // rebuild entire key
		{
		var size = array_length(surf_array);
		for(var i=0;i<size;i++)
		surf_array[i].canBuild = true;
		}
	else
	surf_array[ind].canBuild = true; // can rebuild
	}
}

function surface_set_struct(key,ind,surf_ww,surf_hh) {
/// @param key
/// @param [ind
/// @param surf_ww
/// @param surf_hh]

var struct = surface_struct[$ key];

if argument[1] == undefined
ind = 0;

// if the index you are trying to set is outside the array
if ind >= array_length(struct)
var surf_pointer = scr_surface_create_struct(key,ind);
else
var surf_pointer = struct[ind];	

var surf = surf_pointer.surfID;
	
// recreate broken surfaces
if !surface_exists(surf)
	{
	surf_pointer.canBuild = true; // can rebuild
	
	switch key
		{
		case "header": var ww = app_width;
					   var hh = header_ypos_end;
					   break;
		
		case "sidebar": var ww = side_menu_width;
						var hh = app_height;
						break;
				
		default: var ww = app_width;
				 var hh = app_height;
				 break;	
		}
		
	// create surface
	var surf = surface_create(ww,hh);
	surf_pointer.surfID = surf;

	if argument[2] == undefined
	surf_ww = surface_get_width(surf);
	
	if argument[3] == undefined
	surf_hh = surface_get_height(surf);
	
	surface_resize(surf,surf_ww,surf_hh);
	
	db("surface '"+string(key)+"' index"+string(ind)+" created: "+string(surf_ww)+" x "+string(surf_hh));
	}	
	
// if you can rebuild the surface
if surf_pointer.canBuild
	{
	surface_struct.surfaceTarget = surf; // set the surface that is active for drawing
	surf_pointer.canBuild = false; // can't rebuild again
	
	surface_set_target(surf); // set the surface target
	draw_clear_alpha(c_white,0); // clear the surface
	
	db("");
	db("@@@@@@@--surface "+string(key)+" ind"+string(ind)+" rebuilt--@@@@@@@");
	db("");
	
	return true;	
	}
else
return false;
}
	
function surface_draw_struct(key,ind,xx,yy,alpha,off_pos,surf_hh,xscale,yscale) {
/// @param key
/// @param ind
/// @param xx
/// @param yy
/// @param alpha
/// @param [off_pos
/// @param surf_hh
/// @param xscale
/// @param yscale]

var surf_array = surface_struct[$ key];

if argument[7] == undefined
xscale = 1;

if argument[8] == undefined
yscale = 1;
	
var num = array_length(surf_array) // number of surfaces in the array
for(var i=0;i<num;i++)
	{
	var surf = surf_array[i].surfID;
	
	if !surface_exists(surf)
	continue;
	
	if argument[5] == undefined
	off_pos = 0;
	
	if argument[6] == undefined
	surf_hh = surface_get_height(surf);

	var ypos = yy-off_pos+(i*surf_hh);
	var end_pos = ypos+surf_hh;
	
	if (ypos > app_height) || (end_pos < floor(yy))
		{
		scr_surface_free_struct(key,i);
		continue;
		}

	draw_surface_ext(surf,xx,ypos,xscale,yscale,0,c_white,alpha);
	
	if os_type == os_windows
		{
		surf_ww = surface_get_width(surf);
			
		draw_line_pixel(0,ypos,surf_ww,1,c_red,1);
		draw_line_pixel(0,end_pos,surf_ww,1,c_red,1);
		}
	}
}