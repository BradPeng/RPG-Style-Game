// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animate_cardinal_sprite(){
	var _total_frames = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (CARDINAL_DIR * _total_frames);
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	if (floor(local_frame) == end_action_frame) {
		action_animation_end = true;	
	} else {
		action_animation_end = false;	
	}
	
	if (local_frame >= _total_frames) {
		animation_end = true;
		local_frame -= _total_frames
	} else {
		animation_end = false;	
	}

	
}