// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CastFire(){
	
	if (sprite_index != s_player_cast) {
		
		sprite_index = s_player_cast
		localFrame = 0;
		image_index = 0;
		
		if (global.playerHealth > 1) {
			// clear hit list
			if (!ds_exists(hitByAttackList, ds_type_list)) {
				hitByAttackList = ds_list_create();	
			}
			ds_list_clear(hitByAttackList);
			with (instance_create_layer(x + 10, y - 20, "Instances", o_cast_fire)) {
				direction = other.direction;
				direction = CARDINAL_DIR * 90;
				speed = 5;
			}
			global.playerHealth -= 1
		}
	}

	
	PlayerAnimateSprite();
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
}