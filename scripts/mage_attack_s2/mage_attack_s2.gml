// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mage_attack_s2(){
	mage_levitate();
	if (attack_timer <= 0) {
		with (instance_create_layer(x, y-60, "Instances", obj_p_mage_projectile)) {
			spd = 5;
			var _direction_to_player = point_direction(x, y, obj_player.x, obj_player.y);
			direction = _direction_to_player + random_range(-30, 30);
			sprite_index = spr_sunburn
			 damage_to_player = 10;
			force = 50;
			alarm[1] = 30
		}
		attack_timer = 10
	} else {
		attack_timer--;	
	}
}