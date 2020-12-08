shader_set(shd_passthrough);

draw_surface(application_surface,0,0);

if !keyboard_check(vk_numpad0)
draw_debug();

shader_reset();