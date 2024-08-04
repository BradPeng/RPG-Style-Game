/// @description Insert description here
// You can write your code in this editor
if (global.gamePaused) {
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	pauseOptionSelected += (key_down - key_up);
	 if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	 if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) - 1;
	 
	 key_activate = keyboard_check_pressed(vk_space);
	 if (key_activate) {
		 switch (pauseOptionSelected) {
			case 0: //continue	 
				global.gamePaused = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
				break;
			case 1: 
				with(obj_game) instance_destroy();
				save_game();
				game_restart();
				break
			case 2: // save and quit to desktop
				save_game();
				game_end();
				break;
		 }
	 }
}