// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slime_hurt(){
	sprite_index = hurt_sprite;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	if (_distance_to_go > enemy_speed) {
		image_speed = 1;
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		
		if (h_speed != 0) {
			image_xscale = -sign(h_speed);	
		}
		
		// if we collide, stop where we are
		if (enemy_tile_collision()) {
			x_to = x;
			y_to = y;
		}
		
	} else { // snap to destination
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