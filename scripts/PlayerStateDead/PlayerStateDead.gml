// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	h_speed = 0;
	vSpeed = 0;
	global.player_blood_aura_level = 0;
	// if just got into dead state
	if (sprite_index != spr_player_dead) {
		local_frame = 0;
		sprite_index = spr_player_dead;
	} else {
		if (!animation_end) {
			animate_cardinal_sprite();	
		} else if (alarm[0] ==-1) {
			alarm[0] = 60;
		}
	}
}