// inputs
keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D")) 
keyUp = keyboard_check(ord("W")) 
keyDown = keyboard_check(ord("S"))
keyBloodAuraUp = keyboard_check_pressed(vk_up);
keyBloodAuraDown = keyboard_check_pressed(vk_down);
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check(vk_shift);
keyItem = keyboard_check_pressed(vk_control);
keyItemSelectUp = keyboard_check_pressed(ord("E"));
keyItemSelectDown = keyboard_check_pressed(ord("Q"));
keyCast = keyboard_check_pressed(ord("F"));
keySpellSelectUp = keyboard_check_pressed(vk_right);
keySpellSelectDown = keyboard_check_pressed(vk_left);
keyDodge = keyboard_check_pressed(ord("G"))
keyUpRelease = keyboard_check_released(ord("W"));
blood_aura_magnitude = (keyBloodAuraUp - keyBloodAuraDown);
inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
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

