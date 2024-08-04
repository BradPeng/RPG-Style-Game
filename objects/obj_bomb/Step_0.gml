/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused) {
	
	bomb_tick--;
	if (bomb_tick == 0) {
		flash = 0.75;
		bomb_stage++;
		bomb_tick = bomb_tick_rate[bomb_stage];
	}
	
	if (bomb_tick < 0) {
		y -= z; // forces bomb to be on the ground
		if (lifted) {
			player_drop_item();
		}
		instance_destroy();
	}
}