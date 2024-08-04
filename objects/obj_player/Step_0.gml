// inputs
keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D")) 
keyUp = keyboard_check(ord("W")) 
keyDown = keyboard_check(ord("S"))
keyBloodAuraUp = keyboard_check_pressed(vk_up);
keyBloodAuraDown = keyboard_check_pressed(vk_down);
key_activate = keyboard_check_pressed(vk_space);
key_attack = keyboard_check(vk_shift);
key_item = keyboard_check_pressed(vk_control);
key_item_select_up = keyboard_check_pressed(ord("E"));
key_item_select_down = keyboard_check_pressed(ord("Q"));
key_cast = keyboard_check_pressed(ord("F"));
key_spell_select_up = keyboard_check_pressed(vk_right);
keySpellSelectDown = keyboard_check_pressed(vk_left);
key_dodge = keyboard_check_pressed(ord("G"))
keyUpRelease = keyboard_check_released(ord("W"));
blood_aura_magnitude = (keyBloodAuraUp - keyBloodAuraDown);
input_direction = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
input_magnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0); 

if (!global.gamePaused) {
	
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	if (!invulnerable and global.player_blood_aura_level != 0) {
		DrainPlayerHP(global.player_blood_aura_level/FRAME_RATE)
	}
	flash = max(flash - 0.05, 0);
}

depth = -bbox_bottom

