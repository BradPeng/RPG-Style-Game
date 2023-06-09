// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BatWander(){
	sprite_index = sprMove;
	image_speed = 1.0;
	// At destination or given up
	if ((x == xTo and y == yTo) || timePassed > enemyWanderDistance / enemySpeed) {
		hSpeed = 0;
		vSpeed = 0;
		
		// new target destination
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} else { // Move toward new destination
		timePassed++;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		
		// make sure we don't overshoot destination
		if (_distanceToGo < enemySpeed) {
			_speedThisFrame = _distanceToGo	
		}
		
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		
		// face direction of movement
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);	
		}
		
		EnemyTileCollision();
		
	}
	
	// check for aggro
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(o_player) and point_distance(x, y, o_player.x, o_player.y) < enemyAggroRadius) {
			state = ENEMYSTATE.CHASE;
			target = o_player; // optional to make slime follow something other than player
		}
		
	}
}