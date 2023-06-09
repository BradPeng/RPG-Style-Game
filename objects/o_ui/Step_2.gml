/// @description Insert description here
// You can write your code in this editor
if (global.gamePaused) {
	keyUp = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	pauseOptionSelected += (keyDown - keyUp);
	 if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	 if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) - 1;
	 
	 keyActivate = keyboard_check_pressed(vk_space);
	 if (keyActivate) {
		 switch (pauseOptionSelected) {
			case 0: //continue	 
				global.gamePaused = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
				break;
			case 1: 
				with(o_game) instance_destroy();
				SaveGame();
				game_restart();
				break
			case 2: // save and quit to desktop
				SaveGame();
				game_end();
				break;
		 }
	 }
}