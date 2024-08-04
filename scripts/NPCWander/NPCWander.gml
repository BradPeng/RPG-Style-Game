// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NPCWander(){
	
	
	// At destination or given up
	if ((x == x_to and y == y_to) || timePassed > npcWanderDistance / npcSpeed) {
		sprite_index = sprIdle;
		image_index = CARDINAL_DIR
		h_speed = 0;
		v_speed = 0;
		
		// new target destination
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
			x_to = x + lengthdir_x(npcWanderDistance, dir);
			y_to = y + lengthdir_y(npcWanderDistance, dir);
		}
	} else { // Move toward new destination
		sprite_index = move_sprite;
		var _total_frames = sprite_get_number(sprite_index) / 4;
		image_index = local_frame + (CARDINAL_DIR * _total_frames);
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
		if (local_frame >= _total_frames) {
			local_frame -= _total_frames
		}	
		timePassed++;
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		var _speedThisFrame = npcSpeed;
		
		// make sure we don't overshoot destination
		if (_distance_to_go < npcSpeed) {
			_speedThisFrame = _distance_to_go	
		}
		
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_speedThisFrame, dir);
		v_speed = lengthdir_y(_speedThisFrame, dir);
		direction = dir;
		
		enemy_tile_collision();
		
	}
}