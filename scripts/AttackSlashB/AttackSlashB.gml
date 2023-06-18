// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlashB() {
	// Check chain attack
	if (keyAttack) {
		chainAttack = true;
	}
	
	// Lag state
	if (alarm[1] != 0 and alarm[1] != -1) {
		// do nothing
		
	// End of lag state	
	} else if (alarm[1] == 0) {
		state = PlayerStateFree;
		animationEnd = false;	
		
	// Normal animation	
	} else {
		if (sprite_index != s_player_attack_slash_b) {
		
			sprite_index = s_player_attack_slash_b
			localFrame = 0;
			image_index = 0;
		
			// clear hit list
			if (!ds_exists(hitByAttackList, ds_type_list)) {
				hitByAttackList = ds_list_create();	
			}
			ds_list_clear(hitByAttackList);
		
		}

		CalcAttack(s_player_attack_slash_b_hb)
		AnimateCardinalSprite();
	}
	
	// When animation ends, begin lag timer unless we are chaining an attack
	if (animationEnd) {
		if (chainAttack) {
			stateAttack = AttackTrust
			chainAttack = false
			
			// If we chain attack, the first attack's lag should end early
			alarm[1] = -1
		} else {
			if (alarm[1] == -1) {
				alarm[1] = 5;	
			} 
		}
	}
}