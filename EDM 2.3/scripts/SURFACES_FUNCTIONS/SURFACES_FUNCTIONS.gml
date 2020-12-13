
function scr_surface_rebuild(surface_ind) {
/// @param [surface_ind]

if argument[0] == undefined // rebuild all
	{
	var size = surfaces.enumcount;
	for(var	i=0;i<size;i++)
	surface_free(surface_array[i]);
	}
else
surfaceCanBuild_array[surface_ind] = true; // can rebuild
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
	
draw_surface_ext(surface_array[surface_id],xx,yy,xscale,yscale,0,c_white,alpha);

return surface_array[surface_id];
}

function surface_set(surface_ind) {
	
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
	}
	
	
// if you can rebuild the surface
if surfaceCanBuild_array[surface_ind]
	{
	surfaceCanBuild_array[surface_ind] = false; // can't rebuild again
	surfaceActive_array[surface_ind] = true; // set to active
	
	surface_set_target(surface_array[surface_ind]); // set the surface target
	draw_clear_alpha(c_white,0); // clear the surface
	
	return true;	
	}
else
return false;
}