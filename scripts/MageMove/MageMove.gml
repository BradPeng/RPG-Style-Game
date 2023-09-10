// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageMove(){
	theta += theta_speed;
	if (theta >= 360) {
		theta -= 360;
	}
	
	x = centerX + lengthdir_x(circleRadius, theta);
	y = centerY + lengthdir_y(circleRadius, theta);

}