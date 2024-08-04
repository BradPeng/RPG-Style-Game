// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_collision(){
	var _collision = false;
	
	var _collided_object = instance_place(x + h_speed, y, obj_solid)
	if (_collided_object != noone and _collided_object.is_solid and _collided_object != global.i_lifted) {
		while (!place_meeting(x + sign(h_speed), y, obj_solid)) {
			x += sign(h_speed);
		}

		h_speed = 0;
		_collision = true;
	}
	

	/*if (_collided_object != noone and _collided_object.object_index == p_pushable.object_index) {
		state = player_state_push;
		global.i_pushing = _collided_object;
	}*/

	// Horizontal move commit
	x += h_speed;
	
	_collided_object = instance_place(x, y + v_speed, obj_solid)
	if (_collided_object != noone and _collided_object.is_solid and _collided_object != global.i_lifted) {
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