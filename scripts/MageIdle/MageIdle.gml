function MageIdle(){	
	if (instance_exists(o_player) and point_distance(x, y, o_player.x, o_player.y) < enemyAggroRadius) {
		NewTextBox("Oh? You're approaching me?", 1)
		NewTextBox("Instead of running away, you come right to me?", 1)
		NewTextBox("Even though your grandfather, Joseph, told you the secret of The World,\n like an exam student scrambling to finish the problems\n on an exam until the last moments before the chime?", 1)
		
		
		//state = ENEMYSTATE.ATTACK;
	}
}