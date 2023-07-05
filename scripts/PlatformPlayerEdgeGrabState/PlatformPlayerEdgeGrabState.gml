// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformPlayerEdgeGrabState(){
	if (keyDown) {
		state = PlatformPlayerStateFree;
		alarm[1] = 15; // edge grab timer
	}
		
	if (keyUp) {
		state = PlatformPlayerStateFree;
		vSpeed = jumpHeight;
		alarm[1] = 15;
	}
			
	// facing right, click left
	if (image_xscale = 1) {
		if (keyLeft) {
			state = PlatformPlayerStateFree;
			alarm[1] = 15;
		} 
		
	}
		
	// facing left, click right
	if (image_xscale = -1) {
		if (keyRight) {
			state = PlatformPlayerStateFree;
			alarm[1] = 15;
		}

	}
}