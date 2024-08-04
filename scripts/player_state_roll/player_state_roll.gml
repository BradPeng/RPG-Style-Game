// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_roll(){
	h_speed = lengthdir_x(speed_roll, direction);
	v_speed = lengthdir_y(speed_roll, direction);
	
	move_distance_remaining = max(0, move_distance_remaining - speed_roll);
	var _collided = player_collision();
	
	// update sprite
	sprite_index = roll_sprite;
	var _total_frames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _total_frames) + min(((1 - (move_distance_remaining / distance_roll)) * _total_frames), _total_frames - 1);
	
	// state
	if (move_distance_remaining <= 0) {
		state = player_state_free;
	}

	if (_collided) {
		state = player_state_bonk;
		move_distance_remaining = distance_bonk;
		screen_shake(4, 15);
	}
		
}