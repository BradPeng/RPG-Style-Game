// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHook(){
	h_speed = 0;
	vSpeed = 0;
	
	// if just got into this state
	if (sprite_index != spr_player_hook) {
		hook = 0;
		hookX = 0;
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		//update sprite
		sprite_index = spr_player_hook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	// Extend/retract hook
	var _speedHookTemp = speedHook;
	
	// if we aren't extending, we should be retracting
	if (hookStatus != HOOKSTATUS.EXTENDING) {
		_speedHookTemp = -speedHook;	
	}
	hook += _speedHookTemp;
	switch(image_index) { // which direction are we shooting the hook in?
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
	
	// hook state machine
	switch (hookStatus) {
		case HOOKSTATUS.EXTENDING:
			// finish extending
			if (hook >= distanceHook) hookStatus = HOOKSTATUS.MISSED;
			
			// check for hit
			var _hookHit = collision_circle(x + hookX, y + hookY, 4, p_entity, false, true);
			if (_hookHit != noone and global.iLifted != _hookHit) {
				// act depending on what is hit
				switch (_hookHit.entityHookable) {
					default: // not hookable
						if (object_is_ancestor(_hookHit, p_hostile_mob)) {
							HurtEnemy(_hookHit, 1, id, 5);
							hookStatus = HOOKSTATUS.MISSED;
						} else {
							if (_hookHit.entityHitScript != -1) {
								with(_hookHit) {
									script_execute(entityHitScript);	
								}
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
						break;
					case 1:
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
						break;
					case 2:
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
						break;
				}
			}
			break;
		
		
		// Pull entity towards the player
		case HOOKSTATUS.PULLTOPLAYER:
			with (hookedEntity) {
			// make the x and y of the object x/y of player + position of hook
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
			break;
			
		case HOOKSTATUS.PULLTOENTITY:
			switch (image_index) {
				case 0: x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;	
			}
			break;
	}
	
	// Finish retract and end state
	if (hook <= 0) {
		hookedEntity = noone;
		state = player_state_free;
	}
}