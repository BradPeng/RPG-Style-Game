if (!global.gamePaused) {
	if (enemy_script[state] != -1) {
		script_execute(enemy_script[state]);	
	}
	depth = -bbox_bottom;
}