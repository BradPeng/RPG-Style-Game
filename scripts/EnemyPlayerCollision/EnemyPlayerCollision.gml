// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyPlayerCollision(){
	var _collision = false;
	
	var _collidedObject = instance_place(x + hSpeed, y, o_player)
	if (_collidedObject != noone and _collidedObject.isSolid) {
		while (!place_meeting(x + sign(hSpeed), y, o_player)) {
			x += sign(hSpeed);
		}
		hSpeed = 0;
		_collision = true;
	}

	// Horizontal move commit
	x += hSpeed;
	
	_collidedObject = instance_place(x, y + vSpeed, o_player)
	if (_collidedObject != noone and _collidedObject.isSolid) {
		while (!place_meeting(x, y + sign(vSpeed), o_player)) {
			y += sign(vSpeed);
		}
		
		//y -= sign(vSpeed);
		vSpeed = 0;
		_collision = true;
	}

	// vertial move commit
	y += vSpeed;
}