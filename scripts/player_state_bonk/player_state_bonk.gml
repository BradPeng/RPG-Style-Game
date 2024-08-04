// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_bonk(){
	h_speed = lengthdir_x(speed_bonk, direction - 180);
	v_speed = lengthdir_y(speed_bonk, direction - 180);
	
	move_distance_remaining = max(0, move_distance_remaining - speed_roll);
	var _collided = player_collision();
	
	// update sprite
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR - 2
	
	//change height (visually)
	z = sin((move_distance_remaining / distance_bonk * pi)) * distance_bonk_height;
	
	
	// state
	if (move_distance_remaining <= 0) {
		state = player_state_free;
	}
		
}