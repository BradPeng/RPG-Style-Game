// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NPCWander(){
	
	
	// At destination or given up
	if ((x == xTo and y == yTo) || timePassed > npcWanderDistance / npcSpeed) {
		sprite_index = sprIdle;
		image_index = CARDINAL_DIR
		hSpeed = 0;
		vSpeed = 0;
		
		// new target destination
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
			xTo = x + lengthdir_x(npcWanderDistance, dir);
			yTo = y + lengthdir_y(npcWanderDistance, dir);
		}
	} else { // Move toward new destination
		sprite_index = sprMove;
		var _totalFrames = sprite_get_number(sprite_index) / 4;
		image_index = local_frame + (CARDINAL_DIR * _totalFrames);
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
		if (local_frame >= _totalFrames) {
			local_frame -= _totalFrames
		}	
		timePassed++;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = npcSpeed;
		
		// make sure we don't overshoot destination
		if (_distanceToGo < npcSpeed) {
			_speedThisFrame = _distanceToGo	
		}
		
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		direction = dir;
		
		EnemyTileCollision();
		
	}
}