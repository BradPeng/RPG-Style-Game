// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platform_player_jump_state(){
	
	if (alarm[1] != -1 and sprite_index == spr_platform_player_land) { // still preparing to jump
		//do nothing
	} else if (alarm[1] == -1 and sprite_index == spr_platform_player_land) { // ready to jump
		v_speed = jump_height;
		sprite_index = spr_platform_player_jump
		state = platform_player_state_free
		platform_move(obj_solid)
	}
}