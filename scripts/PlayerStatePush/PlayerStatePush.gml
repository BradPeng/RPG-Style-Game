// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_push() {
	if (!key_left) {
		state = player_state_free;	
	}
	//image_speed = 1;
	sprite_index = spr_player_push
	animate_cardinal_sprite();
	x--;
	global.i_pushing.x--;
}