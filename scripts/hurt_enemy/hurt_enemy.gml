// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_enemy(_enemy, _damage, _source, _knockback){
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemy_hp -= _damage;
			flash = 1;
			
			image_index = 0;
			// hurt or dead
			if (enemy_hp <= 0) {
				
				state = ENEMYSTATE.DIE;
			} else {
				
				// remember state before being hurt so we can return to it
				if (state != ENEMYSTATE.HURT) {
					state_previous = state;
				}
				state = ENEMYSTATE.HURT;
				if (_knockback != 0) {
					var _knock_direction = point_direction(x, y, _source.x, _source.y);
					x_to = x - lengthdir_x(_knockback, _knock_direction);
					y_to = y - lengthdir_y(_knockback, _knock_direction);
				}
			}
		}	
	}
}