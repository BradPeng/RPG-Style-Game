// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_attack(_hb, _direction, _force, _dmg){
	with (instance_create_layer(x, y, "Instances",  obj_enemy_hitbox)) {
		sprite_index = _hb;
		image_index = other.image_index
		image_speed = 0;
		local_frame = other.local_frame
		direction = other.direction
		source_direction = _direction;
		source_force = _force;
		source_damage = _dmg;
	}
	
}