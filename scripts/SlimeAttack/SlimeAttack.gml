// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slime_attack(){
	// how fast to move
	var _spd = enemy_speed;

	// just started the attack
	if (sprite_index != attack_sprite) {
		sprite_index = attack_sprite;
		image_index = 0;
		with (instance_create_layer(x, y, "Instances", obj_enemy_hitbox)) {
			source_object = other.id;	
			sprite_index = other.hitbox_sprite
			if (other.x_to < other.x) {
				image_xscale = -1
			}
			source_damage = 5;
			source_direction = point_direction(other.x, other.y, other.x_to, other.y_to);
			source_force = 50
		}
		
		if (x_to < x) {
			image_xscale = -1
		}
	}
	// don't move while getting ready to jump
	if (image_index < 8) {
		_spd = 0;	
	}
	
	// freeze animation midair and also after landing finishes
	if (floor(image_index) == 11 or floor(image_index) == 22) {
		image_speed = 0;	
	}
	 
	// how far we have to jump
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// begin landing animation when near end
	if (_distance_to_go < 20) {
		image_speed = 1;
	}
	
	// Move
	if (_distance_to_go > _spd) {
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_spd, dir);
		v_speed = lengthdir_y(_spd, dir);
		
		// start moving and collide if needed
		if (enemy_tile_collision()) {
			x_to = x;
			y_to = y;
			image_speed = 1;
		}
	} else {
		x = x_to;
		y = y_to;
		
		if (floor(image_index) == 22) {
			state_target = ENEMYSTATE.CHASE;
			state_wait_duration = 15;
			state = ENEMYSTATE.WAIT;
			image_speed = 0;
		} 
	}
}