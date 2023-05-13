// carry out animation and optionally carry out 
// a script when the act ends
function PlayerActOutAnimation(sprite, endscript = -1){
	state = PlayerStateAct;
	sprite_index = sprite;
	
	animationEndScript = endscript;

	localFrame = 0;
	image_index = 0;
	AnimateCardinalSprite();
}