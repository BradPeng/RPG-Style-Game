/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!global.gamePaused) {
	depth = -bbox_bottom;	
	if (lifted and instance_exists(obj_player)) {
		if (obj_player.sprite_index != spr_player_lift) {
			x = obj_player.x;
			y = obj_player.y;
			z = 25;
			depth = obj_player.depth - 1;
		}
	}
	
	if (!lifted) {
		if (thrown) {
			is_solid = true;
			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance);
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			var _collisionId = instance_place(x, y, obj_solid);
			if (_collisionId != noone and _collisionId != obj_player.id) {
				thrown = false;
				grav = 0.1;
			}
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelled / throwDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			if (throwDistance == throwDistanceTravelled) {
				thrown = false;
				if (entityThrowBreak) {
					instance_destroy();	
				}
			}
		} else {
			// object start falling back to earth (already thrown)
			if (z > 0) {
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0 && entityThrowBreak) {
					instance_destroy();
				}
			} else {
				grav = 0.1;	
			}
		}
	} else { // is lifted
		is_solid = false;
		
	}
}