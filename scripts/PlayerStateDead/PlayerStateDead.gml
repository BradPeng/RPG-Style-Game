// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hSpeed = 0;
	vSpeed = 0;
	global.playerBloodAuraLevel = 0;
	// if just got into dead state
	if (sprite_index != s_player_dead) {
		localFrame = 0;
		sprite_index = s_player_dead;
	} else {
		if (!animationEnd) {
			AnimateCardinalSprite();	
		} else if (alarm[0] ==-1) {
			alarm[0] = 60;
		}
	}
}