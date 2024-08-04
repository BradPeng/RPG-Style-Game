// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bat_wander(){
	sprite_index = move_sprite;
	image_speed = 1.0;
	// At destination or given up
	if ((x == x_to and y == y_to) || time_passed > enemy_wander_distance / enemy_speed) {
		h_speed = 0;
		v_speed = 0;
		
		// new target destination
		if (++wait >= wait_duration) {
			wait = 0;
			time_passed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
			x_to = x + lengthdir_x(enemy_wander_distance, dir);
			y_to = y + lengthdir_y(enemy_wander_distance, dir);
		}
	} else { // Move toward new destination
		time_passed++;
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		var _speed_this_frame = enemy_speed;
		
		// make sure we don't overshoot destination
		if (_distance_to_go < enemy_speed) {
			_speed_this_frame = _distance_to_go	
		}
		
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_speed_this_frame, dir);
		v_speed = lengthdir_y(_speed_this_frame, dir);
		
		// face direction of movement
		if (h_speed != 0) {
			image_xscale = sign(h_speed);	
		}
		
		enemy_tile_collision();
		
	}
	
	// check for aggro
	if (++aggro_check >= aggro_check_duration) {
		aggro_check = 0;
		if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < enemy_aggro_radius) {
			state = ENEMYSTATE.CHASE;
			target = obj_player; // optional to make slime follow something other than player
		}
		
	}
}