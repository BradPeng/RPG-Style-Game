// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bat_chase(){
	sprite_index = move_sprite;
	if (instance_exists(target)) {
		x_to = target.x;
		y_to = target.y;
		
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		image_speed = 1;
		dir = point_direction(x, y, x_to, y_to);
		if (_distance_to_go > enemy_speed) {
			h_speed = lengthdir_x(enemy_speed, dir)	
			v_speed = lengthdir_y(enemy_speed, dir)	
		} else {
			h_speed = lengthdir_x(_distance_to_go, dir)	
			v_speed = lengthdir_y(_distance_to_go, dir)	
		}
		
		if (h_speed != 0) {
			image_xscale = sign(h_speed);	
		}
		
		enemy_tile_collision();
	}	
}