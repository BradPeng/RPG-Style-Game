if (entityShadow) {
	draw_sprite(s_shadow, 0,floor(x), floor(y));
	draw_sprite_ext(s_shadow, image_index, x, y, 4 + -abs(sin(levitationHeight/2 + 5)), 4 +  -abs(sin(levitationHeight/2 + 5)), image_angle,
	image_blend,
	image_alpha) 
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