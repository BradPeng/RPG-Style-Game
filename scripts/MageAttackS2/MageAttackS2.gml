// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageAttackS2(){
	MageLevitate();
	with (instance_create_layer(x, y, "Instances", p_mage_projectile)) {
		spd = 5;
		direction = random_range(0, 359);
		sprite_index = s_sunburn
		 damageToPlayer = 10;
			force = 50;
				alarm[1] = 30
	}
}