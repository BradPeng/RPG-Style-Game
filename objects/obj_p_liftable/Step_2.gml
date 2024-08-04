/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!global.game_paused) {
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
			var _throw_distance_int = 0
			_throw_distance_int = throw_distance
			throw_distance_travelled = min(throw_distance_travelled + 3, _throw_distance_int);
			x = xstart + lengthdir_x(throw_distance_travelled, direction);
			y = ystart + lengthdir_y(throw_distance_travelled, direction);
			var _collision_id = instance_place(x, y, obj_solid);
			if (_collision_id != noone and _collision_id != obj_player.id) {
				thrown = false;
				grav = 0.1;
			}
			throw_percent = throw_start_percent + lerp(0, 1 - throw_start_percent, throw_distance_travelled / throw_distance);
			z = throw_peak_height * sin(throw_percent * pi);
			if (throw_distance == throw_distance_travelled) {
				thrown = false;
				if (entity_throw_break) {
					instance_destroy();	
				}
			}
		} else {
			// object start falling back to earth (already thrown)
			if (z > 0) {
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0 && entity_throw_break) {
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