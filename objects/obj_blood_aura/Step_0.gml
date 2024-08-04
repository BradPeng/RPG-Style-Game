if (instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y;
}
var _scale = global.player_blood_aura_level;
image_xscale = _scale;
image_yscale = _scale;
/*switch (global.player_blood_aura_level) {
	case 0: 
		image_xscale = 0;
		image_yscale = 0;
		break
	case 1: 

}*/