function surface_bundle_header(header_left,header_right,header_string,headerHeightScale,bg_col) {
/// @param	header_left
/// @param	header_right
/// @param	header_string
/// @param	[headerHeightScale
/// @param	header_color]	
	
if surface_set_struct("header")
	{
	element_header_draw(header_left,header_right,header_string,headerHeightScale,bg_col);
	surface_reset_target();
	}
	
// header
surface_draw_struct("header",-1,0,0,1);

// normal draw
element_header_delete_draw();

// step
element_header_delete_step();
return element_header_step();
}
