// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerThrow(){
	with(global.i_lifted) {
		lifted = false;
		persistent = false;
		thrown = true
		
		z = 13;
		throwPeakHeight = z + 10;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = 13/throwPeakHeight * 0.5;
		throwPercent = throwStartPercent
		direction = other.direction
		xstart = x;
		ystart = y;  
	}
	
	player_act_out_animation(spr_player_lift);
	global.i_lifted = noone;
	idle_sprite = spr_player;
	run_sprite = spr_player_run;
}