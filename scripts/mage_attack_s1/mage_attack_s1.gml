// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mage_attack_s1(){
	mage_levitate();
	mage_move();
	// Prepare to enter phase 2
	if (enemyHP <= 75) {
		if (phase2Dialogue == false) {
			NewTextBox("Okay bro now I'm mad", 1);
			actionTextbox = NewTextBox("Prepare for my ultimate form!", 1);
			phase2Dialogue = true;
		}
		
		if (actionTextbox != -1 and !instance_exists(actionTextbox)) {
			state = MAGESTATE.ATTACK2;
			sprite_index = spr_mage_final;
			attackTimer = 80;
			actionTextbox = -1;
		}
	} else {
		sprite_index = spr_mage_attack;
	
		if (attackTimer <= 0) {
			var randomNumber = irandom_range(0, 0);
	
		
			if (randomNumber == 1) {
				attackTimer = 180;
				// Shoot one
			    var projectile = instance_create_layer(x, y-60, "Instances", p_mage_projectile);
    
			    // Calculate direction towards player
			    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    
			    // Set projectile's speed and direction
			    projectile.spd = 3; // Adjust this value as needed
			    projectile.direction = dir;
			    projectile.sprite_index = spr_nebula_effect
			    projectile.damageToPlayer = 10;
				projectile.force = 50;
				projectile.alarm[1] = 30
			} else if (randomNumber == 2) {
				attackTimer = 480;
				// Nebula attack
				var circleRadius = 70; // Adjust this value to set the radius of the circle
				var numObjects = 8; // Adjust this value to set the number of objects

				for (var i = 0; i < numObjects; i++) {
				    var angle = i * 360 / numObjects; // Calculate angle in degrees
				    var radians = degtorad(angle); // Convert angle to radians
    
				    // Calculate the position offsets based on the angle and radius
				    var xOffset = circleRadius * cos(radians);
				    var yOffset = circleRadius * sin(radians);
    
				    // Create the object at the calculated position
				    var _proj = instance_create_layer(x + xOffset, y + yOffset - levitationHeight - 60, "Instances", obj_mage_nebula_projectile);
					_proj.sprite_index = spr_nebula_effect;
					_proj.alarm[1] = 30 * (i + 1);
					_proj.spd = 7;
				}
			} else if (randomNumber == 3) {
				// tracking projectile
				attackTimer = 360;
				var projectile = instance_create_layer(x, y-60, "Instances", obj_mage_tracking_projectile);
			
			    // Set projectile's speed and direction
			    projectile.spd = 3;
			    projectile.damageToPlayer = 10;
				projectile.force = 50;
				projectile.alarm[1] = 30
			}
		} else {
		    attackTimer--;
		}
	}
}