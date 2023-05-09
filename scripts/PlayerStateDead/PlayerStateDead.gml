// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hSpeed = 0;
	vSpeed = 0;
	global.playerBloodAuraLevel = 0;
	// if just got into dead state
	if (sprite_index != s_player_die and sprite_index != s_player_dead) {
		sprite_index = s_player_die;
		image_index = 0;
		image_speed = 0.7;
	}
	
	// Animation ending this frame?
	if (image_index + image_speed > image_number) {
		if (sprite_index == s_player_die) {
			image_speed = max(0, image_speed - 0.03)
			if (image_speed < 0.07) {
				image_index = 0;
				sprite_index = s_player_dead;
				image_speed = 1;
			}
		} else { // in the dead sprite
			image_speed = 0;
			image_index = image_number - 1; // last frame
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.SLIDE, rm_village); 
		}
	}
}