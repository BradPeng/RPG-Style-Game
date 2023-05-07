// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack(){
	// how fast to move
	var _spd = enemySpeed;
	
	// don't move while getting ready to jump
	if (image_index < 8) {
		_spd = 0;	
	}
	
	// freeze animation midair and also after landing finishes
	if (floor(image_index) == 11 or floor(image_index) == 22) {
		image_speed = 0;	
	}

	 
	// how far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	// begin landing animation when near end
	if (_distanceToGo < 20) {
		image_speed = 1;
	}
	
	// Move
	if (_distanceToGo > _spd) {
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);	
		}
		
		// start moving and collide if needed
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		
		if (floor(image_index) == 22) {
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}