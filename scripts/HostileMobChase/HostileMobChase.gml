// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HostileMobChase(){
	sprite_index = sprMove;
	if (instance_exists(target)) {
		image_speed = 0;
		sprite_index = sprMove;
		var _totalFrames = sprite_get_number(sprite_index) / 4;
		image_index = localFrame + (CARDINAL_DIR * _totalFrames);
		localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
		
		if (localFrame >= _totalFrames) {
			localFrame -= _totalFrames
		}	
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed) {
			hSpeed = lengthdir_x(enemySpeed, dir)	
			vSpeed = lengthdir_y(enemySpeed, dir)	
		} else {
			hSpeed = lengthdir_x(_distanceToGo, dir)	
			vSpeed = lengthdir_y(_distanceToGo, dir)	
		}
		direction = dir;
		
		EnemyTileCollision();
	}	
	
	// check if close enough to attack
	if (instance_exists(target) and point_distance(x, y, target.x, target.y) <= enemyAttackRadius) {
		if (target.state == PlayerStateDead) {
			state = ENEMYSTATE.WANDER;	
		}
		state = ENEMYSTATE.ATTACK;
	}
}