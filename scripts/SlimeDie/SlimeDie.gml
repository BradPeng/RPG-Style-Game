function SlimeDie(){
	sprite_index = sprDie;
	entityShadow = false;
	image_speed = 1;
	is_solid = false;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) {
		dir = point_direction(x, y, xTo, yTo);
		//h_speed = lengthdir_x(enemySpeed, dir);
		//v_speed = lengthdir_y(enemySpeed, dir);
		h_speed = 0;
		v_speed = 0;
		if (h_speed != 0) {
			image_xscale = sign(h_speed);	
		}
		
		enemy_tile_collision();
	} else {
		x = xTo;
		y = yTo;
	}
	
	// sprite_get_speed(sprite_index)/ game_get_speed(gamespeed_fps) is the number of frames we advance per step of the game
	// when the current image_index + the next step is going to be greater than the last frame
	// means we are currently on the last frame
	if (image_index + sprite_get_speed(sprite_index)/ game_get_speed(gamespeed_fps) >= image_number) {
		instance_destroy();
	}
}