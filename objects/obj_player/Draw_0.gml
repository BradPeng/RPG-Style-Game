if (room != rm_p_test) {
	draw_sprite(spr_shadow, 0, floor(x), floor(y));
}

// draw hookshot in behind player
if (state = player_state_hook and image_index != 3) {
	DrawHookChain();
}

// every 8 frames
if (invulnerable != 0 and (invulnerable mod 12) < 2 == 0 and flash == 0) {
	// don't draw
} else {
	if (flash != 0) {
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader,"flash");
		shader_set_uniform_f(uFlash, flash);
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
	DrawHookChain();
}

function DrawHookChain() {
	var _originX = floor(x);
	var _originY = floor(y) - 7;
	var _chains = hook div hookSize; // div is integer division
	var _hookDirX = sign(hook_x);
	var _hookDirY = sign(hook_y);
	
	for (var i = 0; i < _chains; i++) {
		draw_sprite ( //draw chains backward starting from blade of hook
			spr_hook_chain,
			0,
			_originX + hook_x - (i * hookSize * _hookDirX),
			_originY + hook_y - (i * hookSize * _hookDirY),
		)
		
		draw_sprite(spr_hook_blade, image_index, _originX + hook_x, _originY + hook_y);
	}
}







