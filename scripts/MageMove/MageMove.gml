// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MageMove(){
	
	// Constants
	var desiredDistance = 100; // Adjust this value for the desired distance
	var circularRadius = 150; // Adjust this value for the circular path radius
	var angularSpeed = 2; // Adjust this value for circular movement speed

	// Calculate the direction to the player
	var directionToPlayer = point_direction(x, y, o_player.x, o_player.y);

	// Calculate the distance between the player and the enemy
	var distToPlayer = point_distance(x, y, o_player.x, o_player.y);

	// Calculate the target position for circular movement
	var targetX = o_player.x + lengthdir_x(desiredDistance, directionToPlayer);
	var targetY = o_player.y + lengthdir_y(desiredDistance, directionToPlayer);

	// Calculate the direction to the target position
	var directionToTarget = point_direction(x, y, targetX, targetY);

	// Calculate the difference between the two directions
	var directionDifference = directionToTarget - directionToPlayer;

	// Adjust the circular movement direction to maintain the desired distance
	var circularDirection = directionToPlayer + directionDifference;

	// Move towards the circular path with circular movement
	var moveSpeed = 2; // Adjust this value for circular movement speed
	motion_add(circularDirection, moveSpeed);

	speed = clamp(speed, -2, 2)


/*	// Constants
	var desiredDistance = 10; // Adjust this value for the desired distance

	// Calculate the distance between the player and the enemy
	var distToPlayer = point_distance(x, y, o_player.x, o_player.y);

	if (distToPlayer > desiredDistance) {
	    // If the distance is greater than the desired distance, move towards the player
	    var moveSpeed = 1; // Adjust this value for the enemy's movement speed
	    var moveDirection = point_direction(x, y, o_player.x, o_player.y);
	    motion_add(moveDirection, moveSpeed);
	} else if (distToPlayer < desiredDistance) {
	    // If the distance is less than the desired distance, move away from the player
	    var moveSpeed = 1; // Adjust this value for the enemy's movement speed
	    var moveDirection = point_direction(x, y, o_player.x, o_player.y) + 180; // Add 180 degrees to move away
	    motion_add(moveDirection, moveSpeed);
	}
	
	speed = clamp(speed, -2, 2)*/
}