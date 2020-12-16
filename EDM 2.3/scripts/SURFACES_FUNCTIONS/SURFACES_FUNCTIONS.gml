/*

function scr_surface_create(ind) {
/// @param [ind]

if argument[0] == undefined
	{
	// create a new surface
	array_push(surface_array,-1);
	array_push(surfaceCanBuild_array,true);
	}
else
	{
	// create a new surface at position
	surface_array[ind] = -1;
	surfaceCanBuild_array[ind] = true;
	
	// make sure all inactive surfaces are -1
	var num = array_length(surface_array);
	for(var i=0;i<num;i++)
	if surface_array[i] == 0
	surface_array[i] = -1;
	}
}

function scr_surface_free(ind) {

if surface_exists(surface_array[ind])
	{
	surface_free(surface_array[ind]);
	surface_array[ind] = -1;
	db("surface ind"+string(ind)+" freed")
	}
}

function scr_surface_rebuild(surface_ind) {
/// @param [surface_ind]

if argument[0] == undefined // rebuild all
	{
	// free all surfaces
	var size = array_length(surface_array);
	for(var	i=0;i<size;i++)
	scr_surface_free(i);
	
	db("^^^^ freed all surfaces ^^^^")
	
	// cull any extra arrays back to original length
	ini_surfaces();
	}
else
surfaceCanBuild_array[surface_ind] = true; // can rebuild
}

function surface_set(surface_ind,ww,hh) {
/// @param surf_enum
/// @param [ww
/// @param hh]

// if the index you are trying to set is outside the array
if surface_ind >= array_length(surface_array)
scr_surface_create(surface_ind);
	
// recreate broken surfaces
if !surface_exists(surface_array[surface_ind])
	{
	surfaceCanBuild_array[surface_ind] = true; // can rebuild
	switch surface_ind
		{
		case surfaces.header: surface_array[surface_ind] = surface_create(app_width,header_ypos_end); break;
		
		//case surfaces.sidebarProfile:
		case surfaces.sidebar: surface_array[surface_ind] = surface_create(side_menu_width,app_height); break;
				
		default: surface_array[surface_ind] = surface_create(app_width,app_height); break;	
		}
		
	if argument[1] == undefined
	ww = surface_get_width(surface_array[surface_ind]);
	
	if argument[2] == undefined
	hh = surface_get_height(surface_array[surface_ind]);
	
	surface_resize(surface_array[surface_ind],ww,hh);
		debug_count++;
	db("surface ind"+string(surface_ind)+" created: "+string(surface_get_width(surface_array[surface_ind]))+" x "+string(surface_get_height(surface_array[surface_ind])));
	}	
	
// if you can rebuild the surface
if surfaceCanBuild_array[surface_ind]
	{
	surfaceTarget = surface_ind; // the surface that is active for drawing
	surfaceCanBuild_array[surface_ind] = false; // can't rebuild again
	
	surface_set_target(surface_array[surface_ind]); // set the surface target
	draw_clear_alpha(c_white,0); // clear the surface
	
	db("^^^^^^surface ind"+string(surface_ind)+" rebuilt^^^^^^^^");
	
	return true;	
	}
else
return false;
}
	
function surface_draw(surface_id,xx,yy,alpha,off_pos,surf_hh,xscale,yscale) {
/// @param surface_enum
/// @param xx
/// @param yy
/// @param alpha
/// @param [off_pos
/// @param surf_hh
/// @param xscale
/// @param yscale]

if argument[6] == undefined
xscale = 1;

if argument[7] == undefined
yscale = 1;
	
var scroll_count = array_length(surface_array)-surfaces.scroll; // number of scrolling pages
var num = pick(1,scroll_count,surface_id == surfaces.scroll);

for(var i=0;i<num;i++)
	{
	var surf_ind = surface_id+i;
	var surf = surface_array[surf_ind];
	
	if !surface_exists(surf)
	continue;
	
	if argument[4] == undefined
	off_pos = 0;
	
	if argument[5] == undefined
	surf_hh = surface_get_height(surf);

	var ypos = yy-off_pos+(i*surf_hh);
	var end_pos = ypos+surf_hh;
	
	if (ypos > app_height) || (end_pos < floor(yy))
		{
		scr_surface_free(surf_ind);
		continue;
		}

	draw_surface_ext(surf,xx,ypos,xscale,yscale,0,c_white,alpha);
	
	if os_type == os_windows
		{
		draw_line_pixel(0,ypos,app_width,1,c_red,1);
		draw_line_pixel(0,end_pos,app_width,1,c_red,1);
		}
	}
}