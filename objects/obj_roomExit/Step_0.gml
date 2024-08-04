if (instance_exists(obj_player) and position_meeting(obj_player.x, obj_player.y, id)) {
	if (!instance_exists(obj_transition) and obj_player.state != player_state_dead) {
		global.targetRoom = targetRoom;
		global.target_x = target_x;
		global.target_y = target_y;
		global.targetDirection = obj_player.direction;
		with (obj_player) {
			state = player_state_transition;	
		}
		room_transition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}
}