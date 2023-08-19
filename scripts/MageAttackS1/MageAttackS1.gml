// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageAttackS1(){
	if (levitationHeight <= 2 * pi) {
		levitationHeight += pi/60;	
	} else {
		levitationHeight = 0;	
	}
	
	sprite_index = s_mage_attack;
	
	if (fireboltTimer <= 0) {
    var projectile = instance_create_layer(x, y, "Instances", o_enemy_projectile);
    
    // Calculate direction towards player
    var dir = point_direction(x, y, o_player.x, o_player.y);
    
    // Set projectile's speed and direction
    projectile.speed = 3; // Adjust this value as needed
    projectile.direction = dir;
    projectile.sprite_index = s_nebula_effect
    projectile.damageToPlayer = 10;
	projectile.force = 50;
	fireboltTimer = fireboltCooldown; // Reset the timer
} else {
    fireboltTimer--;
}
}