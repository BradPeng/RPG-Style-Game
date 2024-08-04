// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if (_distanceToGo > enemySpeed) {
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		h_speed = lengthdir_x(enemySpeed, dir);
		v_speed = lengthdir_y(enemySpeed, dir);
		
		if (h_speed != 0) {
			image_xscale = -sign(h_speed);	
		}
		
		// if we collide, stop where we are
		if (enemy_tile_collision()) {
			xTo = x;
			yTo = y;
		}
		
	} else { // snap to destination
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