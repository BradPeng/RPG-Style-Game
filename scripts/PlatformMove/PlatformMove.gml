// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformMove(collision_object){
	//Horizontal Collisions
	if (place_meeting(x + hSpeed, y, collision_object)) {
		while (!place_meeting(x + sign(hSpeed),y, collision_object)) {
			x += sign(hSpeed);
		}
		hSpeed = 0;
	}

	x += hSpeed;

	if (place_meeting(x, y + vSpeed, collision_object)) {
		while (!place_meeting(x, y + sign(vSpeed), collision_object)) {
			y += sign(vSpeed);
		}
		vSpeed = 0;
	}

	y += vSpeed;
}