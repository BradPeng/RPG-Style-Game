// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_dodge(){
	h_speed = -lengthdir_x(speedDodge, direction);
	v_speed = lengthdir_y(speedDodge, -direction)
	
	move_distance_remaining = max(0, move_distance_remaining - speedDodge);
	var _collided = player_collision();
	
	// update sprite
	sprite_index = spr_player_backstep;
	var _total_frames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _total_frames) + min(((1 - (move_distance_remaining / distance_dodge)) * _total_frames), _total_frames - 1);
	z = sin((move_distance_remaining / distance_dodge * pi)) * distanceBonkHeight;
	// state
	if (move_distance_remaining <= 0) {
		state = player_state_free;
	}

	if (_collided) {
		state = player_state_free;
		z = 0 
		move_distance_remaining = 0;
	}
		
}