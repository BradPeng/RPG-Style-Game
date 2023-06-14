// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash(){
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

	CalcAttack(s_player_attac_slash_hb)

	AnimateCardinalSprite();
	if (keyAttack) {
		chainAttack = true;
	}
	
	if (animationEnd) {
		if (chainAttack) {
			stateAttack = AttackSlashB
			//state = PlayerStateAttack	
			chainAttack = false
		} else {
			state = PlayerStateFree;
			animationEnd = false;
		}
	}
}