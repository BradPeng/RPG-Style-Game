if (room != rm_p_test) {
	draw_sprite(spr_shadow, 0, floor(x), floor(y));
}

// draw hookshot in behind player
if (state = player_state_hook and image_index != 3) {
	draw_hook_chain();
}

// every 8 frames
if (invulnerable != 0 and (invulnerable mod 12) < 2 == 0 and flash == 0) {
	// don't draw
} else {
	if (flash != 0) {
		shader_set(flash_shader);
		u_flash = shader_get_uniform(flash_shader,"flash");
		shader_set_uniform_f(u_flash, flash);
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y - z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
	
	if (shader_current() != -1) {
		shader_reset();
	}
}

// draw hookshot in above of player
if (state = player_state_hook and image_index == 3) {
	draw_hook_chain();
}

function draw_hook_chain() {
	var _origin_x = floor(x);
	var _origin_y = floor(y) - 7;
	var _chains = hook div hook_size; // div is integer division
	var _hook_dir_x = sign(hook_x);
	var _hook_dir_y = sign(hook_y);
	
	for (var _i = 0; _i < _chains; _i++) {
		draw_sprite ( //draw chains backward starting from blade of hook
			spr_hook_chain,
			0,
			_origin_x + hook_x - (_i * hook_size * _hook_dir_x),
			_origin_y + hook_y - (_i * hook_size * _hook_dir_y)
		)
		
		draw_sprite(spr_hook_blade, image_index, _origin_x + hook_x, _origin_y + hook_y);
	}
}







