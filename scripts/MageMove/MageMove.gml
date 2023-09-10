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
		x = centerX + lengthdir_x(circleRadius, theta);
		y = centerY + lengthdir_y(circleRadius, theta);
	} else {
		if ((x <= xTo - 10 or x >= xTo + 10) and (y<= yTo -10 or y >= yTo + 10)) {

			dir = point_direction(x, y, xTo, yTo);
			x += lengthdir_x(2, dir);
			y += lengthdir_y(2, dir);
			
		} else {
			
			xTo = irandom_range(300, 350)
			yTo = irandom_range(300, 350)
			centerX = xTo + circleRadius;
			centerY = yTo + circleRadius;
			theta = point_direction(centerX, centerY, x, y)
			print(theta);
			
			movementType = !movementType	
		}
	}
}