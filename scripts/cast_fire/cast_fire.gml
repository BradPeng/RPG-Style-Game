// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cast_fire(){
	if (sprite_index != spr_player_cast) {
		
		sprite_index = spr_player_cast
		localFrame = 0;
		image_index = 0;
		
		if (global.player_health > 1) {
			// clear hit list
			if (!ds_exists(hitByAttackList, ds_type_list)) {
				hitByAttackList = ds_list_create();	
			}
			ds_list_clear(hitByAttackList);
			var _x;
			var _y;
			switch (CARDINAL_DIR) {
				case 0: //right
					_x = 16;
					_y = -10;
					break;
				case 1: // up
					_x = 0;
					_y = - 21;
					break
				case 2: // left
					_x = -16;
					_y = -10;
					break
				case 3:
					_x = 0;
					_y = 12;
					break;
				default: 
					_x = 0;
					_y = 0;
			
			}	
			with (instance_create_layer(x + _x, y + _y, "Instances", obj_cast_fire)) {
				direction = other.direction;
				direction = CARDINAL_DIR * 90;
				var _scale = 1 + 0.5 * global.player_blood_aura_level
				image_xscale = _scale 
				image_yscale = _scale
				switch direction {
					case 0:
						break;
					case 90: image_angle = 90; break;
					case 180: image_xscale *= -1; break;
					case 270: image_angle = 270; break
				}
				speed = 6;
			}
			global.player_health -= 1
		}
	}

	
	animate_cardinal_sprite();
	if (animationEnd) {
		state = player_state_free;
		animationEnd = false;
	}
}