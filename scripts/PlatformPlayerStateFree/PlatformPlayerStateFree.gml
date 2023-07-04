// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformPlayerStateFree(){
	image_speed = 1;
	
	if (!IsOnGround(o_solid)) {
		vSpeed += gravityAcceleration;
				
		// set jump/fall sprite
		if (vSpeed <= 0) {
			sprite_index = s_platform_player_jump;
		} else if (vSpeed > 0 and state == PlatformPlayerStateFree) {
			sprite_index = s_platform_player_fall;
		}
		
		//short hopping
		//if (up_release and vSpeed < -6) {
		//	vSpeed = -3;
		//}
	} else { // on the ground
		vSpeed = 0;
					
		// set either idle or run animation
		if (hSpeed == 0) {
			sprite_index = s_platform_player_idle;
		} else {
			sprite_index = s_platform_player_run;
		}
		
		//Jumping code
		if (keyUp) {
			
			sprite_index = s_platform_player_land
			alarm[1] = 1 // jump lag;
			state = PlatformPlayerJumpState;
		}
	}
	
	
	if (keyRight or keyLeft) {
		hSpeed += (keyRight - keyLeft) * acceleration;
		hSpeed = clamp(hSpeed, -maxSpeed, maxSpeed);
				
	} else {
		PlatformApplyFriction(acceleration);
	}
	
	//Change direction of sprite
	if (hSpeed != 0) {
		image_xscale = sign(hSpeed);
	}
		
			
	PlatformMove(o_solid)
}