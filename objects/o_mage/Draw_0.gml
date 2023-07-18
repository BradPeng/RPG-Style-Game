if (entityShadow) {
	draw_sprite(s_shadow, 0,floor(x), floor(y));	
}

if (flash != 0) {
	shader_set(flashShader);	
	shader_set_uniform_f(uFlash, flash);
}
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y - 20 + 5 * sin(levitationHeight)),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (shader_current() != -1) {
	shader_reset();	
}