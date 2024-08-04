// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_drop_item(){
	with (obj_player) {
		global.iLifted = noone;
		spriteIdle = spr_player;
		spriteRun = spr_player_run;
	}
}