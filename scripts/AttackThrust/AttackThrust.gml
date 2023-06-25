// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackTrust() {
	// Lag state
	if (alarm[1] != 0 and alarm[1] != -1) {
		// do nothing
		
	// End of lag state	
	} else if (alarm[1] == 0) {
		state = PlayerStateFree;
		animationEnd = false;	
		
	// Normal animation	
	} else {
		if (sprite_index != s_player_thrust) {
		
			sprite_index = s_player_thrust
			localFrame = 0;
			image_index = 0;
		
			// clear hit list
			if (!ds_exists(hitByAttackList, ds_type_list)) {
				hitByAttackList = ds_list_create();	
			}
			ds_list_clear(hitByAttackList);
		
		}

		CalcAttack(s_player_thrust_hb, 5, 20)
		AnimateCardinalSprite();
	}
	
	// When animation ends, begin lag timer
	if (animationEnd) {
		if (alarm[1] == -1) {
			alarm[1] = 10;	
		} 
	}
}