/// @description Insert description here
// You can write your code in this editor
if (global.game_paused) {
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
	pause_option_selected += (key_down - key_up);
	 if (pause_option_selected >= array_length(pause_option)) pause_option_selected = 0;
	 if (pause_option_selected < 0) pause_option_selected = array_length(pause_option) - 1;
	 
	 key_activate = keyboard_check_pressed(vk_space);
	 if (key_activate) {
		 switch (pause_option_selected) {
			case 0: //continue	 
				global.game_paused = false;
				with (all) {
					game_paused_image_speed = image_speed;
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