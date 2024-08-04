// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlatformPlayerStateFree(){
	image_speed = 1;
	mask_index = spr_platform_player_idle;
	
	if (!IsOnGround(obj_solid)) {
		vSpeed += gravityAcceleration;
				
		// set jump/fall sprite
		if (vSpeed <= 0) {
			sprite_index = spr_platform_player_jump;
		} else if (vSpeed > 0 and state == PlatformPlayerStateFree) {
			sprite_index = spr_platform_player_fall;
		}
		
		//short hopping
		if (keyUpRelease and vSpeed < -6) {
			vSpeed = -5;
		}
	} else { // on the ground
		vSpeed = 0;
					
		// set either idle or run animation
		if (h_speed == 0) {
			sprite_index = spr_platform_player_idle;
		} else {
			sprite_index = spr_platform_player_run;
		}
		
		//Jumping code
		if (keyUp) {
			
			sprite_index = spr_platform_player_land
			alarm[1] = 1 // jump lag;
			state = PlatformPlayerJumpState;
		}
	}
	
	
	if (keyRight or keyLeft) {
		h_speed += (keyRight - keyLeft) * acceleration;
		h_speed = clamp(h_speed, -maxSpeed, maxSpeed);
				
	} else {
		PlatformApplyFriction(acceleration);
	}
	
	//Change direction of sprite
	if (h_speed != 0) {
		image_xscale = sign(h_speed);
	}
		
			
	PlatformMove(obj_solid)
	
	// Edge Grab
	var _falling = y - yprevious > 0;
	var _wasntWall = !position_meeting(x + grabWidth * image_xscale, yprevious, obj_solid);
	var _isWall = position_meeting(x + grabWidth * image_xscale, y, obj_solid);
	
	if (_falling and _wasntWall and _isWall and alarm[1] <= 0) {
		h_speed = 0;
		vSpeed = 0;
		
		//align to edge horizontally
		while (!place_meeting(x + image_xscale, y, obj_solid)) {
			x += image_xscale;
		}
		
		//align to edge vertically
		while (position_meeting(x + grabWidth * image_xscale, y + 1, obj_solid)) {
			y -= 1;
		}
		
		//Change sprite and state
		sprite_index = spr_platform_player_hang;
		state = PlatformPlayerEdgeGrabState;
	}
}