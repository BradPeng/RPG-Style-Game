// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mage_move(){
	if (movement_type) {
		theta += theta_speed;
		if (theta >= 360) {
			theta -= 360;
		}
		//var _dir = point_direction(x, y, center_x + lengthdir_x(circle_radius, theta), center_y + lengthdir_y(circle_radius, theta))
		//x += lengthdir_x(2, _dir);
		//y += lengthdir_y(2, _dir);
		//center_x += irandom_range(-5, 5);
		//center_y += irandom_range(-5, 5);
		x = center_x + lengthdir_x(circle_radius, theta);
		y = center_y + lengthdir_y(circle_radius, theta);
		
		var _player = instance_find(obj_player, 0);
		//x = _player.x + lengthdir_x(circle_radius, theta);
		//y = _player.y + lengthdir_y(circle_radius, theta);
		//x = mouse_x + lengthdir_x(circle_radius, theta);
		//y = mouse_y + lengthdir_y(circle_radius, theta);
	} else {
		if ((x <= x_to - 10 or x >= x_to + 10) and (y<= y_to -10 or y >= y_to + 10)) {

			dir = point_direction(x, y, x_to, y_to);
			x += lengthdir_x(2, dir);
			y += lengthdir_y(2, dir);
			
		} else {
			
			x_to = irandom_range(300, 350)
			y_to = irandom_range(300, 350)
			center_x = x_to + circle_radius;
			center_y = y_to + circle_radius;
			theta = point_direction(center_x, center_y, x, y)
			print(theta);
			
			movement_type = !movement_type	
		}
	}
}