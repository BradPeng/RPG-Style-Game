// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mage_attack_s1(){
	mage_levitate();
	mage_move();
	// Prepare to enter phase 2
	if (enemy_hp <= 75) {
		if (phase2Dialogue == false) {
			new_text_box("Okay bro now I'm mad", 1);
			action_textbox = new_text_box("Prepare for my ultimate form!", 1);
			phase2Dialogue = true;
		}
		
		if (action_textbox != -1 and !instance_exists(action_textbox)) {
			state = MAGESTATE.ATTACK2;
			sprite_index = spr_mage_final;
			attack_timer = 80;
			action_textbox = -1;
		}
	} else {
		sprite_index = spr_mage_attack;
	
		if (attack_timer <= 0) {
			var _random_number = irandom_range(0, 0);
	
		
			if (_random_number == 1) {
				attack_timer = 180;
				// Shoot one
			    var _projectile = instance_create_layer(x, y-60, "Instances", p_mage_projectile);
    
			    // Calculate direction towards player
			    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    
			    // Set projectile's speed and direction
			    _projectile.spd = 3; // Adjust this value as needed
			    _projectile.direction = _dir;
			    _projectile.sprite_index = spr_nebula_effect
			    _projectile.damage_to_player = 10;
				_projectile.force = 50;
				_projectile.alarm[1] = 30
			} else if (_random_number == 2) {
				attack_timer = 480;
				// Nebula attack
				var _circle_radius = 70; // Adjust this value to set the radius of the circle
				var _num_objects = 8; // Adjust this value to set the number of objects

				for (var _i = 0; _i < _num_objects; _i++) {
				    var _angle = _i * 360 / _num_objects; // Calculate angle in degrees
				    var _radians = degtorad(_angle); // Convert angle to radians
    
				    // Calculate the position offsets based on the angle and radius
				    var _x_offset = _circle_radius * cos(_radians);
				    var _y_offset = _circle_radius * sin(_radians);
    
				    // Create the object at the calculated position
				    var _proj = instance_create_layer(x + _x_offset, y + _y_offset - levitation_height - 60, "Instances", obj_mage_nebula_projectile);
					_proj.sprite_index = spr_nebula_effect;
					_proj.alarm[1] = 30 * (i + 1);
					_proj.spd = 7;
				}
			} else if (_random_number == 3) {
				// tracking projectile
				attack_timer = 360;
				var _projectile = instance_create_layer(x, y-60, "Instances", obj_mage_tracking_projectile);
			
			    // Set projectile's speed and direction
			    _projectile.spd = 3;
			    _projectile.damage_to_player = 10;
				_projectile.force = 50;
				_projectile.alarm[1] = 30
			}
		} else {
		    attack_timer--;
		}
	}
}