// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_collision(){
	var _collision = false;
	
	var _collidedObject = instance_place(x + h_speed, y, obj_solid)
	if (_collidedObject != noone and _collidedObject.is_solid and _collidedObject != global.iLifted) {
		while (!place_meeting(x + sign(h_speed), y, obj_solid)) {
			x += sign(h_speed);
		}

		h_speed = 0;
		_collision = true;
	}
	

	/*if (_collidedObject != noone and _collidedObject.object_index == p_pushable.object_index) {
		state = PlayerStatePush;
		global.iPushing = _collidedObject;
	}*/

	// Horizontal move commit
	x += h_speed;
	
	var _collidedObject = instance_place(x, y + v_speed, obj_solid)
	if (_collidedObject != noone and _collidedObject.is_solid and _collidedObject != global.iLifted) {
		while (!place_meeting(x, y + sign(v_speed), obj_solid)) {
			y += sign(v_speed);
		}
		
		//y -= sign(v_speed);
		v_speed = 0;
		_collision = true;
	}

	// vertial move commit
	y += v_speed;
	
	return _collision;
}