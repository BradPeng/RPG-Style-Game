function MageIdle(){
	MageLevitate();
	
	if (instance_exists(o_player) and point_distance(x, y, o_player.x, o_player.y) < enemyAggroRadius) {
		state = ENEMYSTATE.ATTACK;
	}
}