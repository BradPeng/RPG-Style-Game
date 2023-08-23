// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageAttackS1(){
	if (levitationHeight <= 2 * pi) {
		levitationHeight += pi/60;	
	} else {
		levitationHeight = 0;	
	}
	
	sprite_index = s_mage_attack;
	
	if (attackTimer <= 0) {
		var randomNumber = irandom_range(1, 3);
		attackTimer = attackCooldown; // Reset the timer
		
		if (randomNumber == 1) {
			// Shoot one
		    var projectile = instance_create_layer(x, y, "Instances", o_enemy_projectile);
    
		    // Calculate direction towards player
		    var dir = point_direction(x, y, o_player.x, o_player.y);
    
		    // Set projectile's speed and direction
		    projectile.speed = 3; // Adjust this value as needed
		    projectile.direction = dir;
		    projectile.sprite_index = s_nebula_effect
		    projectile.damageToPlayer = 10;
			projectile.force = 50;
			
		} else if (randomNumber == 2) {
			attackTimer = 200;
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
			    var _proj = instance_create_layer(x + xOffset, y + yOffset - levitationHeight - 20, "Instances", o_mage_nebula_projectile);
				_proj.sprite_index = s_nebula_effect;
				_proj.alarm[1] = 30 * (i + 1);
				_proj.spd = 7;
			}
		} else if (randomNumber == 3) {
			var projectile = instance_create_layer(x, y, "Instances", o_mage_tracking_projectile);
    
		    // Set projectile's speed and direction
		    projectile.speed = 3; 
		    projectile.damageToPlayer = 10;
			projectile.force = 50;
		}
	} else {
	    attackTimer--;
	}
}