if (!global.gamePaused) {
	if (enemyScript[state] != -1) {
		with(instanceShadow) {
			image_xscale = 30/(other.z) + 0.9;
			image_yscale = 30/(other.z) + 0.9;
		}
		script_execute(enemyScript[state]);	
	}
	depth = -bbox_bottom;
}