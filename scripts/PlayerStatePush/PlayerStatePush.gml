// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStatePush() {
	if (!keyLeft) {
		state = PlayerStateFree;	
	}
	//image_speed = 1;
	sprite_index = s_player_push
	AnimateCardinalSprite();
	x--;
	global.iPushing.x--;
}