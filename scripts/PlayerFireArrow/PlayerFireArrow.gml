// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerFireArrow(){
	with (instance_create_depth(floor(x), floor(y) - 15, depth, o_arrow)) {
		direction = other.direction;
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index = CARDINAL_DIR;
		speed = 12;
	}
}