// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HostileMobHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	if (_distanceToGo > enemySpeed ) {
		image_speed = 0;
		image_index = local_frame + (CARDINAL_DIR * _totalFrames);
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		direction = dir;
		// if we collide, stop where we are
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
		
	} else { // snap to destination
		hurtStunDurationCurrent = 0
		x = xTo;
		y = yTo;
		
		// only return to prev state if enemy was not attacking;
		// if enemy was attacking, chase instead
		if (statePrevious != ENEMYSTATE.ATTACK) {
			state = statePrevious;	
		} else {
			state = ENEMYSTATE.CHASE;	
		}
	}
		
}