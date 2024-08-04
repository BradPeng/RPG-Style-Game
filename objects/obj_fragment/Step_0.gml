if(!global.gamePaused) {
	if(bounceCount != 0) {
		bounce += (pi * bounceSpeed);	
		if (bounce > pi) {
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		
		z = sin(bounce) * bounceHeight;
	} else {
		z = 0;	
	}
	
	// Deteriorate
	deteriorate++;
	if (deteriorate > deteriorateAfter) {
		image_alpha -= 1/deteriorateTime;
		if (image_alpha <= 0) {
			instance_destroy();	
		}
	}
	
	// Friction
	fric = 0.05;
	if (z == 0) {
		fric = 0.1;	
	}
	
	// Move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	// stop moving if fragment collides with the wall
	var _collision_id = instance_place(x, y, obj_solid);
	if (_collision_id != noone and _collision_id != obj_player.id) {
		spd = 0;	
	}
	
	spd = max(spd - fric, 0);
}