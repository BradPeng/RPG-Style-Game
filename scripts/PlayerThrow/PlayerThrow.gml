// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_throw(){
	with(global.i_lifted) {
		lifted = false;
		persistent = false;
		thrown = true
		
		z = 13;
		throw_peak_height = z + 10;
		throw_distance = entity_throw_distance;
		throw_distance_travelled = 0;
		throw_start_percent = 13/throw_peak_height * 0.5;
		throw_percent = throw_start_percent
		direction = other.direction
		xstart = x;
		ystart = y;  
	}
	
	player_act_out_animation(spr_player_lift);
	global.i_lifted = noone;
	idle_sprite = spr_player;
	run_sprite = spr_player_run;
}