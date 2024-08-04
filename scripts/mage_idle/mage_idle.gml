function mage_idle(){	

	if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < enemy_aggro_radius) {
		var _action_textbox = -1;
		if (aggro_dialogue == false) {
			aggro_dialogue = true
			
			new_text_box("Oh? You're approaching me?", 1)
			new_text_box("Instead of running away, you come right to me?", 1)
			action_textbox = new_text_box("Even though your grandfather, Joseph, told you the secret of The World,\n like an exam student scrambling to finish the problems\non an exam until the last moments before the chime?", 1)
		}
	}
	
	if (action_textbox != -1 and !instance_exists(action_textbox)) {
		// Start increasing z height. When reach treshold, enter attack state
		z += 0.5;
		if (z >= 15) {
			state = MAGESTATE.ATTACK;
			global.current_boss = id

			// reset action_textbox so it can be reused to enter attack state 2
			action_textbox = -1;
		}
	}
}