// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CastShield(){
	if (sprite_index != s_player_cast) {
		sprite_index = s_player_cast
		localFrame = 0;
		image_index = 0;
		
		if (global.playerHealth > 1) {
			var _y;
			switch (CARDINAL_DIR) {
				case 0: //right
					_x = 16;
					_y = -10;
					break;
				case 1: // up
					_x = 0;
					_y = - 30;
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
			with (instance_create_layer(x + _x, y + _y, "Instances", o_cast_shield)) {
				hp = 10 + 15 * global.playerBloodAuraLevel 
				image_index = round(other.direction/90)
			}
			global.playerHealth -= 1
		}
	}

	
	animate_cardinal_sprite();
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
}