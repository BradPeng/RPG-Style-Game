// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bat_chase(){
	sprite_index = sprMove;
	if (instance_exists(target)) {
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed) {
			h_speed = lengthdir_x(enemySpeed, dir)	
			v_speed = lengthdir_y(enemySpeed, dir)	
		} else {
			h_speed = lengthdir_x(_distanceToGo, dir)	
			v_speed = lengthdir_y(_distanceToGo, dir)	
		}
		
		if (h_speed != 0) {
			image_xscale = sign(h_speed);	
		}
		
		enemy_tile_collision();
	}	
}