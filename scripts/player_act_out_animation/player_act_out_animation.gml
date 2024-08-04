// carry out animation and optionally carry out 
// a script when the act ends
function player_act_out_animation(_sprite, _endscript = -1){
	state = player_state_act;
	sprite_index = _sprite;
	animationEndScript = _endscript;
	
	local_frame = 0;
	image_index = 0;

	animate_cardinal_sprite();
}