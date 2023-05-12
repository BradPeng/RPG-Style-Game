// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAttack(hb, _direction, _force, _dmg){
	with (instance_create_layer(x, y, "Instances",  o_enemy_hitbox)) {
		mask_index = hb;
		if (place_meeting(x, y, o_player)) {
			HurtPlayer(_direction, _force, _dmg);	
		}
		instance_destroy();
	}
	
}