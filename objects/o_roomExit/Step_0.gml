if (instance_exists(o_player) and position_meeting(o_player.x, o_player.y, id)) {
	if (!instance_exists(o_transition) and o_player.state != PlayerStateDead) {
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = o_player.direction;
		with (o_player) {
			state = PlayerStateTransition;	
		}
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}
}