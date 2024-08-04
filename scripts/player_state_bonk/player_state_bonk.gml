// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_bonk(){
	h_speed = lengthdir_x(speedBonk, direction - 180);
	v_speed = lengthdir_y(speedBonk, direction - 180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = player_collision();
	
	// update sprite
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR - 2
	
	//change height (visually)
	z = sin((moveDistanceRemaining / distanceBonk * pi)) * distanceBonkHeight;
	
	
	// state
	if (moveDistanceRemaining <= 0) {
		state = player_state_free;
	}
		
}