function ini_surfaces() {
		
surface_array = array_create(surfaces.scroll,-1);
surfaceCanBuild_array = array_create(surfaces.scroll,false);
surfaceTarget = -1;
}

function scr_surface_create(ind) {
/// @param [ind]

if argument[0] == undefined
	{
	// get last index of current array
	var num = array_length(surface_array);

	// create a new surface
	array_push(surface_array,-1);
	array_push(surfaceCanBuild_array,true);
	}
else
	{
	// create a new surface at position
	surface_array[ind] = -1;
	surfaceCanBuild_array[ind] = true;
	}
}

function scr_surface_rebuild(surface_ind) {
/// @param [surface_ind]

if argument[0] == undefined // rebuild all
	{
	// free all surfaces
	var size = array_length(surface_array);
	for(var	i=0;i<size;i++)
	surface_free(surface_array[i]);
	
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
		
		case surfaces.sidebar:
		case surfaces.sidebarProfile: surface_array[surface_ind] = surface_create(side_menu_width,app_height); break;
				
		default: surface_array[surface_ind] = surface_create(app_width,app_height); break;	
		}
		
	if argument[1] == undefined
	ww = surface_get_width(surface_array[surface_ind]);
	
	if argument[2] == undefined
	hh = surface_get_height(surface_array[surface_ind]);
	
	surface_resize(surface_array[surface_ind],next_pow2(ww),next_pow2(hh));
		
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
	
function surface_draw(surface_id,xx,yy,alpha,xscale,yscale) {
/// @param surface_enum
/// @param xx
/// @param yy
/// @param alpha
/// @param [xscale
/// @param yscale]

if argument[4] == undefined
xscale = 1;

if argument[5] == undefined
yscale = 1;
	
var surf_hh = surface_get_height(surface_array[surface_id]); // the height of the surface
var scroll_count = array_length(surface_array)-surfaces.scroll; // number of scrolling pages

var num = pick(1,scroll_count,surface_id == surfaces.scroll);
for(var i=0;i<num;i++)
	{
	var surf = surface_array[surface_id+i];
	var off_pos = i*surf_hh;
	var end_pos = off_pos+surface_get_height(surf);
	
	if (yy+off_pos > app_height) || (yy+end_pos < 0)
	continue;
		
	if surface_exists(surf)
	draw_surface_ext(surf,xx,yy+off_pos,xscale,yscale,0,c_white,alpha);
	
	draw_line_pixel(0,yy+off_pos,app_width,1,c_red,1);
	draw_line_pixel(0,yy+off_pos+surf_hh,app_width,1,c_red,1);
	}

return surf;
}