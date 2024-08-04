// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_drop_item(){
	with (obj_player) {
		global.i_lifted = noone;
		idle_sprite = spr_player;
		run_sprite = spr_player_run;
	}
}