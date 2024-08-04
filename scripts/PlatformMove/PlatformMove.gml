// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformMove(collision_object){
	//Horizontal Collisions
	if (place_meeting(x + h_speed, y, collision_object)) {
		while (!place_meeting(x + sign(h_speed),y, collision_object)) {
			x += sign(h_speed);
		}
		h_speed = 0;
	}

	x += h_speed;

	if (place_meeting(x, y + v_speed, collision_object)) {
		while (!place_meeting(x, y + sign(v_speed), collision_object)) {
			y += sign(v_speed);
		}
		v_speed = 0;
	}

	y += v_speed;
}