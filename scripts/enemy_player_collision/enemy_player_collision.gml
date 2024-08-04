// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_player_collision(){
	var _collision = false;
	
	var _collidedObject = instance_place(x + hSpeed, y, obj_player)
	if (_collidedObject != noone and _collidedObject.isSolid) {
		while (!place_meeting(x + sign(hSpeed), y, obj_player)) {
			x += sign(hSpeed);
		}
		hSpeed = 0;
		_collision = true;
	}

	// Horizontal move commit
	x += hSpeed;
	
	var _collidedObject = instance_place(x, y + vSpeed, obj_player)
	if (_collidedObject != noone and _collidedObject.isSolid) {
		while (!place_meeting(x, y + sign(vSpeed), obj_player)) {
			y += sign(vSpeed);
		}
		
		//y -= sign(vSpeed);
		vSpeed = 0;
		_collision = true;
	}

	// vertial move commit
	y += vSpeed;
}