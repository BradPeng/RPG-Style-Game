function MageIdle(){
	if (levitationHeight <= 2 * pi) {
		levitationHeight += pi/60;	
	} else {
		levitationHeight = 0;	
	}
	
	if (instance_exists(o_player) and point_distance(x, y, o_player.x, o_player.y) < enemyAggroRadius) {
		state = ENEMYSTATE.ATTACK;
	}
}