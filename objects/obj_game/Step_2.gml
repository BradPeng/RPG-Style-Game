if (keyboard_check_pressed(vk_escape) and !instance_exists(obj_transition)) {
	global.game_paused = !global.game_paused;	
	
	if (global.game_paused) {
		with (all) {
			game_paused_image_speed = image_speed;
			image_speed = 0;
		}
	} else {
		with (all) {
			image_speed = game_paused_image_speed;	
		}
	}
}