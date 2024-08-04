// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtEnemy(_enemy, _damage, _source, _knockback){
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemyHP -= _damage;
			flash = 1;
			
			image_index = 0;
			// hurt or dead
			if (enemyHP <= 0) {
				
				state = ENEMYSTATE.DIE;
			} else {
				
				// remember state before being hurt so we can return to it
				if (state != ENEMYSTATE.HURT) {
					statePrevious = state;
				}
				state = ENEMYSTATE.HURT;
				if (_knockback != 0) {
					var _knockDirection = point_direction(x, y, _source.x, _source.y);
					x_to = x - lengthdir_x(_knockback, _knockDirection);
					y_to = y - lengthdir_y(_knockback, _knockDirection);
				}
			}
		}	
	}
}