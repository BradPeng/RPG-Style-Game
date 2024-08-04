// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){
	animate_cardinal_sprite();
	if (animationEnd) {
		state = player_state_free;
		animationEnd = false;
	}	

	if (animationEndScript != -1 and actionAnimationEnd) {
		script_execute(animationEndScript);	
		animationEndScript = -1;
		endActionFrame = -1
	}
}