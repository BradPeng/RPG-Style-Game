// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAttack(hb, _direction, _force, _dmg){
	with (instance_create_layer(x, y, "Instances",  o_enemy_hitbox)) {
		sprite_index = hb;
		image_index = other.image_index
		image_speed = 0;
		localFrame = other.localFrame
		direction = other.direction
		sourceDirection = _direction;
		sourceForce = _force;
		sourceDamage = _dmg;
	}
	
}