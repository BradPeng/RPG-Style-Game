function slime_die(){
	sprite_index = die_sprite;
	entity_shadow = false;
	image_speed = 1;
	is_solid = false;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > enemy_speed) {
		dir = point_direction(x, y, x_to, y_to);
		//h_speed = lengthdir_x(enemy_speed, dir);
		//v_speed = lengthdir_y(enemy_speed, dir);
		h_speed = 0;
		v_speed = 0;
		if (h_speed != 0) {
			image_xscale = sign(h_speed);	
		}
		
		enemy_tile_collision();
	} else {
		x = x_to;
		y = y_to;
	}
	
	// sprite_get_speed(sprite_index)/ game_get_speed(gamespeed_fps) is the number of frames we advance per step of the game
	// when the current image_index + the next step is going to be greater than the last frame
	// means we are currently on the last frame
	if (image_index + sprite_get_speed(sprite_index)/ game_get_speed(gamespeed_fps) >= image_number) {
		instance_destroy();
	}
}