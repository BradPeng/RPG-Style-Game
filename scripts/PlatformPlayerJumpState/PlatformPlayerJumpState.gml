// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformPlayerJumpState(){
	
	if (alarm[1] != -1 and sprite_index == spr_platform_player_land) { // still preparing to jump
		//do nothing
	} else if (alarm[1] == -1 and sprite_index == spr_platform_player_land) { // ready to jump
		vSpeed = jumpHeight;
		sprite_index = spr_platform_player_jump
		state = PlatformPlayerStateFree
		PlatformMove(obj_solid)
	}
}