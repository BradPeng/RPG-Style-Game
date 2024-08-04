/// @description Progress Transistion

with(obj_player) {
	if (obj_player.state != PlayerStateDead) {
		state = PlayerStateTransition;	
	}
}

if (leading == OUT) {
	percentage += min(1, percentage + TRANSITION_SPEED);
	
	if (percentage >= 1) {
		room_goto(target);	
		leading = IN;
	}
} else { // leading == IN
	percentage = max(0, percentage - TRANSITION_SPEED);
	
	if (percentage <= 0) {
		with (obj_player) {
			state = PlayerStateFree;	
		}
		instance_destroy();	
	}
}