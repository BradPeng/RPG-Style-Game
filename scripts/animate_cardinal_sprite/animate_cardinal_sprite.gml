// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animate_cardinal_sprite(){
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (CARDINAL_DIR * _totalFrames);
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

	if (floor(local_frame) == endActionFrame) {
		actionAnimationEnd = true;	
	} else {
		actionAnimationEnd = false;	
	}
	
	if (local_frame >= _totalFrames) {
		animation_end = true;
		local_frame -= _totalFrames
	} else {
		animation_end = false;	
	}

	
}