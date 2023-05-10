if (!global.gamePaused) {
	depth = -bbox_bottom;	
	if (lifted and instance_exists(o_player)) {
		if (o_player.sprite_index != s_player_lift) {
			x = o_player.x;
			y = o_player.y;
			z = 25;
			depth = o_player.depth - 1;
		}
	}
	
	if (!lifted) {
		if (thrown) {
			isSolid = true;
			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance);
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			var _collisionId = instance_place(x, y, o_solid);
			if (_collisionId != noone and _collisionId != o_player.id) {
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
		isSolid = false;
		
	}
}

flash = max(flash -0.04, 0);
