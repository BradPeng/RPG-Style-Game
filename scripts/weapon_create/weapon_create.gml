// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function weapon_create(
	_sprite = spr_weapon, 
	_weapon_length = 0, 
	_bullet_obj = obj_bullet, 
	_cooldown = 10,
	_num_bullets = 1,
	_spread = 0) {
	weapon = {
		sprite : _sprite,
		length : _weapon_length,
		bullet_obj : _bullet_obj,
		cooldown : _cooldown,
		num_bullets : _num_bullets,
		spread : _spread,
	}
	
	return weapon
}


