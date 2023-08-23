/// @description Insert description here
// You can write your code in this editor


// Set initial position and speed
target = o_player; // The player object to follow


// Calculate initial direction towards the player
direction = point_direction(x, y, target.x, target.y);
if (shrinking) {
	image_yscale -= 0.05;	
	image_xscale -= 0.05;	
}

if (image_xscale <= 0) {
	instance_destroy();	
}
