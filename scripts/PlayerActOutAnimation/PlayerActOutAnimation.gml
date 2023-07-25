// carry out animation and optionally carry out 
// a script when the act ends
function PlayerActOutAnimation(sprite, endscript){
	state = PlayerStateAct;
	sprite_index = sprite;
	animationEndScript = endscript;
	
	localFrame = 0;
	image_index = 0;

	AnimateCardinalSprite();
}