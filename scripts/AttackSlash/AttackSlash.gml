// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash() {

	// Lag state
	if (alarm[1] != 0 and alarm[1] != -1) {

		if (keyRight) direction = 0;
		if (keyUp) direction = 90
		if (keyDown) direction = 270;
		if (keyLeft) direction = 180;
		
		// Check chain attack
		if (keyAttack) {
			chainAttack = true;
		}
	
	// End of lag state	
	} else if (alarm[1] == 0) {
		state = PlayerStateFree;
		animationEnd = false;	
		
	// Normal animation	
	} else {
		if (sprite_index != s_player_attack_slash) {
		
			sprite_index = s_player_attack_slash
			localFrame = 0;
			image_index = 0;
		
			// clear hit list
			if (!ds_exists(hitByAttackList, ds_type_list)) {
				hitByAttackList = ds_list_create();	
			}
			ds_list_clear(hitByAttackList);
		
		}

		CalcAttack(s_player_attac_slash_hb, 5, 1)
		AnimateCardinalSprite();
	}
	
	// When animation ends, begin lag timer unless we are chaining an attack
	if (animationEnd) {
		if (chainAttack) {
			stateAttack = AttackSlashB
			chainAttack = false
			
			// If we chain attack, the first attack's lag should end early
			alarm[1] = -1
		} else {
			if (alarm[1] == -1) {
				alarm[1] = 10;	
			} 
		}
	}
}