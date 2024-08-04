// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_liftable(ID){
	 if (global.iLifted == noone) {
		player_act_out_animation(spr_player_lift);
		spriteIdle = spr_player_carry;
		spriteRun = spr_player_carry_run;
		
		global.iLifted = ID;
		with (global.iLifted) {
			lifted = true;
			persistent = true;
		}
	 }
}