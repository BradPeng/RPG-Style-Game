// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hostile_mob_attack(){
	if (sprite_index != attack_sprite) {
		
		sprite_index = attack_sprite
		local_frame = 0;
		image_index = 0;
		
		if (instance_exists(obj_player)) {
			enemy_attack(hitbox_sprite, point_direction(x,y,obj_player.x, obj_player.y), enemyForceTouch, 10);
		}
	}

	
	animate_cardinal_sprite();
	if (animation_end) {
		if (instance_exists(obj_player) and (obj_player.state != PlayerStateDead)) {
			state = ENEMYSTATE.CHASE;
		} else {
			state = ENEMYSTATE.WANDER;
		}
		animation_end = false;
	}
}