// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_hook(){
	h_speed = 0;
	v_speed = 0;
	
	// if just got into this state
	if (sprite_index != spr_player_hook) {
		hook = 0;
		hook_x = 0;
		hook_y = 0;
		hook_status = HOOKSTATUS.EXTENDING;
		hooked_entity = noone;
		
		//update sprite
		sprite_index = spr_player_hook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	// Extend/retract hook
	var _speed_hook_temp = speed_hook;
	
	// if we aren't extending, we should be retracting
	if (hook_status != HOOKSTATUS.EXTENDING) {
		_speed_hook_temp = -speed_hook;	
	}
	hook += _speed_hook_temp;
	switch(image_index) { // which direction are we shooting the hook in?
		case 0: hook_x = hook; break;
		case 1: hook_y = -hook; break;
		case 2: hook_x = -hook; break;
		case 3: hook_y = hook; break;
	}
	
	// hook state machine
	switch (hook_status) {
		case HOOKSTATUS.EXTENDING:
			// finish extending
			if (hook >= distance_hook) hook_status = HOOKSTATUS.MISSED;
			
			// check for hit
			var _hook_hit = collision_circle(x + hook_x, y + hook_y, 4, obj_p_entity, false, true);
			if (_hook_hit != noone and global.i_lifted != _hook_hit) {
				// act depending on what is hit
				switch (_hook_hit.entity_hookable) {
					default: // not hookable
						if (is_instance_of(_hook_hit, obj_p_hostile_mob)) {
							hurt_enemy(_hook_hit, 1, id, 5);
							hook_status = HOOKSTATUS.MISSED;
						} else {
							if (_hook_hit.entity_hit_script != -1) {
								with(_hook_hit) {
									script_execute(entity_hit_script);	
								}
								hook_status = HOOKSTATUS.MISSED;
							}
						}
						break;
					case 1:
						hook_status = HOOKSTATUS.PULLTOPLAYER;
						hooked_entity = _hook_hit;
						break;
					case 2:
						hook_status = HOOKSTATUS.PULLTOENTITY;
						hooked_entity = _hook_hit;
						break;
				}
			}
			break;
		
		
		// Pull entity towards the player
		case HOOKSTATUS.PULLTOPLAYER:
			with (hooked_entity) {
			// make the x and y of the object x/y of player + position of hook
				x = other.x + other.hook_x;
				y = other.y + other.hook_y;
			}
			break;
			
		case HOOKSTATUS.PULLTOENTITY:
			switch (image_index) {
				case 0: x += speed_hook; break;
				case 1: y -= speed_hook; break;
				case 2: x -= speed_hook; break;
				case 3: y += speed_hook; break;	
			}
			break;
	}
	
	// Finish retract and end state
	if (hook <= 0) {
		hooked_entity = noone;
		state = player_state_free;
	}
}