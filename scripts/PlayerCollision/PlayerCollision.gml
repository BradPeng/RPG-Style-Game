// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	
	var _collidedObject = instance_place(x + hSpeed, y, obj_solid)
	if (_collidedObject != noone and _collidedObject.isSolid and _collidedObject != global.iLifted) {
		while (!place_meeting(x + sign(hSpeed), y, obj_solid)) {
			x += sign(hSpeed);
		}

		hSpeed = 0;
		_collision = true;
	}
	

	/*if (_collidedObject != noone and _collidedObject.object_index == p_pushable.object_index) {
		state = PlayerStatePush;
		global.iPushing = _collidedObject;
	}*/

	// Horizontal move commit
	x += hSpeed;
	
	var _collidedObject = instance_place(x, y + vSpeed, obj_solid)
	if (_collidedObject != noone and _collidedObject.isSolid and _collidedObject != global.iLifted) {
		while (!place_meeting(x, y + sign(vSpeed), obj_solid)) {
			y += sign(vSpeed);
		}
		
		//y -= sign(vSpeed);
		vSpeed = 0;
		_collision = true;
	}

	// vertial move commit
	y += vSpeed;
	
	return _collision;
}