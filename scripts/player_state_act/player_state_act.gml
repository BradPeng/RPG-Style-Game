// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_act(){
	animate_cardinal_sprite();
	if (animation_end) {
		state = player_state_free;
		animation_end = false;
	}	

	if (animation_end_script != -1 and action_animation_end) {
		script_execute(animation_end_script);	
		animation_end_script = -1;
		end_action_frame = -1
	}
}