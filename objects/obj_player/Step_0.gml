// inputs
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D")) 
key_up = keyboard_check(ord("W")) 
key_down = keyboard_check(ord("S"))
keyBloodAuraUp = keyboard_check_pressed(vk_up);
keyBloodAuraDown = keyboard_check_pressed(vk_down);
key_activate = keyboard_check_pressed(vk_space);
key_attack = keyboard_check(vk_shift);
key_item = keyboard_check_pressed(vk_control);
key_item_select_up = keyboard_check_pressed(ord("E"));
key_item_select_down = keyboard_check_pressed(ord("Q"));
key_cast = keyboard_check_pressed(ord("F"));
key_spell_select_up = keyboard_check_pressed(vk_right);
key_spell_select_down = keyboard_check_pressed(vk_left);
key_dodge = keyboard_check_pressed(ord("G"))
keyUpRelease = keyboard_check_released(ord("W"));
blood_aura_magnitude = (keyBloodAuraUp - keyBloodAuraDown);
input_direction = point_direction(0, 0, key_right - key_left, key_down - key_up);
input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0); 

if (!global.gamePaused) {
	
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	if (!invulnerable and global.player_blood_aura_level != 0) {
		DrainPlayerHP(global.player_blood_aura_level/FRAME_RATE)
	}
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom

