// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hostile_mob_hurt(){
	sprite_index = hurt_sprite;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	var _total_frames = sprite_get_number(sprite_index) / 4;
	if (_distance_to_go > enemy_speed ) {
		image_speed = 0;
		image_index = local_frame + (CARDINAL_DIR * _total_frames);
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		direction = dir;
		// if we collide, stop where we are
		if (enemy_tile_collision()) {
			x_to = x;
			y_to = y;
		}
		
	} else { // snap to destination
		hurt_stun_duration_current = 0
		x = x_to;
		y = y_to;
		
		// only return to prev state if enemy was not attacking;
		// if enemy was attacking, chase instead
		if (state_previous != ENEMYSTATE.ATTACK) {
			state = state_previous;	
		} else {
			state = ENEMYSTATE.CHASE;	
		}
	}
		
}