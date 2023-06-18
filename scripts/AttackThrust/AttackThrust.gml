// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackTrust() {
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
	CalcAttack(s_player_attack_slash_b_hb)
	
	AnimateCardinalSprite();
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
}