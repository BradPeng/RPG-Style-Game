/// @description Progress Transistion

with(o_player) {
	if (o_player.state != PlayerStateDead) {
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
		with (o_player) {
			state = PlayerStateFree;	
		}
		instance_destroy();	
	}
}