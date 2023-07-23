/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused) {
	
	bombTick--;
	if (bombTick == 0) {
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if (bombTick < 0) {
		y -= z; // forces bomb to be on the ground
		if (lifted) {
			PlayerDropItem();
		}
		instance_destroy();
	}
}