// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hostile_mob_wander(){
	sprite_index = move_sprite;
	image_speed = 0;
	// At destination or given up
	if ((x == x_to and y == y_to) || time_passed > enemy_wander_distance / enemy_speed) {
		
		// Make sure enemy finishs their movement animation before stopping
		if (local_frame != 0) {
			var _total_frames = sprite_get_number(sprite_index) / 4;
			image_index = local_frame + (CARDINAL_DIR * _total_frames);
			local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
			if (local_frame >= _total_frames) {
				local_frame = 0;
			}	
		} else {
			sprite_index = idle_sprite;
			image_index = CARDINAL_DIR
			local_frame = 0;
			h_speed = 0;
			v_speed = 0;
			local_frame = 0;
		
			// new target destination
			if (++wait >= wait_duration) {
				wait = 0;
				time_passed = 0;
				dir = point_direction(x,y,xstart,ystart) + irandom_range(-45, 45); // always point toward the startish position, so we don't wander too far away from spawn point
				x_to = x + lengthdir_x(enemy_wander_distance, dir);
				y_to = y + lengthdir_y(enemy_wander_distance, dir);
			}
		}
	} else { // Move toward new destination
		image_speed = 0;
		sprite_index = move_sprite;
		var _total_frames = sprite_get_number(sprite_index) / 4;
		image_index = local_frame + (CARDINAL_DIR * _total_frames);
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
		
		if (local_frame >= _total_frames) {
			local_frame -= _total_frames
		}	
		
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
	
		
		direction = dir;
		enemy_tile_collision();
	}
	
	// check for aggro
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < enemyAggroRadius) {
			if (target.state == player_state_dead) {
				state = ENEMYSTATE.WANDER;
			} else {
				state = ENEMYSTATE.CHASE;
				target = obj_player; // optional to make slime follow something other than player
			}
		}
		
		
	}
}