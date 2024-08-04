// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageMove(){
	if (movementType) {
		theta += theta_speed;
		if (theta >= 360) {
			theta -= 360;
		}
		//var _dir = point_direction(x, y, centerX + lengthdir_x(circleRadius, theta), centerY + lengthdir_y(circleRadius, theta))
		//x += lengthdir_x(2, _dir);
		//y += lengthdir_y(2, _dir);
		//centerX += irandom_range(-5, 5);
		//centerY += irandom_range(-5, 5);
		x = centerX + lengthdir_x(circleRadius, theta);
		y = centerY + lengthdir_y(circleRadius, theta);
		
		var _player = instance_find(obj_player, 0);
		//x = _player.x + lengthdir_x(circleRadius, theta);
		//y = _player.y + lengthdir_y(circleRadius, theta);
		//x = mouse_x + lengthdir_x(circleRadius, theta);
		//y = mouse_y + lengthdir_y(circleRadius, theta);
	} else {
		if ((x <= x_to - 10 or x >= x_to + 10) and (y<= y_to -10 or y >= y_to + 10)) {

			dir = point_direction(x, y, x_to, y_to);
			x += lengthdir_x(2, dir);
			y += lengthdir_y(2, dir);
			
		} else {
			
			x_to = irandom_range(300, 350)
			y_to = irandom_range(300, 350)
			centerX = x_to + circleRadius;
			centerY = y_to + circleRadius;
			theta = point_direction(centerX, centerY, x, y)
			print(theta);
			
			movementType = !movementType	
		}
	}
}