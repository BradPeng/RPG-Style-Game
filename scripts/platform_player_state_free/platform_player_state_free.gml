// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platform_player_state_free(){
	image_speed = 1;
	mask_index = spr_platform_player_idle;
	
	if (!is_on_ground(obj_solid)) {
		v_speed += gravityAcceleration;
				
		// set jump/fall sprite
		if (v_speed <= 0) {
			sprite_index = spr_platform_player_jump;
		} else if (v_speed > 0 and state == platform_player_state_free) {
			sprite_index = spr_platform_player_fall;
		}
		
		//short hopping
		if (keyUpRelease and v_speed < -6) {
			v_speed = -5;
		}
	} else { // on the ground
		v_speed = 0;
					
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
			state = platform_player_jump_state;
		}
	}
	
	
	if (keyRight or keyLeft) {
		h_speed += (keyRight - keyLeft) * acceleration;
		h_speed = clamp(h_speed, -maxSpeed, maxSpeed);
				
	} else {
		platform_apply_friction(acceleration);
	}
	
	//Change direction of sprite
	if (h_speed != 0) {
		image_xscale = sign(h_speed);
	}
		
			
	PlatformMove(obj_solid)
	
	// Edge Grab
	var _falling = y - yprevious > 0;
	var _wasnt_wall = !position_meeting(x + grabWidth * image_xscale, yprevious, obj_solid);
	var _is_wall = position_meeting(x + grabWidth * image_xscale, y, obj_solid);
	
	if (_falling and _wasnt_wall and _is_wall and alarm[1] <= 0) {
		h_speed = 0;
		v_speed = 0;
		
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
		state = platform_player_edge_grab_state;
	}
}