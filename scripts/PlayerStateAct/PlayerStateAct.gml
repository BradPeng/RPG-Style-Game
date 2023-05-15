// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){
	AnimateCardinalSprite();
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}	

	if (animationEndScript != -1 and actionAnimationEnd) {
		script_execute(animationEndScript);	
		animationEndScript = -1;
		endActionFrame = -1
	}
}