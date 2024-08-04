// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platform_player_edge_grab_state(){
	if (key_down) {
		state = platform_player_state_free;
		alarm[1] = 15; // edge grab timer
	}
		
	if (key_up) {
		state = platform_player_state_free;
		v_speed = jump_height;
		alarm[1] = 15;
	}
			
	// facing right, click left
	if (image_xscale = 1) {
		if (key_left) {
			state = platform_player_state_free;
			alarm[1] = 15;
		} 
		
	}
		
	// facing left, click right
	if (image_xscale = -1) {
		if (key_right) {
			state = platform_player_state_free;
			alarm[1] = 15;
		}

	}
}