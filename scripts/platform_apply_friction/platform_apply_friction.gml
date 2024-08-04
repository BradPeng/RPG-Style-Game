// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platform_apply_friction(_amount){
	
	//First check to see if we're moving
	if (h_speed != 0) {
		if (abs(h_speed) - _amount > 0) {
			h_speed -= _amount * image_xscale;
		}
		else {
			h_speed = 0;
		}
	}

}