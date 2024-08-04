// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_liftable(_id){
	 if (global.i_lifted == noone) {
		player_act_out_animation(spr_player_lift);
		idle_sprite = spr_player_carry;
		run_sprite = spr_player_carry_run;
		
		global.i_lifted = _id;
		with (global.i_lifted) {
			lifted = true;
			persistent = true;
		}
	 }
}