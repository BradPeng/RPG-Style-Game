function SlimeDie(){
	sprite_index = sprDie;
	image_speed = 1;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) {
		dir = point_direction(x, y, xTo, yTo);
		//hSpeed = lengthdir_x(enemySpeed, dir);
		//vSpeed = lengthdir_y(enemySpeed, dir);
		hSpeed = 0;
		vSpeed = 0;
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);	
		}
		
		EnemyTileCollision();
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