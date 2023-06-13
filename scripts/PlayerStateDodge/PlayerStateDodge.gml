// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDodge(){
	hSpeed = -lengthdir_x(speedDodge, direction);
	vSpeed = lengthdir_y(speedDodge, -direction)
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedDodge);
	var _collided = PlayerCollision();
	
	// update sprite
	sprite_index = s_player_backstep;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceDodge)) * _totalFrames), _totalFrames - 1);
	z = sin((moveDistanceRemaining / distanceDodge * pi)) * distanceBonkHeight;
	// state
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}

	if (_collided) {
		state = PlayerStateFree;
		z = 0 
		moveDistanceRemaining = 0;
	}
		
}