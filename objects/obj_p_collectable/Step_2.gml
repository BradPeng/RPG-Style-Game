/// @description Override Parent EndStep

flash = max(0, flash -0.05);
fric = 0.05;
if (z == 0) {
	fric = 0.1;	
}

// magnetize
if (instance_exists(obj_player)) {
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _dist = point_distance(x, y, _px, _py); 
	if (_dist < 16) {
		spd += 0.25;
		direction = point_direction(x, y, _px, _py);
		spd = min(spd, 3);
		fric = 0;
		if (_dist < 5) { //collect radius
			if (collect_script_arg != -1) {
				script_execute(collect_script, collect_script_arg);	
			} else if (collect_script != -1) {
				script_execute(collect_script);
			}
			
			instance_destroy();
		}
	}
}

if (bounce_count != 0) {
	bounce += (pi * bounce_speed);	
	if (bounce > pi) {
		bounce -= pi;
		bounce_height *= 0.6;
		bounce_count--;
	}
	z = sin(bounce) * bounce_height;
} else {
		z = 0;	
	}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd - fric, 0);
depth = -bbox_bottom;