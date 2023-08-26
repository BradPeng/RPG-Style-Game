function MageIdle(){	
	if (instance_exists(o_player) and point_distance(x, y, o_player.x, o_player.y) < enemyAggroRadius) {
		var _actionTextBox = -1;
		if (aggro_dialogue == false) {
			aggro_dialogue = true
			
			NewTextBox("Oh? You're approaching me?", 1)
			NewTextBox("Instead of running away, you come right to me?", 1)
			aggro_textbox = NewTextBox("Even though your grandfather, Joseph, told you the secret of The World,\n like an exam student scrambling to finish the problems\non an exam until the last moments before the chime?", 1)
		}
	}
	
	if (aggro_textbox != -1 and !instance_exists(aggro_textbox)) {
			// Start increasing z height. When reach treshold, enter attack state
			z += 0.5;
			if (z >= 15) {
				state = ENEMYSTATE.ATTACK;
			}
		}
}