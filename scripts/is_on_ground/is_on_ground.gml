// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_on_ground(ground_object){
	return place_meeting(x, y + 1, ground_object)
}