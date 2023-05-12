// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyFighterHurt(){
	sprite_index = sprHurt;
	localFrame = 0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if (_distanceToGo > enemySpeed or hurtStunDurationCurrent < hurtStunDurationTotal) {
		image_speed = 1;
		hurtStunDurationCurrent++;
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