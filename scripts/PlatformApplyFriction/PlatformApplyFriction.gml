// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformApplyFriction(amount){
	
	//First check to see if we're moving
	if (hSpeed != 0) {
		if (abs(hSpeed) - amount > 0) {
			hSpeed -= amount * image_xscale;
		}
		else {
			hSpeed = 0;
		}
	}

}