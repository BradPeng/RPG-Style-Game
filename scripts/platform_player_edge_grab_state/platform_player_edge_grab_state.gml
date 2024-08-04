// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platform_player_edge_grab_state(){
	if (keyDown) {
		state = platform_player_state_free;
		alarm[1] = 15; // edge grab timer
	}
		
	if (keyUp) {
		state = platform_player_state_free;
		v_speed = jumpHeight;
		alarm[1] = 15;
	}
			
	// facing right, click left
	if (image_xscale = 1) {
		if (keyLeft) {
			state = platform_player_state_free;
			alarm[1] = 15;
		} 
		
	}
		
	// facing left, click right
	if (image_xscale = -1) {
		if (keyRight) {
			state = platform_player_state_free;
			alarm[1] = 15;
		}

	}
}