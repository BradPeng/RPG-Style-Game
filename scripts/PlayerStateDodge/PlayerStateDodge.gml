// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDodge(){
	h_speed = -lengthdir_x(speedDodge, direction);
	v_speed = lengthdir_y(speedDodge, -direction)
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedDodge);
	var _collided = PlayerCollision();
	
	// update sprite
	sprite_index = spr_player_backstep;
	var _total_frames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _total_frames) + min(((1 - (moveDistanceRemaining / distanceDodge)) * _total_frames), _total_frames - 1);
	z = sin((moveDistanceRemaining / distanceDodge * pi)) * distanceBonkHeight;
	// state
	if (moveDistanceRemaining <= 0) {
		state = player_state_free;
	}

	if (_collided) {
		state = player_state_free;
		z = 0 
		moveDistanceRemaining = 0;
	}
		
}