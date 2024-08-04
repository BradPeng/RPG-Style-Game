// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HostileMobWander(){
	sprite_index = sprMove;
	image_speed = 0;
	// At destination or given up
	if ((x == xTo and y == yTo) || timePassed > enemyWanderDistance / enemySpeed) {
		
		// Make sure enemy finishs their movement animation before stopping
		if (localFrame != 0) {
			var _totalFrames = sprite_get_number(sprite_index) / 4;
			image_index = localFrame + (CARDINAL_DIR * _totalFrames);
			localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
			if (localFrame >= _totalFrames) {
				localFrame = 0;
			}	
		} else {
			sprite_index = sprIdle;
			image_index = CARDINAL_DIR
			localFrame = 0;
			hSpeed = 0;
			vSpeed = 0;
			localFrame = 0;
		
			// new target destination
			if (++wait >= waitDuration) {
				wait = 0;
				timePassed = 0;
				dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
				xTo = x + lengthdir_x(enemyWanderDistance, dir);
				yTo = y + lengthdir_y(enemyWanderDistance, dir);
			}
		}
	} else { // Move toward new destination
		image_speed = 0;
		sprite_index = sprMove;
		var _totalFrames = sprite_get_number(sprite_index) / 4;
		image_index = localFrame + (CARDINAL_DIR * _totalFrames);
		localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
		
		if (localFrame >= _totalFrames) {
			localFrame -= _totalFrames
		}	
		
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
	
		
		direction = dir;
		EnemyTileCollision();
	}
	
	// check for aggro
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < enemyAggroRadius) {
			if (target.state == PlayerStateDead) {
				state = ENEMYSTATE.WANDER;
			} else {
				state = ENEMYSTATE.CHASE;
				target = obj_player; // optional to make slime follow something other than player
			}
		}
		
		
	}
}