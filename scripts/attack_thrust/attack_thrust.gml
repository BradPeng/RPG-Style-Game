// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_thrust() {
	
	// Lag state
	if (alarm[1] != 0 and alarm[1] != -1) {
		// do nothing
		if (key_right) direction = 0;
		if (key_up) direction = 90
		if (key_down) direction = 270;
		if (key_left) direction = 180;
	// End of lag state	
	} else if (alarm[1] == 0) {
		state = player_state_free;
		animation_end = false;	
		
	// Normal animation	
	} else {
		if (sprite_index != spr_player_thrust) {
		
			sprite_index = spr_player_thrust
			local_frame = 0;
			image_index = 0;
		
			// clear hit list
			if (!ds_exists(hit_by_attack_list, ds_type_list)) {
				hit_by_attack_list = ds_list_create();	
			}
			ds_list_clear(hit_by_attack_list);
		
		}

		calc_attack(spr_player_thrust_hb, 5, 20)
		animate_cardinal_sprite();
	}
	
	// When animation ends, begin lag timer
	if (animation_end) {
		if (alarm[1] == -1) {
			alarm[1] = 5;	
		} 
	}
}