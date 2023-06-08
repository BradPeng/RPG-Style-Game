// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDodge(){
	hSpeed = -lengthdir_x(5, direction);
	vSpeed = lengthdir_y(5, -direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - 5);
	var _collided = PlayerCollision();
	
	// update sprite
	sprite_index = s_player_backstep;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceDodge)) * _totalFrames), _totalFrames - 1);
	
	// state
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}

	if (_collided) {
		state = PlayerStateFree;
		moveDistanceRemaining = 0;
	}
		
}